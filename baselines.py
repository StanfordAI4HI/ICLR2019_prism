import numpy as np
from tqdm import tqdm
import os
import argparse
import pickle
from scipy.special import hyp2f1
from scipy.special import logsumexp
from metrics import *
from utils import get_temporal_clustering, relabel_clustering_with_munkres_correspondences, compute_masks
from sklearn.metrics import normalized_mutual_info_score
from multivariate_normal_fast import MultivariateNormalFast
from sklearn.mixture import GaussianMixture
import pyhsmm
from pyhsmm.util.text import progprint_xrange
from scipy.stats import mode
from seq_models import *
from gibbs import load_dataset


def evaluation(**kwargs):
    base_seed = kwargs['seed']
    num_seeds = kwargs['num_seeds']
    seeds_avg_nmi, seeds_avg_score, seeds_nmi, seeds_score = [], [], [], []
    for seed in range(base_seed, base_seed + num_seeds):
        kwargs['seed'] = seed
        log_path = get_log_name(kwargs['log'], **kwargs)
        result = evaluate_single_run(log_path, **kwargs)
        if result is not None:
            avg_nmi, avg_score, nmi, score = result
            seeds_avg_nmi.append(avg_nmi)
            seeds_avg_score.append(avg_score)
            seeds_nmi.append(nmi)
            seeds_score.append(score)

    print("Averaged performance (mean nmi, mean score, nmi, score)", np.mean(seeds_avg_nmi),
          np.mean(seeds_avg_score), np.mean(seeds_nmi), np.mean(seeds_score))


def evaluate_single_run(log_path, **kwargs):
    print(log_path)
    if not os.path.exists(log_path):
        return None

    # Extract ground-truth information from dataset
    if kwargs['dataset']['z_data'] is None:
        p_data, w_data = kwargs['dataset']['p_data'], kwargs['dataset']['w_data']
        z_data = torch.cat([torch.tensor(t)[np.newaxis, :] for t in get_temporal_clustering(p_data, w_data)], dim=0)
    else:
        p_data, w_data = kwargs['dataset']['p_data'], kwargs['dataset']['w_data']
        z_data = [torch.tensor(t) for t in kwargs['dataset']['z_data']]

    obs = [np.array(t)[kwargs['dataset']['masks_data'][i].data.numpy() == 1, :]
           for i, t in enumerate(kwargs['dataset']['x_data'])]

    preds = pickle.load(open(log_path, 'rb'))

    ts_scores = []
    nmi_scores = []
    combined_seq_gt, combined_seq_pred = [], []
    for gt, pred in zip([list(t.long().numpy()) for t in z_data], preds):
        ts_scores.append(temporal_structure_score_new(gt, pred))
        nmi_scores.append(normalized_mutual_info_score(gt, pred))
        combined_seq_gt.extend(gt)
        combined_seq_pred.extend(pred)

    combined_ts_score = temporal_structure_score_new(combined_seq_gt, combined_seq_pred)
    combined_nmi = normalized_mutual_info_score(combined_seq_gt, combined_seq_pred)

    print("Score", np.mean(nmi_scores), np.mean(ts_scores), combined_nmi, combined_ts_score,
          repeated_structure_score(combined_seq_gt, combined_seq_pred, substring=True),
          segment_structure_score(combined_seq_gt, combined_seq_pred),
          segment_structure_score(combined_seq_pred, combined_seq_gt))

    return np.mean(nmi_scores), np.mean(ts_scores), combined_nmi, combined_ts_score


def run_gmm(**kwargs):
    obs = [np.array(t)[kwargs['dataset']['masks_data'][i].data.numpy() == 1, :]
           for i, t in enumerate(kwargs['dataset']['x_data'])]
    flat_obs = [e for i, t in enumerate(kwargs['dataset']['x_data'])
                for e in np.array(t)[kwargs['dataset']['masks_data'][i].data.numpy() == 1, :]]
    gmm = GaussianMixture(kwargs['k_model'], max_iter=kwargs['n_iters'])
    gmm.fit(flat_obs)
    preds = []
    for i, t in enumerate(obs):
        preds.append(gmm.predict(t))

    pickle.dump(preds, open(kwargs['log'], 'wb'))

    print("GMM run complete.")


def run_hmm(**kwargs):
    kwargs_hmm = {'method': 'hmm', 'n_iters': kwargs['n_iters'], 'n_evals': 100, 'num_gt_labels': kwargs['k_model'],
                  'data_dim': kwargs['dataset']['d_data'], 'init_state_concentration': 0.1,
                  'alpha': [0.1, 1.0, 100.0][kwargs['method'] - 1]}

    # Run a deterministic, stochastic or very stochastic HMM
    obs = [np.array(t)[kwargs['dataset']['masks_data'][i].data.numpy() == 1, :]
           for i, t in enumerate(kwargs['dataset']['x_data'])]

    posterior_samples = run_HMM(obs, **kwargs_hmm)

    preds = []
    for i in range(len(obs)):
        preds.append(mode(np.array([e[i] for e in posterior_samples]), axis=0)[0][0])

    pickle.dump(preds, open(kwargs['log'], 'wb'))


def run_hsmm(**kwargs):
    kwargs_hsmm = {'method': 'hsmm',
                   'trunc': 1000,
                   'n_iters': kwargs['n_iters'],
                   'n_evals': 100,
                   'num_gt_labels': kwargs['k_model'],
                   'data_dim': kwargs['dataset']['d_data'],
                   'init_state_concentration': 0.1,
                   'alpha': 1.0, 'alpha_0': 1.0, 'beta_0': 1.0}

    obs = [np.array(t)[kwargs['dataset']['masks_data'][i].data.numpy() == 1, :]
           for i, t in enumerate(kwargs['dataset']['x_data'])]

    posterior_samples = run_HSMM(obs, **kwargs_hsmm)

    preds = []
    for i in range(len(obs)):
        preds.append(mode(np.array([e[i] for e in posterior_samples]), axis=0)[0][0])

    pickle.dump(preds, open(kwargs['log'], 'wb'))


def get_log_name(base, **kwargs):
    method = ['gmm', 'hmm-det', 'hmm-stoch', 'hmm-vstoch', 'hsmm'][kwargs['method']]
    return base + 'd_%d_%s__m__%s__seed_%d__km_%d' \
                  % (kwargs['dataset_id'], kwargs['data_config'], method, kwargs['seed'], kwargs['k_model'])


if __name__ == '__main__':
    argparse = argparse.ArgumentParser()
    argparse.add_argument('mode', choices=['train', 'evaluate'], type=str)
    argparse.add_argument('dataset', type=int)
    argparse.add_argument('method', type=int)

    argparse.add_argument('--data_config', type=str, default='')
    argparse.add_argument('--eval_config', type=str, default='')

    argparse.add_argument('--log', type=str, default='logs/')
    argparse.add_argument('--seed', type=int, default=0)
    argparse.add_argument('--num_seeds', type=int, default=1,
                          help='Only for evaluation, and aggregating info from multiple seeds.')

    argparse.add_argument('--log_freq', type=int, default=10)

    argparse.add_argument('--n', type=int)
    argparse.add_argument('--d', type=int, default=1)
    argparse.add_argument('--k_data', type=int)
    argparse.add_argument('--s_data', type=int)

    argparse.add_argument('--k_model', type=int, default=-1,
                          help='Number of topics (if unspecified, assumes known from data)')

    argparse.add_argument('--n_iters', default=1000, type=int)

    args = argparse.parse_args()

    kwargs = vars(args)
    print(kwargs)

    # Use a fixed manual seed for generating the data
    torch.manual_seed(0)

    # Load the dataset
    kwargs['dataset_id'] = kwargs['dataset']
    kwargs['dataset'] = load_dataset(**kwargs)

    # Make sure we grab the right values for k and s from the dataset if we're not specifying them
    if kwargs['k_model'] == -1:
        kwargs['k_model'] = kwargs['dataset']['k_data']

    # Now set the manual seed for Gibbs sampling
    torch.manual_seed(args.seed)
    np.random.seed(args.seed)

    # Run the Gibbs sampler
    if args.mode == 'train':
        kwargs['log'] = get_log_name(kwargs['log'], **kwargs)
        if kwargs['method'] == 0:
            run_gmm(**kwargs)
        elif kwargs['method'] in [1, 2, 3]:
            run_hmm(**kwargs)
        elif kwargs['method'] == 4:
            run_hsmm(**kwargs)

    # Evaluate the results of the sampling
    elif args.mode == 'evaluate':
        evaluation(**kwargs)
