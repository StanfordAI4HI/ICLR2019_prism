#!/usr/bin/env bash

# Usage
# > ./eval_inria.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/surgery/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/surgery_dataset/"

# Run evaluation
# Note: run as background processes by adding & at the end of each command

# Evaluation on suturing on expert demonstrations with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &

# Evaluation on needle passing with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1010 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &

# Evaluation on knot tying with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1100 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &

# Evaluation on suturing with 5 expert demonstrations from the same expert
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &



# Evaluation to determine sensitivity to varying s on suturing with 5 expert demonstrations
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 30 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 35 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 40 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 45 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1 &



# Evaluation to determine sensitivity to varying k on suturing with 5 expert demonstrations
OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 3 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 5 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 7 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 13 --gamma 1.0 --delta 0.1 &

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 15 --gamma 1.0 --delta 0.1 &


# Results of the evaluation for logged data when running
# ./eval_surgery.sh 10 0
# should be

# Evaluation on suturing on expert demonstrations with 10 expert demonstrations with 5 each from 2 experts
# Average performance for d_1001_38-3-1-10-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.33
# Munkres: 0.38
# RSS: 0.33
# LASS: 0.89
# SSS: 0.84
# TSS: 0.47


# Evaluation on needle passing with 10 expert demonstrations with 5 each from 2 experts
# Average performance for d_1010_38-3-1-10-20-3__p_ind__a_tied-across_0__seed_10__km_8__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.15
# Munkres: 0.27
# RSS: 0.17
# LASS: 0.86
# SSS: 0.81
# TSS: 0.28


# Evaluation on knot tying with 10 expert demonstrations with 5 each from 2 experts
# Average performance for d_1100_38-3-1-10-20-3__p_ind__a_tied-across_0__seed_10__km_6__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.10
# Munkres: 0.29
# RSS: 0.18
# LASS: 0.86
# SSS: 0.81
# TSS: 0.29


# Evaluation on suturing with 5 expert demonstrations from the same expert
# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_5__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.33
# Munkres: 0.41
# RSS: 0.20
# LASS: 0.81
# SSS: 0.75
# TSS: 0.31



# Evaluation to determine sensitivity to varying s on suturing with 5 expert demonstrations
# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_10__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.47
# Munkres: 0.43
# RSS: 0.31
# LASS: 0.87
# SSS: 0.82
# TSS: 0.44

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_15__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.50
# Munkres: 0.45
# RSS: 0.40
# LASS: 0.87
# SSS: 0.82
# TSS: 0.54

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_20__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.54
# Munkres: 0.50
# RSS: 0.54
# LASS: 0.88
# SSS: 0.83
# TSS: 0.65

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.52
# Munkres: 0.46
# RSS: 0.50
# LASS: 0.87
# SSS: 0.83
# TSS: 0.62

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_30__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.53
# Munkres: 0.49
# RSS: 0.58
# LASS: 0.88
# SSS: 0.83
# TSS: 0.68

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_35__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.52
# Munkres: 0.50
# RSS: 0.57
# LASS: 0.87
# SSS: 0.83
# TSS: 0.67

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_40__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.49
# Munkres: 0.46
# RSS: 0.52
# LASS: 0.87
# SSS: 0.82
# TSS: 0.64

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_45__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.50
# Munkres: 0.49
# RSS: 0.60
# LASS: 0.87
# SSS: 0.83
# TSS: 0.69

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_50__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.50
# Munkres: 0.46
# RSS: 0.55
# LASS: 0.87
# SSS: 0.82
# TSS: 0.65

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_100__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.44
# Munkres: 0.45
# RSS: 0.52
# LASS: 0.86
# SSS: 0.81
# TSS: 0.63



# Evaluation to determine sensitivity to varying k on suturing with 5 expert demonstrations
# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_3__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.34
# Munkres: 0.48
# RSS: 0.53
# LASS: 0.86
# SSS: 0.80
# TSS: 0.64

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_5__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.48
# Munkres: 0.55
# RSS: 0.60
# LASS: 0.87
# SSS: 0.82
# TSS: 0.69

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_7__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.50
# Munkres: 0.50
# RSS: 0.55
# LASS: 0.88
# SSS: 0.83
# TSS: 0.66

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_10__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.52
# Munkres: 0.46
# RSS: 0.50
# LASS: 0.87
# SSS: 0.83
# TSS: 0.62

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_13__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.55
# Munkres: 0.44
# RSS: 0.47
# LASS: 0.88
# SSS: 0.84
# TSS: 0.60

# Average performance for d_1001_38-3-1-15-20-3__p_ind__a_tied-across_0__seed_10__km_15__sm_25__gamma_1.00__delta_0.10__gmm_0 (across all specified seeds).
# NMI: 0.52
# Munkres: 0.40
# RSS: 0.41
# LASS: 0.88
# SSS: 0.83
# TSS: 0.55





