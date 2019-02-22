import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np


# Hyperparameter variation on s
# Results are for suturing with demonstration trajectories 15-20
s = range(5, 51, 5) + [100]
nmi = np.array([33.01, 47.16, 49.79, 54.42, 51.54, 52.83, 51.76, 48.80, 50.40, 49.80, 43.96])/100.
tss = np.array([31.13, 44.14, 53.83, 64.80, 62.03, 67.65, 67.20, 63.75, 68.69, 65.31, 63.33])/100.

plt.figure(figsize=(4.5,3))
plt.plot(s, nmi, label='NMI', marker='x', linewidth=4, markersize=8)
plt.plot(s, tss, label='TSS', marker='o', linewidth=4, markersize=8)
plt.axvline(x=21, linestyle='--', linewidth=1.5, color='green')
plt.legend(fontsize=14)
plt.ylim([0, 1.])
plt.xlabel(r'$s$', fontsize=18)
plt.ylabel('Score', fontsize=18)
plt.xticks(s[::2], fontsize=16)
plt.yticks(fontsize=16)
plt.tight_layout()
plt.savefig('plots/hyperparam_s')
plt.close()

# Hyperparameter variation on k
# Results are for suturing with demonstration trajectories 15-20
k = [3, 5, 7, 10, 13, 15]
latex_k = [r'$%d$' % e for e in [3, 5, 7, 10, 13, 15]]
latex_k[3] = r'${\bf 10}$'
nmi = np.array([34.87, 48.94, 49.63, 51.54, 54.56, 52.37])/100.
tss = np.array([63.26, 69.53, 65.83, 62.03, 59.83, 55.45])/100.
plt.figure(figsize=(4.5,3))
plt.plot(k, nmi, label='NMI', marker='x', linewidth=4, markersize=8)
plt.plot(k, tss, label='TSS', marker='o', linewidth=4, markersize=8)
plt.axvline(x=10, linestyle='--', linewidth=1.5, color='green')
plt.legend(fontsize=14)
plt.ylim([0, 1.])
plt.xlabel(r'$k$', fontsize=18)
plt.ylabel('Score', fontsize=18)
plt.xticks(k, k, fontsize=16)
plt.yticks(fontsize=16)
plt.tight_layout()
plt.savefig('plots/hyperparam_k')
plt.close()
