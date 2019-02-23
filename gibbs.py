import numpy as np
import scipy
import torch
import torch.nn.functional as F
import pyro
import pyro.distributions as dist
from tqdm import tqdm
import os
import argparse
from datasets import gaussian_dataset, load_bees_dataset, load_surgery_dataset, load_dataset
import pickle
from scipy.special import hyp2f1
from scipy.special import logsumexp
from scipy.stats import invwishart, multivariate_normal
from metrics import *
from utils import get_temporal_clustering, relabel_clustering_with_munkres_correspondences, compute_masks
from viz import *
from sklearn.metrics import normalized_mutual_info_score
from multivariate_normal_fast import MultivariateNormalFast
from torch.nn.utils.rnn import pack_padded_sequence, pad_packed_sequence, pad_sequence
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler, scale
from sklearn.mixture import GaussianMixture


# Implementation of the Beta-Geometric compound distribution
def lbeta(alpha, beta):
    return torch.lgamma(alpha) + torch.lgamma(beta) - torch.lgamma(alpha + beta)


def beta_geometric_logpdf(alpha, beta, k):
    return lbeta(alpha + 1, beta + k) - lbeta(alpha, beta)


def beta_geometric_trunc_cdf(alpha, beta, max_k=100):
    cdf = []
    runner = 0.
    for k in range(0, max_k):
        runner += np.exp(beta_geometric_logpdf(alpha, beta, k))
        cdf.append(runner.clone())
    return cdf


def beta_geometric_sample(alpha, beta, k, cdf=None):
    if cdf is None:
        cdf = beta_geometric_trunc_cdf(alpha, beta)
    u = dist.Uniform(0, 1).expand_by([k]).sample()
    return np.searchsorted(cdf, u)


# Typically set prior nu = d + 2, psi = eye(d) (d is feature dimensionality)
def normal_inverse_wishart_sample(mu_0, lamda, psi, nu):
    cov = invwishart.rvs(df=nu, scale=psi)
    mu = multivariate_normal.rvs(mean=mu_0, cov=cov/lamda)
    return (mu, cov)


def gibbs_sampler_a(n, m, s, delta, a, w, p, means, sigmas, x, a_type, a_bound, **kwargs):
    # Grab the helper arrays we'll be using
    vals = kwargs['vals']
    boundary_adjust = kwargs['boundary_adjust']
    early_locs = kwargs['early_locs']
    early_indices = kwargs['early_indices']
    late_locs = kwargs['late_locs']
    late_indices = kwargs['late_indices']

    # Set up the distribution
    mvnormal = MultivariateNormalFast(means, sigmas)

    # Get the lengths of each segment across all groups
    counts = torch.sum(a == vals[:, np.newaxis, np.newaxis], dim=(-1, -2))

    # For each group (sequence)
    for group in tqdm(np.random.permutation(range(n))):

        # Get the lengths of each segment within this group
        seq_counts = torch.sum(a[group] == vals[:, np.newaxis], dim=-1)

        # Also compute the boundaries of the segments
        # Boundaries correspond to the index just after the segment ends (first index that's not the segment)
        boundaries = np.cumsum(seq_counts).data.numpy()

        # Also stack up s repetitions of the segment weight vector
        # When sampling we'll imagine s different futures (each corresponding to different possible values of a_j)
        w_group = np.repeat(w[group][np.newaxis, :], s, 0)

        # Find the likelihood of the data (precomputing is faster when m and s are both large and k is reasonable)
        data_likelihood = mvnormal.log_prob(x[group].unsqueeze(-2))

        # Loop over the a_j's and resample them
        for j in tqdm(np.random.permutation(range(m[group])[a_bound * s:])):
            # This is a loop invariant; we don't compute this since it's slower
            # assert (np.all(boundaries == np.cumsum(seq_counts)))
            # assert (np.all(w_group == np.repeat(np.sort(a[group])[np.newaxis, :], s, 0)))

            # What's the current assignment for the item in question
            a_j_t = int(a[group][j])

            # Check if this corresponds to the masked area
            if a_j_t == s:
                continue

            # Find the segments that have non-zero counts (maybe move this out of the loop)
            non_zero_counts = np.array(seq_counts != 0).astype(bool)

            # All operations below are heavily vectorized
            # The main idea is to imagine s different futures, where each future substitutes a_j_t with a
            # different segment value
            # The code below only modifies the indices at the boundaries that need to be edited to construct these
            # futures
            early_conds = non_zero_counts[early_indices[a_j_t]]
            late_conds = non_zero_counts[(late_indices[a_j_t] + 1)]

            w_group[early_locs[a_j_t][early_conds], boundaries[early_indices[a_j_t]][early_conds]] = early_indices[a_j_t][early_conds]
            w_group[late_locs[a_j_t][late_conds], boundaries[late_indices[a_j_t]][late_conds] - 1] = (late_indices[a_j_t] + 1)[late_conds]

            w_group[vals[:a_j_t], boundaries[:a_j_t]] = vals[:a_j_t]
            w_group[vals[a_j_t + 1:], boundaries[a_j_t:-1] - 1] = vals[a_j_t + 1:]

            # Having constructed the futures, we examine data likelihood at only a few critical points which lie
            # at segment boundaries. The topic for the rest of the data points will not be affected by editing a_j.
            critical_points = np.unique(boundaries[:-1] - boundary_adjust[a_j_t][:-1])

            # Construct indexing into the data matrix for the critical points using the procedure
            z_after_critical = p.unsqueeze(0)[:, w_group[:, critical_points]][0].long()
            indices = np.indices(z_after_critical.shape)
            indices[0] = indices[1]
            indices[1] = z_after_critical

            # Calculate the data likelihood, under each of the different futures we've imagined
            data_log_prob = torch.sum(data_likelihood[critical_points][indices], dim=1)

            # Adjust the counts to remove a_j to correctly sample from the posterior
            counts[vals == a_j_t] -= 1.
            seq_counts[vals == a_j_t] -= 1.

            # Construct the conditional sampling distribution using adjusted counts from the collapsed Dirichlet prior
            if a_type == 'tied-across':
                # Dirichlet prior is shared by all groups
                adjusted_counts = np.log((counts.float() + delta))
            elif a_type == 'tied-within':
                # Dirichlet prior is shared within each group
                adjusted_counts = np.log((seq_counts.float() + delta))
            elif a_type == 'untied':
                # Dirichlet prior is not shared
                adjusted_counts = np.log(delta)

            total_log_prob = adjusted_counts + data_log_prob
            total_prob = F.softmax(total_log_prob, dim=-1)

            # Sample from the complete conditional
            a_j_tp1 = a[group][j] = dist.Categorical(total_prob).sample()

            # Readjust the counts with the new sample we've drawn
            counts[vals == a_j_tp1] += 1.
            seq_counts[vals == a_j_tp1] += 1.

            # Bookkeeping: adjust the boundaries of the segments now that we've changed a_j as well as the segments
            w_group[:, :] = w_group[a_j_tp1, :]
            if a_j_tp1 < a_j_t:
                boundaries[a_j_tp1:a_j_t] += 1
            elif a_j_tp1 > a_j_t:
                boundaries[a_j_t:a_j_tp1] -= 1

        # All the sampling is done, we simply set w for this group
        w[group] = w_group[0]

    return a, w


def gibbs_sampler_p(n, m, s, k, gamma, a, w, p, z, means, sigmas, x):
    # Sample p
    alt = MultivariateNormalFast(means, sigmas)
    # Iterate over each of the s segments
    for i in range(s):
        # We're sampling p_i here
        total_log_prob = torch.zeros(k)

        # Compute the likelihood of the data in segment i across all the groups, given that p_i = kth topic
        for group in range(n):
            # Data in the group that lies in segment i
            x_i = x[group][(torch.tensor(w[group]) == i)]

            # Check if there's actually any such data
            if x_i.shape[0] > 0:
                data_log_prob = alt.log_prob(x_i.unsqueeze(-2))
                data_log_prob = torch.sum(data_log_prob, dim=0)
                total_log_prob += data_log_prob

        total_prob = F.softmax(total_log_prob, dim=-1)

        p_i_tp1 = dist.Categorical(total_prob).sample()
        p[i] = p_i_tp1

    return p


def gibbs_sampler_p_constrained(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x, rho):
    # Sample p
    alt = MultivariateNormalFast(means, sigmas)
    for i in tqdm(range(s)):
        # We're sampling p_i here
        total_log_prob = torch.zeros(k)

        # Compute the likelihood of the data in segment i across all the groups, given that p_i = kth topic
        for group in range(n):
            # Data in the group that lies in segment i
            x_i = x[group][(torch.tensor(w[group]) == i)]

            # Check if there's actually any such data
            if x_i.shape[0] > 0:
                data_log_prob = alt.log_prob(x_i.unsqueeze(-2))
                data_log_prob = torch.sum(data_log_prob, dim=0)
                total_log_prob += data_log_prob

        # Calculate the prob. term that comes from collapsing the Dirichlet prior and introducing aux. Geometric vars

        # One-hot encode each procedure's token
        ident = (p[:s].unsqueeze(-1) == torch.arange(k).float()).transpose(0, 1).float()
        # Exclude the procedure token we're looking at right now from the calculations
        ident[:, i] = 0.
        # Calculate the rho sum
        beta = torch.matmul(ident, (rho + 1.).float()) + gamma
        rho_i = rho[i]
        total_log_prob += torch.log(np.repeat(torch.arange(rho_i + 1).float()[np.newaxis, :], k, 0) + beta.unsqueeze(1)).sum(dim=1)

        # Sample
        total_prob = F.softmax(total_log_prob, dim=-1)
        if i > 0: # This is making sure we can't have identical consecutive tokens; is this right?
            total_prob[p[i-1].long()] = 0
            norm = total_prob.sum()
            if norm > 0:
                total_prob /= total_prob.sum()
            else:
                total_prob = torch.ones(k)/k
        p[i] = dist.Categorical(total_prob).sample()

    return p


def gibbs_sampler_rho(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x, rho):
    # Sample rho
    for i in range(s - 1):
        # We're sampling rho_i here
        p_i = p[i]
        # One-hot encode each procedure's token
        ident = (p[:s].unsqueeze(-1) == torch.arange(k).float()).transpose(0, 1).float()
        # Exclude the procedure token we're looking at right now from the calculations
        ident[:, i] = 0.
        # Calculate the rho sum
        beta = torch.matmul(ident, (rho + 1.).float()) + gamma
        # Sample a new rho value
        rho[i] = torch.tensor(beta_geometric_sample(beta.sum() - 1, beta[p_i.long()] + 1, 1).squeeze())

    return rho


def gibbs_sampler_z(p, w):
    z = p.unsqueeze(0)[:, w][0]
    return z


def gibbs_sampler_mu_sigma(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x, rho, d, mu_0, lamda, psi, nu):
    # Sample means, sigmas
    for i in range(k):
        # Sample mu_i, sigma_i
        data = x[z == i]
        if data.shape[0] == 0:
            mu_0_prime = mu_0
            lamda_prime = lamda
            nu_prime = nu
            psi_prime = psi
        else:
            x_bar = torch.mean(data, dim=-2)

            self_outer = lambda x: np.outer(x, x)
            S = torch.tensor(np.cov(data, rowvar=False)).float()
            S = S * (data.shape[0] - 1) if data.shape[0] > 1. else S
            n_i = data.shape[0]

            # Find the parameters for the posterior that we're sampling
            # (see Wikipedia on Normal-inverse-Wishart distribution)
            mu_0_prime = (lamda * mu_0 + n_i * x_bar)/(lamda + n_i)
            lamda_prime = lamda + n_i
            nu_prime = nu + n_i
            psi_prime = psi + S + (lamda*n_i)/(lamda + n_i) * torch.tensor(self_outer(x_bar - mu_0))

        means_i, sigmas_i = normal_inverse_wishart_sample(mu_0_prime, lamda_prime, psi_prime, nu_prime)

        means[i] = torch.tensor(means_i)
        sigmas[i] = torch.tensor(sigmas_i)

    return means, sigmas


def gmm_initialization(k, x, masks):
    gmm = GaussianMixture(k, max_iter=1000)
    obs_gmm = [e.data.numpy() for i, s in enumerate(x) for e in s[masks[i] == 1]]
    gmm.fit(obs_gmm)
    return torch.tensor(gmm.means_).float(), torch.tensor(gmm.covariances_).float()


def run_gibbs(**kwargs):

    # Grab the data and masks
    x_train = kwargs['dataset']['x_data']
    print (x_train.shape)
    masks = kwargs['dataset']['masks_data']

    # Set the hyper-params
    gamma, delta, k, s = kwargs['gamma'], kwargs['delta'], kwargs['k_model'], kwargs['s_model']
    m, n, d = kwargs['dataset']['m_data'], len(kwargs['dataset']['w_data']), kwargs['dataset']['d_data']

    max_seq_len = max(m)

    nu = d + 2# default d + 2

    # Sample initial values
    # Uniform segment lengths for each sequence
    a = torch.zeros(n, max_seq_len).long()#dist.Categorical(torch.ones(s)/s).expand_by([n, max_seq_len]).sample()
    for i in range(max_seq_len):
        a[:, i] = torch.tensor(i % s)

    # Set the segment for the padded portions to be s
    a[masks == 0] = s

    w = np.sort(a, axis=1)

    # Sample the procedure point-wise by constraining a uniform prior over each bin using the previous token
    # p = torch.zeros(s)
    p = torch.zeros(s + 1)
    p[0] = dist.Categorical(torch.ones(k)/k).sample()
    for i in range(1, s):
        probs = torch.ones(k)/k
        probs[p[i-1].long()] = 0.
        probs /= probs.sum()
        p[i] = dist.Categorical(probs).sample()

    # The last step in the procedure corresponds to the masked areas
    p[-1] = k

    z = p.unsqueeze(0)[:, w][0]

    # Sample some initial values for rho
    rho = torch.tensor(beta_geometric_sample(torch.tensor(gamma), torch.tensor((k - 1) * gamma), s))
    rho[-1] = 0.

    # Initialize means and sigmas
    if kwargs['gmm_init']:
        means, sigmas = gmm_initialization(k, x_train, masks)
    else:
        means, sigmas = torch.zeros(k, d), np.repeat(torch.eye(d, d)[np.newaxis, :], k, 0)
        means, sigmas = gibbs_sampler_mu_sigma(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x_train, rho, d, torch.zeros(d), 1., torch.eye(d), d + 1)

    # Set up the history arrays
    history_a, history_p, history_rho = [], [], []
    history_m, history_s = [], []

    # Set up precomputed helper arrays for Gibbs sampling the segments
    helper_arrays = {}
    helper_arrays['vals'] = torch.arange(s)
    helper_arrays['boundary_adjust'] = [np.concatenate([np.zeros(i, dtype='int'), np.ones(s - i, dtype='int')]) for i in range(s)]
    helper_arrays['early_locs'] = [np.repeat(np.arange(i), i - np.arange(i)) for i in range(s)]
    helper_arrays['early_indices'] = [np.arange(i)[np.newaxis, :].repeat(i, 0)[np.triu_indices(i)] for i in range(s)]
    helper_arrays['late_locs'] = [np.repeat(np.arange(i + 1, s), np.arange(1, s - i)) for i in range(s)]
    helper_arrays['late_indices'] = [np.arange(i, s - 1)[np.newaxis, :].repeat(s - i - 1, 0)[np.tril_indices(s - i - 1)] for i in range(s)]

    # Run Gibbs sampling
    for iter in tqdm(range(kwargs['n_iters'])):

        # Resample p
        if kwargs['p_type'] == 'ind':
            p = gibbs_sampler_p(n, m, s, k, gamma, a, w, p, z, means, sigmas, x_train)
        elif kwargs['p_type'] == 'ind-tied':
            raise NotImplementedError
        elif kwargs['p_type'] == 'constrained':
            # Resample rho
            rho = gibbs_sampler_rho(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x_train, rho)
            # Resample p
            p = gibbs_sampler_p_constrained(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x_train, rho)

        # Resample a
        a, w = gibbs_sampler_a(n, m, s, delta, a, w, p, means, sigmas, x_train, kwargs['a_type'], kwargs['a_bound'], **helper_arrays)

        # Resample z
        z = gibbs_sampler_z(p, w)

        # Resample mus and sigmas
        means, sigmas = gibbs_sampler_mu_sigma(n, m, s, k, delta, gamma, a, w, p, z, means, sigmas, x_train, rho, d, torch.zeros(d), 1., torch.eye(d), nu)

        # Append to the histories
        history_a.append(a.clone())
        history_p.append(p.clone())
        history_rho.append(rho.clone())
        history_m.append(means.clone())
        history_s.append(sigmas.clone())

        # Log histories
        if iter % kwargs['log_freq'] == 0:
            pickle.dump((history_a, history_p, history_rho, history_m, history_s), open(kwargs['log'], 'wb'))


def evaluation(**kwargs):
    base_seed = kwargs['seed']
    num_seeds = kwargs['num_seeds']
    seeds_mean_nmi, seeds_mean_score = [], []
    seeds_mean_munkres, seeds_mean_rss, seeds_mean_sss, seeds_mean_lass = [], [], [], []
    for seed in tqdm(range(base_seed, base_seed + num_seeds)):
        kwargs['seed'] = seed
        log_path = get_log_name(kwargs['log'], **kwargs)
        result = evaluate_single_run(log_path, **kwargs)
        if result is not None:
            _, _, mean_nmi, mean_score, mean_munkres, mean_lass, mean_sss, mean_rss = result
            seeds_mean_nmi.append(mean_nmi)
            seeds_mean_score.append(mean_score)
            seeds_mean_munkres.append(mean_munkres)
            seeds_mean_rss.append(mean_rss)
            seeds_mean_lass.append(mean_lass)
            seeds_mean_sss.append(mean_sss)

    print("Average performance for %s." % (log_path.split("/")[-1]))
    print("NMI: %2.2f" % (np.mean(seeds_mean_nmi)))
    print("Munkres: %2.2f" % (np.mean(seeds_mean_munkres)))
    print("RSS: %2.2f" % (np.mean(seeds_mean_rss)))
    print("LASS: %2.2f" % (np.mean(seeds_mean_lass)))
    print("SSS: %2.2f" % (np.mean(seeds_mean_sss)))
    print("TSS: %2.2f" % (np.mean(seeds_mean_score)))


def evaluate_single_run(log_path, **kwargs):
    if not os.path.exists(log_path):
        return None

    # Extract ground-truth information from dataset
    if kwargs['dataset']['z_data'] is None:
        p_data, w_data = kwargs['dataset']['p_data'], kwargs['dataset']['w_data']
        z_data = torch.cat([torch.tensor(t)[np.newaxis, :] for t in get_temporal_clustering(p_data, w_data)], dim=0)
    else:
        p_data, w_data = kwargs['dataset']['p_data'], kwargs['dataset']['w_data']
        z_data = [torch.tensor(t) for t in kwargs['dataset']['z_data']]

    masks = kwargs['dataset']['masks_data']
    metadata = kwargs['dataset']['meta_data']

    history = pickle.load(open(log_path, 'rb'))
    avg_scores = []
    avg_combined_scores = []
    avg_combined_nmis = []
    avg_munkres = []
    avg_nmis = []
    avg_rss = []
    avg_lass = []
    avg_sss = []
    # Grab 10 samples from the posterior towards the end
    for i, (a, p, rho, m, s) in enumerate(list(zip(*history))[-50::5]):
        w = torch.sort(a)[0]
        num_segs = 0
        prev_p = p[0]
        for token in p:
            if token == prev_p:
                continue
            prev_p = token
            num_segs += 1
        z = p.unsqueeze(0)[:, w][0]
        z = [e[masks[j] == 1] for j, e in enumerate(z)]
        scores = []
        nmis = []

        combined_seq_gt, combined_seq_pred = [], []
        for j, (gt, pred) in enumerate(zip(list([list(t.long().numpy()) for t in z_data]), list([list(t.long().numpy()) for t in z]))):
            scores.append(temporal_structure_score_new(gt, pred))
            nmis.append(normalized_mutual_info_score(gt, pred))
            combined_seq_gt.extend(gt)
            combined_seq_pred.extend(pred)

        combined_score = temporal_structure_score_new(combined_seq_gt, combined_seq_pred)
        nmi = normalized_mutual_info_score(combined_seq_gt, combined_seq_pred)
        munkres = munkres_score([combined_seq_gt], [combined_seq_pred])
        lass = label_agnostic_segmentation_score(combined_seq_gt, combined_seq_pred)
        rss = repeated_structure_score(combined_seq_gt, combined_seq_pred, aligned=False, substring=True, with_purity=True)
        sss = segment_structure_score_new(combined_seq_gt, combined_seq_pred)

        avg_nmis.append(np.mean(nmis))
        avg_scores.append(np.mean(scores))
        avg_combined_scores.append(combined_score)
        avg_combined_nmis.append(nmi)
        avg_munkres.append(munkres)
        avg_lass.append(lass)
        avg_sss.append(sss)
        avg_rss.append(rss)

        kwargs['extension'] = str(i + 1)
        kwargs['log'] = log_path
        visualize_many_temporal_clusterings(list([list(t.long().numpy()) for t in z_data]), list([list(t.long().numpy()) for t in z]), **kwargs)

    return np.mean(avg_nmis), np.mean(avg_scores), np.mean(avg_combined_nmis), np.mean(avg_combined_scores), np.mean(avg_munkres), \
           np.mean(avg_lass), np.mean(avg_sss), np.mean(avg_rss)


def get_log_name(base, **kwargs):
    return base + 'd_%d_%s__p_%s__a_%s_%s__seed_%d__km_%d__sm_%d__gamma_%2.2f__delta_%2.2f__gmm_%d' \
                     % (kwargs['dataset_id'], kwargs['data_config'], kwargs['p_type'], kwargs['a_type'], kwargs['a_bound'],
                        kwargs['seed'], kwargs['k_model'], kwargs['s_model'], kwargs['gamma'], kwargs['delta'], int(kwargs['gmm_init']))

if __name__ == '__main__':
    argparse = argparse.ArgumentParser()
    argparse.add_argument('mode', choices=['train', 'evaluate'], type=str)
    argparse.add_argument('dataset', type=int)
    argparse.add_argument('dataset_path', type=str)

    argparse.add_argument('--data_config', type=str, default='')
    argparse.add_argument('--eval_config', type=str, default='')
    argparse.add_argument('--gmm_init', action='store_true')

    argparse.add_argument('--log', type=str, default='logs/')
    argparse.add_argument('--seed', type=int, default=0)
    argparse.add_argument('--num_seeds', type=int, default=1, help='Only for evaluation, and aggregating info from multiple seeds.')

    argparse.add_argument('--p_type', choices=['ind', 'ind-tied', 'constrained', 'markov'], default='ind')
    argparse.add_argument('--a_type', choices=['tied-across', 'tied-within', 'untied'], default='tied-across')
    argparse.add_argument('--a_bound', type=int, default=0)

    argparse.add_argument('--log_freq', type=int, default=100)

    argparse.add_argument('--n', type=int)
    argparse.add_argument('--d', type=int, default=1)
    argparse.add_argument('--k_data', type=int)
    argparse.add_argument('--s_data', type=int)

    argparse.add_argument('--k_model', type=int, default=-1,
                          help='Number of topics (if unspecified, assumes known from data)')
    argparse.add_argument('--s_model', type=int, default=-1,
                          help='Number of segments (if unspecified, assumes known from data)')
    argparse.add_argument('--gamma', type=float, default=1.0)
    argparse.add_argument('--delta', type=float, default=1.0)

    argparse.add_argument('--n_iters', default=201, type=int)

    args = argparse.parse_args()
    kwargs = vars(args)

    # Use a fixed manual seed for generating the data
    torch.manual_seed(0)

    # Load the dataset
    kwargs['dataset_id'] = kwargs['dataset']
    kwargs['dataset'] = load_dataset(**kwargs)

    # Make sure we grab the right values for k and s from the dataset if we're not specifying them
    if kwargs['k_model'] == -1:
        kwargs['k_model'] = kwargs['dataset']['k_data']
    if kwargs['s_model'] == -1:
        kwargs['s_model'] = kwargs['dataset']['s_data']
    elif kwargs['s_model'] == -2:
        kwargs['s_model'] = kwargs['dataset']['x_data'].shape[1]

    # Now set the manual seed for Gibbs sampling
    torch.manual_seed(args.seed)
    np.random.seed(args.seed)

    # Run the Gibbs sampler
    if args.mode == 'train':
        kwargs['log'] = get_log_name(kwargs['log'], **kwargs)
        run_gibbs(**kwargs)
    # Evaluate the results of the sampling
    elif args.mode == 'evaluate':
        evaluation(**kwargs)