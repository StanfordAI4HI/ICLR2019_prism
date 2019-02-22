import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

colorings = []
for i, (name, hex) in enumerate(matplotlib.colors.cnames.items()):
    colorings.append(np.array(tuple(int(hex.lstrip("#")[i:i + 2], 16) for i in (0, 2, 4))) / 255.0)
colorings = np.array(colorings)
colorings = colorings[np.argsort(colorings.sum(1))][:-30][::5]


def visualize_temporal_clustering(tclust, **kwargs):
    fig = plt.figure(figsize=(7.5, 1.5))
    gs = GridSpec(1, 1, height_ratios=[1.])
    ax = fig.add_subplot(gs[0, 0])
    ax.imshow(colorings[tclust][None, :, :], interpolation="nearest", aspect="auto")
    ax.set_xticklabels([])
    ax.set_xticks([])
    ax.set_yticks([])
    ax.set_title("Visualization of Temporal Clustering")
    plt.tight_layout()
    #     plt.savefig(kwargs['checkpoint_path'] + 'viz_temp_clsts' + kwargs['extension'] + '.png', type='png')
    plt.show()


def visualize_temporal_clusterings(gt, pred, **kwargs):
    print (list(zip(gt, pred)))
    fig = plt.figure(figsize=(7.5, 1.5))
    gs = GridSpec(2, 1, height_ratios=[.5, .5])
    ax = fig.add_subplot(gs[0, 0])
    ax.imshow(colorings[gt][None, :, :], interpolation="nearest",aspect="auto")
    ax.set_xticklabels([])
    ax.set_xticks([])
    ax.set_yticks([])
    ax.set_title("Ground Truth Temporal Clustering")

    ax = fig.add_subplot(gs[1, 0])
    ax.imshow(colorings[pred][None, :, :],interpolation="nearest", aspect="auto")
    ax.set_xticklabels([])
    ax.set_xticks([])
    ax.set_yticks([])
    ax.set_title("Proposed Temporal Clustering")

    plt.tight_layout()
    plt.savefig(kwargs['log'] + 'viz_temp_clsts' + kwargs['extension'] + '.png', type='png')
    plt.close()
    # plt.show()


def visualize_many_temporal_clusterings(gt_list, pred_list, multiple_time_series=True, labels=None, **kwargs):
    assert (len(gt_list) == len(pred_list))
    num_seqs = len(gt_list)
    # if multiple_time_series and num_seqs == 2:
    #     grid_spec_factor = 3
    if multiple_time_series:# and num_seqs != 2:
        grid_spec_factor = 2 * num_seqs
    elif not multiple_time_series:
        grid_spec_factor = num_seqs + 1
    fig = plt.figure(figsize=(7.5, 0.65 * grid_spec_factor))
    gs = GridSpec(grid_spec_factor, 1, height_ratios=[1. / grid_spec_factor] * (grid_spec_factor))

    for i, (gt, pred) in enumerate(zip(gt_list, pred_list)):
        if (multiple_time_series) or (
            not multiple_time_series and i == 0):
            ax = fig.add_subplot(gs[2 * i, 0])
            ax.imshow(colorings[gt][None, :, :], interpolation="nearest", aspect="auto")
            ax.set_xticklabels([])
            ax.set_xticks([])
            ax.set_yticks([])
            if multiple_time_series:
                ax.set_title("Ground Truth Temporal Clustering (Sequence %d)" % (i + 1), fontsize=14)
            else:
                ax.set_title("Ground Truth Temporal Clustering", fontsize=14)

        if multiple_time_series:
            ax = fig.add_subplot(gs[2 * i + 1, 0])
        else:
            ax = fig.add_subplot(gs[i + 1, 0])
        ax.imshow(colorings[pred][None, :, :], interpolation="nearest", aspect="auto")
        ax.set_xticklabels([])
        ax.set_xticks([])
        ax.set_yticks([])
        if multiple_time_series:
            ax.set_title("Proposed Temporal Clustering (Sequence %d)" % (i + 1), fontsize=14)
        else:
            if labels is None:
                ax.set_title("Proposed Temporal Clustering", fontsize=14)
            else:
                ax.set_title("Proposed Temporal Clustering (%s)" % (labels[i]), fontsize=14)

    plt.tight_layout()
    plt.savefig(kwargs['log'] + '_viz' + kwargs['extension'] + '.png', type='png')
    plt.close()
    # plt.show()
