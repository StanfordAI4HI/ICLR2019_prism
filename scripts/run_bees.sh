#!/usr/bin/env bash

# Run Prism on Bees dataset

# Usage
# > ./run_bees.sh 10 0
# which runs inference with Prism for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/bees/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/bees/data/"

# Run inference across all 6 Bees sequences individually
for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python gibbs.py train $j $dataset --log_freq 10 --n_iters 501 --seed $seed \
       --log $log --p_type ind --a_type tied-across --s_model 200 --k_model -1 --gamma 1.0 --delta 1.0 &
   done
done

