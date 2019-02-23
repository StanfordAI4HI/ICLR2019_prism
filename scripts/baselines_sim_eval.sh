#!/usr/bin/env bash

# Evaluate baselines on simulated dataset

# Usage
# > ./baselines_sim_eval.sh 10 0
# which runs evaluation for results from baselines from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to dataset is empty, since we're using simulated data
dataset="-"


OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 0 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &
#0.786321200539901 0.7579403016333965 0.7521319730320725 0.7337079429819366

OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 1 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &
#0.47785165589484996 0.681685899155685 0.4768242268829388 0.7250399480844759

OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 2 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &
#0.5653016101263104 0.6718461169343642 0.5644695790224873 0.7239538535153682

OMP_NUM_THREADS=1 python ../baselines.py evaluate 6 3 $dataset --d 2 --seed $seed --num_seeds $1 --log $log --k_model -1 &
#0.6293747975468753 0.5853951931356878 0.5932431252033431 0.5130577487734443
