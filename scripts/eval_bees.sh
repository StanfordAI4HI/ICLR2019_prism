#!/usr/bin/env bash

# Usage
# > ./eval_bees.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/bees/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/bees/data/"

# Loops over and runs evaluation for all 6 Bees sequences
for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python gibbs.py evaluate $j $dataset --seed $seed --num_seeds $1 \
   --log $log --p_type ind --a_type tied-across --s_model 200 --k_model -1 --gamma 1.0 --delta 1.0
done

# TSS, NMI

# Bees-1
# GMM: 58.14, 19.97
# Det-HMM: 66.12, 32.59
# Stoch-HMM: 63.46, 28.96
# VStoch-HMM: 59.62, 22.51

# Us (no gmm): 61.34, 25.04


# Bees-2
# GMM: 66.21, 36.60
# Det-HMM: 67.30, 34.63
# Stoch-HMM: 70.63, 38.73
# VStoch-HMM: 77.57, 51.03

# Us (no gmm): 74.84, 46.01


# Bees-3
# GMM: 47.61, 13.58
# Det-HMM: 50.24, 15.86
# Stoch-HMM: 50.55, 14.81
# VStoch-HMM: 54.54, 20.52

# Us (no gmm): 52.72, 18.26


# Bees-4
# GMM: 62.85, 31.20
# Det-HMM: 74.78 38.94
# Stoch-HMM: 73.89 37.27
# VStoch-HMM: 77.59, 42.43

# Us (no gmm): 76.40, 41.57


# Bees-5
# GMM: 72.31, 39.86
# Det-HMM: 81.65, 59.53
# Stoch-HMM: 81.60, 57.61
# VStoch-HMM: 85.04, 61.37

# Us (no gmm): 82.63, 56.11

# Bees-6
# GMM: 65.04, 31.98
# Det-HMM: 68.16, 41.52
# Stoch-HMM: 78.95, 50.10
# VStoch-HMM: 85.77, 62.46

# Us (no gmm): 80.71, 53.72
