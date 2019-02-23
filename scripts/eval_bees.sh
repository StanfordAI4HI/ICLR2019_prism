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
   OMP_NUM_THREADS=1 python ../gibbs.py evaluate $j $dataset --seed $seed --num_seeds $1 \
   --log $log --p_type ind --a_type tied-across --s_model 200 --k_model -1 --gamma 1.0 --delta 1.0
done


# Results of the evaluation for logged data when running
# ./eval_bees.sh 10 0
# should be

# Evaluation on Bees_1
# Average performance for d_71___p_ind__a_tied-across_0__seed_10__km_3__sm_200__gamma_1.00__delta_1.00__gmm_0 (across all specified seeds).
# NMI: 0.25
# Munkres: 0.60
# RSS: 0.50
# LASS: 0.84
# SSS: 0.79
# TSS: 0.62

# Evaluation on Bees_2
# Average performance for d_72___p_ind__a_tied-across_0__seed_10__km_3__sm_200__gamma_1.00__delta_1.00__gmm_0 (across all specified seeds).
# NMI: 0.46
# Munkres: 0.78
# RSS: 0.70
# LASS: 0.87
# SSS: 0.83
# TSS: 0.76

# Evaluation on Bees_3
# Average performance for d_73___p_ind__a_tied-across_0__seed_10__km_3__sm_200__gamma_1.00__delta_1.00__gmm_0 (across all specified seeds).
# NMI: 0.18
# Munkres: 0.49
# RSS: 0.44
# LASS: 0.80
# SSS: 0.73
# TSS: 0.55

# Evaluation on Bees_4
# Average performance for d_74___p_ind__a_tied-across_0__seed_10__km_3__sm_200__gamma_1.00__delta_1.00__gmm_0 (across all specified seeds).
# NMI: 0.42
# Munkres: 0.75
# RSS: 0.77
# LASS: 0.87
# SSS: 0.81
# TSS: 0.78

# Evaluation on Bees_5
# Average performance for d_75___p_ind__a_tied-across_0__seed_10__km_3__sm_200__gamma_1.00__delta_1.00__gmm_0 (across all specified seeds).
# NMI: 0.56
# Munkres: 0.82
# RSS: 0.85
# LASS: 0.89
# SSS: 0.83
# TSS: 0.84

# Evaluation on Bees_6
# Average performance for d_76___p_ind__a_tied-across_0__seed_10__km_3__sm_200__gamma_1.00__delta_1.00__gmm_0 (across all specified seeds).
# NMI: 0.54
# Munkres: 0.82
# RSS: 0.83
# LASS: 0.87
# SSS: 0.82
# TSS: 0.82