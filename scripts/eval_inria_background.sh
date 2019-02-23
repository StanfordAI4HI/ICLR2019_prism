#!/usr/bin/env bash

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
# Note: run as background processes these by adding & at the end of each command

# Changing tire
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '0' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.7435389529488109 0.7491439356209997 0.4177471419604971 0.45178102423215255 0.4191329272662128

# Coffee
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.7316059087692145 0.7552801856125961 0.3217223913028921 0.4317093891594749 0.39508085106382984

# CPR
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '2' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.5305825533981732 0.6056561808444261 0.13114962319124726 0.3089917913870177 0.31627859890666127

# Jump Car
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.7273285570168948 0.720908385979604 0.2755384729961915 0.21556612113248255 0.2667306769083053

# Repot
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 9 $dataset --data_config '4' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.6027025938913817 0.6991615407019341 0.16748061257369726 0.3360644458614485 0.3249103514224241


# Results of the evaluation for logged data when running
# ./eval_inria_background.sh 10 0
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
# TSS: 0.34#!/usr/bin/env bash