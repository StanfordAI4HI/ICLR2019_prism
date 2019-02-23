#!/usr/bin/env bash

# Run baselines on bees dataset

# Usage
# > ./baselines_bees_run.sh 10 0
# which runs inference with baselines for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/bees/data/"


for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python ../baselines.py train $j 0 $dataset --seed $seed --log $log --k_model -1 &
    done
done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python ../baselines.py train $j 1 $dataset --n_iters 2000 --seed $seed --log $log --k_model -1 &
    done
done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python ../baselines.py train $j 2 $dataset --n_iters 2000 --seed $seed --log $log --k_model -1 &
    done
done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python ../baselines.py train $j 3 $dataset --n_iters 2000 --seed $seed --log $log --k_model -1 &
    done
done