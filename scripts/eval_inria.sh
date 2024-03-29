#!/usr/bin/env bash

# Evaluate Prism on INRIA dataset after removing background frames

# Usage
# > ./eval_inria.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/inria/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/inria_dataset/VISION/"

# Run evaluation for each of the activities, in sequence
# Note: run as background processes by adding & at the end of each command

# Changing tire
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '0' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# Coffee
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# CPR
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '2' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# Jump Car
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

# Repot
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '4' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &


# Results of the evaluation for logged data when running
# ./eval_inria.sh 10 0
# should be

# Changing tire
# Average performance for d_91_0__p_ind__a_tied-across_0__seed_10__km_11__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.42
# Munkres: 0.42
# RSS: 0.30
# LASS: 0.93
# SSS: 0.90
# TSS: 0.45

# Coffee
# Average performance for d_91_1__p_ind__a_tied-across_0__seed_10__km_10__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.32
# Munkres: 0.39
# RSS: 0.29
# LASS: 0.92
# SSS: 0.89
# TSS: 0.43

# CPR
# Average performance for d_91_2__p_ind__a_tied-across_0__seed_10__km_7__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.13
# Munkres: 0.32
# RSS: 0.19
# LASS: 0.91
# SSS: 0.88
# TSS: 0.31

# Jump Car
# Average performance for d_91_3__p_ind__a_tied-across_0__seed_10__km_12__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.28
# Munkres: 0.27
# RSS: 0.12
# LASS: 0.94
# SSS: 0.91
# TSS: 0.21

# Repot
# Average performance for d_91_4__p_ind__a_tied-across_0__seed_10__km_8__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.17
# Munkres: 0.32
# RSS: 0.21
# LASS: 0.90
# SSS: 0.86
# TSS: 0.34