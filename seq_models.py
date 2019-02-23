from pyhsmm.models import HMM, HSMM
import pyhsmm
import numpy as np
import matplotlib.pyplot as plt
from tqdm import tqdm


def inference(time_series, model, **kwargs):
    # Add each time-series
    for x in time_series:
        model.add_data(x) if kwargs['method'] not in ['hsmm'] else model.add_data(x, trunc=kwargs['trunc'])

    # Run the Gibbs sampler
    def update(model):
        model.resample_model()
        return model.log_likelihood()

    lls = []
    for _ in tqdm(range(kwargs['n_iters'])):
        lls.append(update(model))

    # if kwargs['method'] in ['hmm']:
    #         lls = model.EM_fit()

    # Plot the model
    #     plt.figure()
    #     model.plot()
    #     plt.show()
    #     plt.close()

    # Plot the log-likelihoods
    # plt.figure()
    # plt.plot(np.arange(len(lls)), lls, color='blue', label="test")
    # plt.xlabel("iteration")
    # plt.ylabel("training likelihood")
    # plt.legend(loc="lower right")
    # plt.show()
    # plt.close()

    # print (model.trans_distn.trans_matrix)
    # print (model.init_state_distn.pi_0)
    # print ([(o.mu, o.sigma) for o in model.obs_distns])

    # Take samples from the posterior
    clustering_by_time_series = []
    for _ in tqdm(range(kwargs['n_evals'])):
        this_clustering_by_time_series = []
        for state_list in model.states_list:
            this_clustering_by_time_series.append(state_list.stateseq)
        clustering_by_time_series.append(this_clustering_by_time_series)
        update(model)

    return clustering_by_time_series

def run_HMM(time_series, **kwargs):
    # Directly use knowledge of the number of modes
    K = kwargs['num_gt_labels']
    D_obs = kwargs['data_dim']

    obs_hypparams = {'mu_0': np.zeros(D_obs),
                     'sigma_0': np.eye(D_obs),
                     'kappa_0': 0.10,
                     'nu_0': D_obs + 2}

    obs_distns = [pyhsmm.distributions.Gaussian(**obs_hypparams) for _ in range(K)]

    hmm = HMM(alpha=kwargs['alpha'],
              init_state_concentration=kwargs['init_state_concentration'],
              obs_distns=obs_distns)

    return inference(time_series, hmm, **kwargs)


def run_HSMM(time_series, **kwargs):
    # Directly use knowledge of the number of modes
    K = kwargs['num_gt_labels']
    D_obs = kwargs['data_dim']

    obs_hypparams = {'mu_0': np.zeros(D_obs),
                     'sigma_0': np.eye(D_obs),
                     'kappa_0': 0.10,
                     'nu_0': D_obs + 2}

    dur_hypparams = {'alpha_0': kwargs['alpha_0'],
                     'beta_0': kwargs['beta_0']}

    obs_distns = [pyhsmm.distributions.Gaussian(**obs_hypparams) for _ in range(K)]
    dur_distns = [pyhsmm.distributions.PoissonDuration(**dur_hypparams) for _ in range(K)]

    hmm = HSMM(alpha=kwargs['alpha'],
               init_state_concentration=kwargs['init_state_concentration'],
               obs_distns=obs_distns,
               dur_distns=dur_distns)

    return inference(time_series, hmm, **kwargs)