#!/usr/bin/env bash

# Usage
# > ./eval_breakfast.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/breakfast/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/breakfast_data/"

# Run evaluation for each of the breakfast food categories, in sequence
# Note: run as background processes by adding & at the end of each command

# Cereals, 184 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '0-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Coffee, 167 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '1-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Fried Egg, 173 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '2-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Juice, 162 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '3-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Milk, 187 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '4-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Pancakes, 157 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '5-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Salad, 163 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '6-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Sandwiches, 169 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '7-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Scrambled Eggs, 166 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '8-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

# Tea, 184 sequences
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 8 $dataset --data_config '9-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &


# Results of the evaluation for logged data when running
# ./eval_surgery.sh 10 0
# should be

# Fried Egg
# Average performance for d_8_2-0-5-1__p_ind__a_tied-across_0__seed_10__km_9__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.17
# Munkres: 0.29
# RSS: 0.38
# LASS: 0.87
# SSS: 0.82
# TSS: 0.51

# Juice
# Average performance for d_8_3-0-5-1__p_ind__a_tied-across_0__seed_10__km_9__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.31
# Munkres: 0.43
# RSS: 0.42
# LASS: 0.91
# SSS: 0.86
# TSS: 0.57

# Pancakes
# Average performance for d_8_5-0-5-1__p_ind__a_tied-across_0__seed_10__km_14__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.35
# Munkres: 0.34
# RSS: 0.49
# LASS: 0.89
# SSS: 0.84
# TSS: 0.62

# Salad
# Average performance for d_8_6-0-5-1__p_ind__a_tied-across_0__seed_10__km_8__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.11
# Munkres: 0.29
# RSS: 0.25
# LASS: 0.90
# SSS: 0.86
# TSS: 0.38

# Sandwiches
# Average performance for d_8_7-0-5-1__p_ind__a_tied-across_0__seed_10__km_9__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.21
# Munkres: 0.35
# RSS: 0.35
# LASS: 0.90
# SSS: 0.85
# TSS: 0.49

# Scrambled Eggs
# Average performance for d_8_8-0-5-1__p_ind__a_tied-across_0__seed_10__km_12__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.25
# Munkres: 0.29
# RSS: 0.33
# LASS: 0.91
# SSS: 0.86
# TSS: 0.47

# Tea
# Average performance for d_8_9-0-5-1__p_ind__a_tied-across_0__seed_10__km_7__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.10
# Munkres: 0.29
# RSS: 0.26
# LASS: 0.89
# SSS: 0.84
# TSS: 0.40

