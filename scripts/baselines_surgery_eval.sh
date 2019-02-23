#!/usr/bin/env bash

# Evaluate baselines on JIGSAWS surgical dataset

# Usage
# > ./baselines_surgery_eval.sh 10 0
# which runs evaluation for results from baselines from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/surgery_dataset/"


# Evaluation on suturing with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 0 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 1 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 2 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 3 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &


# Evaluation on needle passing with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python ../baselines.py evaluate 1010 0 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1010 1 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1010 2 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1010 3 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &


# Evaluation on knot tying with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python ../baselines.py evaluate 1100 0 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1100 1 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1100 2 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1100 3 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &


# Evaluation on suturing with 5 expert demonstrations from the same expert
OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 0 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 1 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 2 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &

OMP_NUM_THREADS=1 python ../baselines.py evaluate 1001 3 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --k_model -1 &


# Results of the evaluation for logged data when running
# ./baselines_surgery_eval.sh 10 0
# should be


# Evaluation on suturing with 10 expert demonstrations with 5 each from 2 experts
# Average performance for d_1001_38-3-1-10-20-3__m__gmm__seed_10__km_10 (across all specified seeds).
# NMI: 0.20
# TSS: 0.35

# Average performance for d_1001_38-3-1-10-20-3__m__hmm-det__seed_10__km_10 (across all specified seeds).
# NMI: 0.18
# TSS: 0.39

# Average performance for d_1001_38-3-1-10-20-3__m__hmm-stoch__seed_10__km_10 (across all specified seeds).
# NMI: 0.19
# TSS: 0.39

# Average performance for d_1001_38-3-1-10-20-3__m__hmm-vstoch__seed_10__km_10 (across all specified seeds).
# NMI: 0.18
# TSS: 0.38


# Evaluation on needle passing with 10 expert demonstrations with 5 each from 2 experts
# Average performance for d_1010_38-3-1-10-20-3__m__gmm__seed_10__km_8 (across all specified seeds).
# NMI: 0.03
# TSS: 0.22

# Average performance for d_1010_38-3-1-10-20-3__m__hmm-det__seed_10__km_8 (across all specified seeds).
# NMI: 0.03
# TSS: 0.25

# Average performance for d_1010_38-3-1-10-20-3__m__hmm-stoch__seed_10__km_8 (across all specified seeds).
# NMI: 0.03
# TSS: 0.23

# Average performance for d_1010_38-3-1-10-20-3__m__hmm-vstoch__seed_10__km_8 (across all specified seeds).
# NMI: 0.03
# TSS: 0.23


# Evaluation on knot tying with 10 expert demonstrations with 5 each from 2 experts
# Average performance for d_1100_38-3-1-10-20-3__m__gmm__seed_10__km_6 (across all specified seeds).
# NMI: 0.07
# TSS: 0.25

# Average performance for d_1100_38-3-1-10-20-3__m__hmm-det__seed_10__km_6 (across all specified seeds).
# NMI: 0.05
# TSS: 0.23

# Average performance for d_1100_38-3-1-10-20-3__m__hmm-stoch__seed_10__km_6 (across all specified seeds).
# NMI: 0.06
# TSS: 0.24

# Average performance for d_1100_38-3-1-10-20-3__m__hmm-vstoch__seed_10__km_6 (across all specified seeds).
# NMI: 0.06
# TSS: 0.25


# Evaluation on suturing with 5 expert demonstrations from the same expert
# Average performance for d_1001_38-3-1-15-20-3__m__gmm__seed_10__km_10 (across all specified seeds).
# NMI: 0.33
# TSS: 0.53

# Average performance for d_1001_38-3-1-15-20-3__m__hmm-det__seed_10__km_10 (across all specified seeds).
# NMI: 0.27
# TSS: 0.54

# Average performance for d_1001_38-3-1-15-20-3__m__hmm-stoch__seed_10__km_10 (across all specified seeds).
# NMI: 0.30
# TSS: 0.52

# Average performance for d_1001_38-3-1-15-20-3__m__hmm-vstoch__seed_10__km_10 (across all specified seeds).
# NMI: 0.29
# TSS: 0.51







