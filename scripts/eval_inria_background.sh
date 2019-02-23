#!/usr/bin/env bash

# Evaluate Prism on INRIA dataset with background frames included

# Usage
# > ./eval_inria_background.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/inria_background/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/inria_dataset/VISION/"

# Run evaluation for each of the activities, in sequence
# Note: run as background processes by adding & at the end of each command

# Changing tire
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '0' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# Coffee
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# CPR
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '2' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# Jump Car
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# Repot
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '4' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &


# Results of the evaluation for logged data when running
# ./eval_inria_background.sh 10 0
# should be

# Changing tire
# Average performance for d_9_0__p_ind__a_tied-across_0__seed_10__km_12__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.24
# Munkres: 0.31
# RSS: 0.22
# LASS: 0.89
# SSS: 0.85
# TSS: 0.35

# Coffee
# Average performance for d_9_1__p_ind__a_tied-across_0__seed_10__km_11__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.17
# Munkres: 0.27
# RSS: 0.22
# LASS: 0.88
# SSS: 0.83
# TSS: 0.35

# CPR
# Average performance for d_9_2__p_ind__a_tied-across_0__seed_10__km_8__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.08
# Munkres: 0.28
# RSS: 0.22
# LASS: 0.88
# SSS: 0.83
# TSS: 0.35

# Jump Car
# Average performance for d_9_3__p_ind__a_tied-across_0__seed_10__km_13__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.10
# Munkres: 0.23
# RSS: 0.25
# LASS: 0.86
# SSS: 0.81
# TSS: 0.38

# Repot
# Average performance for d_9_4__p_ind__a_tied-across_0__seed_10__km_9__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.08
# Munkres: 0.24
# RSS: 0.23
# LASS: 0.85
# SSS: 0.82
# TSS: 0.35