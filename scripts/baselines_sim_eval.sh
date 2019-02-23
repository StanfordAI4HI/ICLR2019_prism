#!/usr/bin/env bash

# Evaluate baselines on simulated dataset

# Usage
# > ./baselines_sim_eval.sh 10 0
# which runs evaluation for results from baselines from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to dataset is empty, since we're using simulated data
dataset="-"

# Run evaluation
OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 0 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 1 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 2 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 3 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &


# Results of the evaluation for logged data when running
# ./baselines_sim_eval.sh 10 0
# should be

# Average performance for d_6___m__gmm__seed_10__km_8 (across all specified seeds).
# NMI: 0.75
# TSS: 0.73

# Average performance for d_6___m__hmm-det__seed_10__km_8 (across all specified seeds).
# NMI: 0.48
# TSS: 0.73

# Average performance for d_6___m__hmm-stoch__seed_10__km_8 (across all specified seeds).
# NMI: 0.56
# TSS: 0.72

# Average performance for d_6___m__hmm-vstoch__seed_10__km_8 (across all specified seeds).
# NMI: 0.59
# TSS: 0.51
