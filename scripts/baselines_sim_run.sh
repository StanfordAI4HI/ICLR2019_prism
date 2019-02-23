#!/usr/bin/env bash

# Run baselines on simulated dataset

# Usage
# > ./baselines_sim_run.sh 10 0
# which runs inference with baselines for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to dataset is empty, since we're using simulated data
dataset="-"


for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 6 0 $dataset --d 2 --seed $seed --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 6 1 $dataset --d 2 --seed $seed --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 6 2 $dataset --d 2 --seed $seed --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 6 3 $dataset --d 2 --seed $seed --log $log --k_model -1 &
done