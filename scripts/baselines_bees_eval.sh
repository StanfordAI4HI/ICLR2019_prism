#!/usr/bin/env bash

# Evaluate baselines on bees dataset

# Usage
# > ./baselines_bees_eval.sh 10 0
# which runs evaluation for results from baselines from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/bees/data/"


for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python ../baselines.py evaluate $j 0 $dataset --seed $seed --num_seeds $1 \
   --log $log --k_model -1 &
done

for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python ../baselines.py evaluate $j 1 $dataset --n_iters 2000 --seed $seed --num_seeds $1 \
   --log $log --k_model -1 &
done

for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python ../baselines.py evaluate $j 2 $dataset --n_iters 2000 --seed $seed --num_seeds $1 \
   --log $log --k_model -1 &
done

for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python ../baselines.py evaluate $j 3 $dataset --n_iters 2000 --seed $seed --num_seeds $1 \
   --log $log --k_model -1 &
done


# Results of the evaluation for logged data when running
# ./baselines_bees_eval.sh 10 0
# should be

# Evaluation on Bees_1
# Average performance for d_71___m__gmm__seed_10__km_3 (across all specified seeds).
# NMI: 0.20
# TSS: 0.61
# Average performance for d_71___m__hmm-det__seed_10__km_3 (across all specified seeds).
# NMI: 0.32
# TSS: 0.66
# Average performance for d_71___m__hmm-stoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.29
# TSS: 0.65
# Average performance for d_71___m__hmm-vstoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.22
# TSS: 0.59


# Evaluation on Bees_2
# Average performance for d_72___m__gmm__seed_10__km_3 (across all specified seeds).
# NMI: 0.36
# TSS: 0.69

# Average performance for d_72___m__hmm-det__seed_10__km_3 (across all specified seeds).
# NMI: 0.37
# TSS: 0.71

# Average performance for d_72___m__hmm-stoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.38
# TSS: 0.69

# Average performance for d_72___m__hmm-vstoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.50
# TSS: 0.78


# Evaluation on Bees_3
# Average performance for d_73___m__gmm__seed_10__km_3 (across all specified seeds).
# NMI: 0.13
# TSS: 0.48

# Average performance for d_73___m__hmm-det__seed_10__km_3 (across all specified seeds).
# NMI: 0.17
# TSS: 0.52

# Average performance for d_73___m__hmm-stoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.18
# TSS: 0.53

# Average performance for d_73___m__hmm-vstoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.19
# TSS: 0.54


# Evaluation on Bees_4
# Average performance for d_74___m__gmm__seed_10__km_3 (across all specified seeds).
# NMI: 0.31
# TSS: 0.64

# Average performance for d_74___m__hmm-det__seed_10__km_3 (across all specified seeds).
# NMI: 0.40
# TSS: 0.78

# Average performance for d_74___m__hmm-stoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.37
# TSS: 0.74

# Average performance for d_74___m__hmm-vstoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.44
# TSS: 0.82


# Evaluation on Bees_5
# Average performance for d_75___m__gmm__seed_10__km_3 (across all specified seeds).
# NMI: 0.37
# TSS: 0.75

# Average performance for d_75___m__hmm-det__seed_10__km_3 (across all specified seeds).
# NMI: 0.66
# TSS: 0.87

# Average performance for d_75___m__hmm-stoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.66
# TSS: 0.87

# Average performance for d_75___m__hmm-vstoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.61
# TSS: 0.86


# Evaluation on Bees_6
# Average performance for d_76___m__gmm__seed_10__km_3 (across all specified seeds).
# NMI: 0.36
# TSS: 0.66

# Average performance for d_76___m__hmm-det__seed_10__km_3 (across all specified seeds).
# NMI: 0.43
# TSS: 0.74

# Average performance for d_76___m__hmm-stoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.50
# TSS: 0.81

# Average performance for d_76___m__hmm-vstoch__seed_10__km_3 (across all specified seeds).
# NMI: 0.62
# TSS: 0.86
