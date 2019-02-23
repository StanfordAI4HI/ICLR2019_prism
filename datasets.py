import numpy as np
import torch
import pyro
import pyro.distributions as dist
from utils import get_temporal_clustering
from sklearn.preprocessing import LabelEncoder, scale
from natsort import natsorted
from glob import glob
from tqdm import tqdm
from utils import *
from torch.nn.utils.rnn import pack_padded_sequence, pad_packed_sequence, pad_sequence
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler, scale
from scipy.io import loadmat, savemat, wavfile
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt


def load_inria_dataset(task_type='0_1_2_3_4', remove_background=False, path=None):
    tasks = [['changing_tire', 'coffee', 'cpr', 'jump_car', 'repot'][int(i)] for i in task_type.split("_")]
    backgrounds = [[11, 10, 7, 12, 8][int(i)] for i in task_type.split("_")]

    def load_features_and_gt_labels(path, background):
        mat_dict = loadmat(path)
        all_time_series = []
        all_names = []
        all_gt_labels = []
        for x,y,meta in zip(mat_dict['X'], mat_dict['Y'], mat_dict['hw3'][0]):
            if remove_background:
                labels = np.where(y[0] == 1)[1][:len(x[0])]
                all_time_series.append(x[0][np.where(labels != background)])
                all_gt_labels.append(labels[np.where(labels != background)])
            else:
                all_time_series.append(x[0])
                all_gt_labels.append(np.where(y[0] == 1)[1][:len(x[0])])

            all_names.append(meta[1][0])

        return all_time_series, all_names, all_gt_labels

    all_time_series = []
    all_names = []
    all_gt_labels = []
    for background, task in zip(backgrounds, tasks):
        task_feature_path = path + task + '/features/full_dataset.mat'
        task_time_series, task_names, task_gt_labels = load_features_and_gt_labels(task_feature_path, background)

        all_time_series.extend(task_time_series)
        all_names.extend(task_names)
        all_gt_labels.extend(task_gt_labels)

    le = LabelEncoder()
    le.fit(np.concatenate(all_gt_labels))
    for i in range(len(all_gt_labels)):
        all_gt_labels[i] = le.transform(all_gt_labels[i])

    return all_time_series, all_gt_labels, all_names


def load_breakfast_dataset(task_type='0_1_2_3_4_5_6_7_8_9',
                           feature_type='f',
                           coarse_segmentation=True,
                           camera_type=4,
                           path=None):

    fisher_path = path + '/fisher/s1/'
    labels_path = path + ['segmentation_fine/', 'segmentation_coarse/'][int(coarse_segmentation)]

    tasks = [['cereals', 'coffee', 'friedegg', 'juice', 'milk',
              'pancake', 'salat', 'sandwich', 'scrambledegg', 'tea'][int(i)] for i in task_type.split("_")]

    if camera_type < 5:
        camera = ['cam01', 'cam02', 'webcam01', 'webcam02', 'stereo01'][camera_type]
    else:
        camera = ''

    def load_fisher_features(path, camera):
        all_time_series = []
        all_names = []
        files = glob(path + '*')
        for file in tqdm(natsorted(files)):
            if camera not in file:
                continue
            with open(file) as f:
                lines = f.readlines()
            time_series = np.array([[float(e) for e in line.rstrip().split()] for line in lines])
            name = file.split("/")[-1]

            all_time_series.append(time_series)
            all_names.append(name)

        return all_time_series, all_names

    def load_gt_labels(path, names, lengths):
        all_gt_labels = []
        files = glob(path + '*')
        for file in natsorted(files):
            name = file.split("/")[-1]
            if name not in names or name.endswith('.xml'):
                continue
            i = names.index(name)
            with open(file) as f:
                gt_labels = []
                last_cluster_end = 0
                for line in f:
                    start, end, cluster = line.rstrip().replace("-", " ").split(" ")
                    start = int(start)
                    end = min(int(end), lengths[i])
                    if start > last_cluster_end + 1:
                        gt_labels.extend(['NULL'] * (start - last_cluster_end))
                    gt_labels.extend([cluster] * (end - start + 1))
                    last_cluster_end = end
                if not len(gt_labels) >= lengths[i]:
                    gt_labels.extend(['NULL'] * (lengths[i] - len(gt_labels)))
                else:
                    gt_labels = gt_labels[:lengths[i]]

            all_gt_labels.append(gt_labels)

        return all_gt_labels

    all_time_series = []
    all_names = []
    all_gt_labels = []
    for task in tasks:
        task_fisher_path = fisher_path + task + '/'
        task_time_series, task_names = load_fisher_features(task_fisher_path, camera)

        task_labels_path = labels_path + task + '/'
        task_gt_labels = load_gt_labels(task_labels_path, task_names, [len(e) for e in task_time_series])

        all_time_series.extend(task_time_series)
        all_names.extend(task_names)
        all_gt_labels.extend(task_gt_labels)

    le = LabelEncoder()
    le.fit(np.concatenate(all_gt_labels))
    for i in range(len(all_gt_labels)):
        all_gt_labels[i] = le.transform(all_gt_labels[i])

    return all_time_series, all_gt_labels, all_names


def load_surgery_dataset(task_type='kns', feature_type='k', path=None):
    knot_tying_path = path + 'Knot_Tying/'
    needle_passing_path = path + 'Needle_Passing/'
    suturing_path = path + 'Suturing/'

    def load_kinematic_features(path):
        all_time_series = []
        all_names = []
        kinematics_path = path + 'kinematics/AllGestures/'
        files = glob(kinematics_path + '*')
        for file in tqdm(natsorted(files)):
            with open(file) as f:
                lines = f.readlines()
            time_series = np.array([[float(e) for e in line.rstrip().split()] for line in lines])
            name = file.split("/")[-1]
            if time_series.shape[0] > 0:
                all_time_series.append(time_series)
                all_names.append(name)

        return all_time_series, all_names

    def load_gt_labels(path, names, lengths):
        all_gt_labels = []
        labels_path = path + 'transcriptions/'
        files = glob(labels_path + '*')
        for i, file in enumerate(natsorted(files)):
            name = file.split("/")[-1]
            if name not in names:
                continue
            with open(file) as f:
                gt_labels = []
                last_cluster_end = 0
                for line in f:
                    start, end, cluster = line.rstrip().split(" ")
                    start = int(start)
                    end = min(int(end), lengths[i])
                    cluster = int(cluster.lstrip("G"))
                    if start > last_cluster_end + 1:
                        gt_labels.extend([0] * (start - last_cluster_end))
                    gt_labels.extend([cluster] * (end - start + 1))
                    last_cluster_end = end
                if not len(gt_labels) >= lengths[i]:
                    gt_labels.extend([0] * (lengths[i] - len(gt_labels)))
                else:
                    gt_labels = gt_labels[:lengths[i]]

            all_gt_labels.append(gt_labels)

        return all_gt_labels

    if 'k' in task_type:
        knot_tying_time_series, knot_tying_names = load_kinematic_features(knot_tying_path)
        knot_tying_gt_labels = load_gt_labels(knot_tying_path, knot_tying_names,
                                              [len(e) for e in knot_tying_time_series])
    else:
        knot_tying_time_series, knot_tying_names, knot_tying_gt_labels = [], [], []
    if 'n' in task_type:
        needle_passing_time_series, needle_passing_names = load_kinematic_features(needle_passing_path)
        needle_passing_gt_labels = load_gt_labels(needle_passing_path, needle_passing_names,
                                                  [len(e) for e in needle_passing_time_series])
    else:
        needle_passing_time_series, needle_passing_names, needle_passing_gt_labels = [], [], []

    if 's' in task_type:
        suturing_time_series, suturing_names = load_kinematic_features(suturing_path)
        suturing_gt_labels = load_gt_labels(suturing_path, suturing_names,
                                            [len(e) for e in suturing_time_series])
    else:
        suturing_time_series, suturing_names, suturing_gt_labels = [], [], []

    all_time_series = knot_tying_time_series + needle_passing_time_series + suturing_time_series
    all_names = knot_tying_names + needle_passing_names + suturing_names
    all_gt_labels = knot_tying_gt_labels + needle_passing_gt_labels + suturing_gt_labels

    return all_time_series, all_gt_labels, all_names



# Taken from
# Learning and Inferring Motion Patterns using Parametric Segmental Switching Linear Dynamic Systems
# Sang Min Oh, James M. Rehg, Tucker Balch, Frank Dellaert
# International Journal of Computer Vision (IJCV) Special Issue on Learning for Vision, May 2008.

def load_bees_dataset(path=None):
    folders = glob(path + 'seq*')
    time_series = []
    gt_labels = []
    le = LabelEncoder()
    for folder in natsorted(folders):
        folder += '/btf/'
        with open(folder + 'ximage.btf') as f:
            x = np.array([float(e.rstrip()) for e in f.readlines()])
        with open(folder + 'yimage.btf') as f:
            y = np.array([float(e.rstrip()) for e in f.readlines()])
        with open(folder + 'timage.btf') as f:
            theta = np.array([float(e.rstrip()) for e in f.readlines()])
            cos_theta = np.cos(theta)
            sin_theta = np.sin(theta)
        with open(folder + 'label0.btf') as f:
            this_gt_labels = np.array([e.rstrip() for e in f.readlines()])
        this_time_series = np.concatenate((x[:,None],y[:,None],cos_theta[:,None],sin_theta[:,None]),axis=1)
        this_time_series = scale(this_time_series)
        time_series.append(this_time_series)
        gt_labels.append(this_gt_labels)

    le.fit(np.concatenate(gt_labels))
    for i in range(len(gt_labels)):
        gt_labels[i] = le.transform(gt_labels[i])

    return time_series, gt_labels

'''
d is the dimension of the Gaussian
n sequences
s segments per sequence
k total topics
m is a list of sequence lengths
p is the common procedure
w is a list of segment lengths
'''

def gaussian_dataset(means, stds, d, n, k, p, w):
    # Compute the temporal clustering
    c = [torch.tensor(t) for t in get_temporal_clustering(p, w)]

    x = []
    for group in range(n):
        x.append(dist.Normal(means[c[group]], stds[c[group]]).sample())

    return x


def load_dataset(**kwargs):
    # Dataset being used
    dataset = kwargs['dataset']
    path = kwargs['dataset_path']
    data_config = kwargs['data_config'].split("-")
    eval_config = kwargs['eval_config'].split("-")

    meta_data = None
    z_data = None

    if dataset == 0:
        n = 3  # Number of groups (time-series)
        k_data = 6  # Number of total topics (activities)
        s_data = 6  # Number of segments in the procedure
        d = d_data = kwargs['d']
        m_data = [200, 200, 200][:n]

        p_data = [0, 1, 2, 3, 4, 5]
        w_data = [[30, 10, 20, 60, 40, 40], [10, 40, 20, 30, 80, 20], [30, 30, 50, 30, 10, 50]][:n]

        means_data = dist.Uniform(low=0, high=10).expand_by([k_data, d]).sample()
        stds_data = torch.ones(k_data, d) * 0.1

        x_data = gaussian_dataset(means_data, stds_data, d, n, k_data, p_data, w_data)
        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 1:
        n = 2  # Number of groups (time-series)
        k_data = 6  # Number of total topics (activities)
        s_data = 14  # Number of segments in the procedure
        d = d_data = kwargs['d']
        m_data = [300, 300][:n]

        p_data = [0, 1, 2, 3, 4, 5, 2, 1, 2, 3, 1, 5, 0, 4]
        w_data = [[15, 5, 10, 30, 30, 20, 20, 20, 30, 20, 40, 10, 30, 20], [10, 20, 30, 10, 10, 20, 10, 40, 30, 20, 10, 30, 10, 50]][:n]

        means_data = dist.Uniform(low=0, high=10).expand_by([k_data, d]).sample()
        stds_data = torch.ones(k_data, d) * 0.1

        x_data = gaussian_dataset(means_data, stds_data, d, n, k_data, p_data, w_data)
        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 11:
        n = 2  # Number of groups (time-series)
        k_data = 6  # Number of total topics (activities)
        s_data = 14  # Number of segments in the procedure
        d = d_data = kwargs['d']
        m_data = [300, 340][:n]

        p_data = [0, 1, 2, 3, 4, 5, 2, 1, 2, 3, 1, 5, 0, 4]
        w_data = [[15, 5, 10, 30, 30, 20, 20, 20, 30, 20, 40, 10, 30, 20], [10, 20, 30, 10, 10, 20, 10, 40, 30, 20, 10, 30, 50, 50]][:n]

        means_data = dist.Uniform(low=0, high=10).expand_by([k_data, d]).sample()
        stds_data = torch.ones(k_data, d) * 0.1

        x_data = []
        for i in range(n):
            x_data.extend(gaussian_dataset(means_data, stds_data, d, 1, k_data, p_data, [w_data[i]]))

    elif dataset == 2:
        n = 1  # Number of groups (time-series)
        k_data = 6  # Number of total topics (activities)

        d = d_data = kwargs['d']
        # Number of repetitions of the "get ingredient, cut ingredient" loop
        r1 = 20
        r2 = 4
        # Construct the overall sequence
        p_data = [0, 1] * r1 + list(range(2, k_data)) * r2
        w_data = [[1] * (2 * r1 + (k_data - 2) * r2)] * n

        s_data = len(p_data)  # Number of segments in the procedure
        m_data = [len(p_data)] * n

        means_data = dist.Uniform(low=0, high=10).expand_by([k_data, d]).sample()
        stds_data = torch.ones(k_data, d) * 0.1

        x_data = gaussian_dataset(means_data, stds_data, d, n, k_data, p_data, w_data)
        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 3:
        n = 10
        k_data = 6

        d = d_data = kwargs['d']
        # Number of repetitions of the "get ingredient, cut ingredient" loop
        r1 = 5
        r2 = 3

        # Construct the overall sequence
        p_data = [0] + [1, 2] * r1 + list(range(3, k_data)) * r2
        w_data = [[1 for _ in range(len(p_data))]] * n

        s_data = len(p_data)
        m_data = [len(p_data)] * n

        means_data = torch.arange(k_data).unsqueeze(1).repeat(1, d)
        x_data = []
        for i in range(n):
            stds_data = torch.ones(k_data) * 0.08 * (i + 1)/d
            x_data.extend(
                gaussian_dataset(means_data.type(torch.FloatTensor), stds_data.unsqueeze(1).type(torch.FloatTensor),
                                 d, 1, k_data, p_data, w_data))

        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 4:
        n = 10
        k_data = 6

        d = d_data = kwargs['d']
        # Number of repetitions of the "get ingredient, cut ingredient" loop
        r1 = 5
        r2 = 3

        # Construct the overall sequence
        p_data = [0] + [1, 2] * r1 + list(range(3, k_data)) * r2
        w_data = [[10 for _ in range(len(p_data))]] * n

        s_data = len(p_data)
        m_data = [len(p_data) * 10] * n

        means_data = torch.arange(k_data).unsqueeze(1).repeat(1, d)
        x_data = []
        for i in range(n):
            stds_data = torch.ones(k_data) * 0.08 * (i + 1)/d
            x_data.extend(
                gaussian_dataset(means_data.type(torch.FloatTensor), stds_data.unsqueeze(1).type(torch.FloatTensor),
                                 d, 1, k_data, p_data, w_data))

        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 41:
        n = 10
        k_data = 6

        d = d_data = kwargs['d']
        # Number of repetitions of the "get ingredient, cut ingredient" loop
        r1 = 5
        r2 = 3

        # Construct the overall sequence
        p_data = [0] + [1, 2] * r1 + list(range(3, k_data)) * r2
        w_data = [[20 for _ in range(len(p_data))]] * n

        s_data = len(p_data)
        m_data = [len(p_data) * 20] * n

        means_data = torch.arange(k_data).unsqueeze(1).repeat(1, d)
        x_data = []
        for i in range(n):
            stds_data = torch.ones(k_data) * 0.10 * (i + 1)/d
            x_data.extend(
                gaussian_dataset(means_data.type(torch.FloatTensor), stds_data.unsqueeze(1).type(torch.FloatTensor),
                                 d, 1, k_data, p_data, w_data))

        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 42:
        n = 50
        k_data = 10

        d = d_data = kwargs['d']
        # Number of repetitions of the "get ingredient, cut ingredient" loop
        r1 = 5
        r2 = 3

        # Construct the overall sequence
        p_data = [0] + [1, 2] * r1 + list(range(3, k_data)) * r2
        w_data = [[100 for _ in range(len(p_data))]] * n

        s_data = len(p_data)
        m_data = [len(p_data) * 100] * n

        means_data = torch.arange(k_data).unsqueeze(1).repeat(1, d)
        x_data = []
        for i in range(n):
            stds_data = torch.ones(k_data) * 0.02 * (i + 1)/d
            x_data.extend(
                gaussian_dataset(means_data.type(torch.FloatTensor), stds_data.unsqueeze(1).type(torch.FloatTensor),
                                 d, 1, k_data, p_data, w_data))

        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 5:
        n = 10
        k_data = 8

        d = d_data = kwargs['d']

        r1 = 4
        # Construct the overall sequence
        p_data = [e for a, b in zip([0] * k_data, range(1, k_data)) for e in [a, b]] + [0] * r1
        w_data = [[1 for _ in range(len(p_data))]] * n

        s_data = len(p_data)
        m_data = [len(p_data)] * n

        means_data = torch.arange(k_data).unsqueeze(1).repeat(1, d).float()
        stds_data = (torch.ones(k_data) * 0.35).float()

        x_data = []
        for i in range(n):
            x_data.extend(gaussian_dataset(means_data, stds_data.unsqueeze(1), d, 1, k_data, p_data, [w_data[i]]))

        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    elif dataset == 6:
        n = 10
        k_data = 8

        d = d_data = kwargs['d']

        r1 = 4
        # Construct the overall sequence
        p_data = [e for a, b in zip([0] * k_data, range(1, k_data)) for e in [a, b]] + [0] * r1
        w_data = [[2 for _ in range(len(p_data))]] * n

        s_data = len(p_data)
        m_data = [len(p_data) * 2] * n

        means_data = torch.arange(k_data).unsqueeze(1).repeat(1, d).float()
        stds_data = (torch.ones(k_data) * 0.35).float()

        x_data = []
        for i in range(n):
            x_data.extend(gaussian_dataset(means_data, stds_data.unsqueeze(1), d, 1, k_data, p_data, [w_data[i]]))

        x_data = torch.cat([e.unsqueeze(0) for e in x_data])

    # Bees dataset
    elif dataset in [7, 71, 72, 73, 74, 75, 76]:
        x_data, z_data = load_bees_dataset(path)
        if dataset != 7:
            x_data = [x_data[int(str(dataset)[1]) - 1]]
            z_data = [z_data[int(str(dataset)[1]) - 1]]

        # Sort all the sequences in descending order of lengths
        x_data, z_data = zip(*sorted(zip(x_data, z_data), key=lambda e: len(e[0]), reverse=True))

        n = len(x_data)
        k_data = 3

        d_data = x_data[0].shape[-1]

        p_data = []
        w_data = []
        for z in z_data:
            p_data.append([z[0]])
            w_data.append([0])
            last_p = z[0]
            for e in z:
                if e != last_p:
                    p_data[-1].append(e)
                    w_data[-1].append(1)
                    last_p = e
                else:
                    w_data[-1][-1] += 1

        s_data = max([len(e) for e in p_data])
        m_data = [len(e) for e in x_data]

        means_data = None
        stds_data = None

    # Surgery dataset with binary encoding on which tasks to include
    # 1101 = kinematic features with k and s task types
    # 1011 = kinematic features with n and s task types
    # 2011 = visual features with n and s task types
    # Data configs
    # num kinematic features to keep - skip rate - apply PCA - demos start pt - demos end pt
    # - stack config -
    # A default config for which testing is done '38-3-1-10-20-1'
    # Config from Berkeley paper? '38-1-0-10-20-2'
    # We are improving for '38-3-1-10-20-3'
    elif dataset in [1001, 1010, 1011, 1100, 1101, 1110, 1111,
                     2001, 2010, 2011, 2100, 2101, 2110, 2111]:
        data_config = [int(e) for e in data_config]
        feature_type = {'1': 'k'}[str(dataset)[0]]
        task_type = 'k' * int(str(dataset)[1]) + 'n' * int(str(dataset)[2]) + 's' * int(str(dataset)[3])
        gestures = {'k': [1, 11, 12, 13, 14, 15],
                    'n': [1, 2, 3, 4, 5, 6, 8, 11],
                    's': [1, 2, 3, 4, 5, 6, 8, 9, 10, 11]}

        x_data, z_data, meta_data = load_surgery_dataset(task_type, feature_type, path=path)

        # For kinematic features we only keep the Slave left and Slave right features (38-76)
        if feature_type == 'k':
            kinematic_features_to_keep = data_config[0]#38
            x_data = [e[:, kinematic_features_to_keep:] for e in x_data]

        # Dataset level preprocessing
        # Subsample the data to reduce the frame rate (default rate = 30Hz)
        skip_rate = data_config[1]
        x_data = [e[::skip_rate] for e in x_data]
        z_data = [e[::skip_rate] for e in z_data]

        # First reduce the number of components per time-step using PCA (this is okay)
        if data_config[2] == 1:
            pca = PCA(n_components=12)
            pca.fit(np.concatenate(x_data))
            x_data = [pca.transform(e) for e in x_data]

        # Task specific preprocessing
        # Figure out which sequences we're looking at (prefer sequences by the same surgeon to start with)
        x_data = x_data[data_config[3]:data_config[4]]#10:20]
        z_data = z_data[data_config[3]:data_config[4]]#10:20]
        meta_data = meta_data[data_config[3]:data_config[4]]#10:20]

        # Stack up a few time-steps
        if data_config[5] > 0:
            if data_config[5] == 1:
                stack_sizes = [100]  # [1, 10, 100]#[1, 3, 10, 30, 100]
                n_pca_components = [20]  # [12, 10, 16, 16, 20]
            elif data_config[5] == 2:
                stack_sizes = [3]  # [1, 10, 100]#[1, 3, 10, 30, 100]
                n_pca_components = [0]  # [12, 10, 16, 16, 20]
            elif data_config[5] == 3:
                stack_sizes = [10]  # [1, 10, 100]#[1, 3, 10, 30, 100]
                n_pca_components = [10]  # [12, 10, 16, 16, 20]

            max_stack_size = max(stack_sizes)
            x_data_stacks = []

            for i, stack_size in enumerate(stack_sizes):
                x_data_stack = [np.hstack([e[j + (max_stack_size - stack_size):-stack_size + j] for j in range(stack_size)]) for e in x_data]

                # Do PCA again
                if n_pca_components[i] > 0:
                    pca = PCA(n_components=n_pca_components[i])
                    pca.fit(np.concatenate(x_data_stack))
                    x_data_stack = [pca.transform(e) for e in x_data_stack]

                x_data_stacks.append(x_data_stack)

            x_data = [np.hstack(seq) for seq in zip(*x_data_stacks)]
            z_data = [e[max_stack_size - 1:-1] for e in z_data]
            # z_data = [e[:-max_stack_size] for e in z_data]

        # Do PCA once again
        # pca = PCA(n_components=20)
        # pca.fit(np.concatenate(x_data))
        # x_data = [pca.transform(e) for e in x_data]


        # Scale the data using statistics computed over the entire dataset
        scaler = StandardScaler()
        scaler.fit(np.concatenate(x_data))
        x_data = [scaler.transform(e) for e in x_data]

        # Scale the data per trajectory
        # x_data = [scale(e) for e in x_data]

        # Sort all the sequences in descending order of lengths
        x_data, z_data, meta_data = zip(*sorted(zip(x_data, z_data, meta_data), key=lambda e: len(e[0]), reverse=True))

        n = len(x_data)
        k_data = len(np.unique([e for task in task_type for e in gestures[task]]))

        d_data = x_data[0].shape[-1]

        p_data = []
        w_data = []
        for z in z_data:
            p_data.append([z[0]])
            w_data.append([0])
            last_p = z[0]
            for e in z:
                if e != last_p:
                    p_data[-1].append(e)
                    w_data[-1].append(1)
                    last_p = e
                else:
                    w_data[-1][-1] += 1

        s_data = max([len(e) for e in p_data])
        m_data = [len(e) for e in x_data]

        means_data = None
        stds_data = None

    # Load the breakfast dataset
    # Data config
    # task-type - feature_type - camera_type - coarse_seg
    elif dataset == 8:
        feature_type = ['f', 'hog'][int(data_config[1])]
        x_data, z_data, meta_data = load_breakfast_dataset(data_config[0], feature_type, int(eval_config[0]), int(data_config[2]), path=path)

        # Sort all the sequences in descending order of lengths
        x_data, z_data, meta_data = zip(*sorted(zip(x_data, z_data, meta_data), key=lambda e: len(e[0]), reverse=True))

        n = len(x_data)
        k_data = len(np.unique([e2 for e1 in z_data for e2 in e1]))

        d_data = x_data[0].shape[-1]

        p_data = []
        w_data = []
        for z in z_data:
            p_data.append([z[0]])
            w_data.append([0])
            last_p = z[0]
            for e in z:
                if e != last_p:
                    p_data[-1].append(e)
                    w_data[-1].append(1)
                    last_p = e
                else:
                    w_data[-1][-1] += 1

        s_data = max([len(e) for e in p_data])
        m_data = [len(e) for e in x_data]

        means_data = None
        stds_data = None

    # Load the INRIA dataset
    elif dataset in [9, 91]:
        if dataset == 9:
            x_data, z_data, meta_data = load_inria_dataset(data_config[0], path=path)
        elif dataset == 91:
            x_data, z_data, meta_data = load_inria_dataset(data_config[0], True, path=path)

        # First reduce the number of components per time-step using PCA (this is okay)
        pca = PCA(n_components=64)
        pca.fit(np.concatenate(x_data))
        x_data = [pca.transform(e) for e in x_data]

        # Sort all the sequences in descending order of lengths
        x_data, z_data, meta_data = zip(*sorted(zip(x_data, z_data, meta_data), key=lambda e: len(e[0]), reverse=True))

        n = len(x_data)
        k_data = len(np.unique([e2 for e1 in z_data for e2 in e1]))

        d_data = x_data[0].shape[-1]

        p_data = []
        w_data = []
        for z in z_data:
            p_data.append([z[0]])
            w_data.append([0])
            last_p = z[0]
            for e in z:
                if e != last_p:
                    p_data[-1].append(e)
                    w_data[-1].append(1)
                    last_p = e
                else:
                    w_data[-1][-1] += 1

        s_data = max([len(e) for e in p_data])
        m_data = [len(e) for e in x_data]

        means_data = None
        stds_data = None

    # Pad all the sequences
    x_data = [torch.tensor(e).float() for e in x_data]
    masks_data = compute_masks(x_data)
    x_data = pad_sequence(x_data, batch_first=True)
    max_seq_len = x_data[0].size(0)
    m_data = [max_seq_len] * n

    return {'x_data': x_data,
            'means_data': means_data,
            'stds_data': stds_data,
            'p_data': p_data,
            'w_data': w_data,
            'z_data': z_data,
            'm_data': m_data,
            's_data': s_data,
            'k_data': k_data,
            'd_data': d_data,
            'masks_data': masks_data,
            'meta_data': meta_data}