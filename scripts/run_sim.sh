#!/usr/bin/env bash

# Run Prism on simulated data

# Usage
# > ./run_sim.sh 10 0
# which runs inference with Prism for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/sim/"

# Path to dataset is empty, since we're using simulated data
dataset="-"

# Run inference for the simulated dataset
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 6 $dataset --log_freq 10 --n_iters 501 --seed $seed --d 2\
   --log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
done
