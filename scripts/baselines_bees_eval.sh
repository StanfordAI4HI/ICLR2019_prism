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
   OMP_NUM_THREADS=1 python baselines.py evaluate $j 0 $dataset --seed $seed --num_seeds $1 \
   --log $log --k_model -1 &
done

for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python baselines.py evaluate $j 1 $dataset --n_iters 2000 --seed $seed --num_seeds $1 \
   --log $log --k_model -1
done

for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python baselines.py evaluate $j 2 $dataset --n_iters 2000 --seed $seed --num_seeds $1 \
   --log $log --k_model -1
done

for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python baselines.py evaluate $j 3 $dataset --n_iters 2000 --seed $seed --num_seeds $1 \
   --log $log --k_model -1
done