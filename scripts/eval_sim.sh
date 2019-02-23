#!/usr/bin/env bash

# Evaluate Prism on simulated data

# Usage
# > ./eval_sim.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/sim/"

# Path to dataset is empty, since we're using simulated data
dataset="-"

# Run evaluation for the simulated dataset
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 6 $dataset --seed $seed --num_seeds $1 --d 2 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1


# Results of the evaluation for logged data when running
# ./eval_sim.sh 10 0
# should be

# Average performance for d_6___p_ind__a_tied-across_0__seed_10__km_8__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.79
# Munkres: 0.70
# RSS: 0.73
# LASS: 0.99
# SSS: 0.98
# TSS: 0.83