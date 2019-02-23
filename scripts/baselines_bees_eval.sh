#!/usr/bin/env bash

seed=$(($2+1))

#for ((j=71; j<=76; j++)); do
#   OMP_NUM_THREADS=1 python baselines.py evaluate $j 0 --seed $seed --num_seeds $1 \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#   sleep 5
#done
#
#for ((j=71; j<=76; j++)); do
#   OMP_NUM_THREADS=1 python baselines.py evaluate $j 1 --n_iters 2000 --seed $seed --num_seeds $1 \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
#   sleep 5
#done
#
#for ((j=71; j<=76; j++)); do
#   OMP_NUM_THREADS=1 python baselines.py evaluate $j 2 --n_iters 2000 --seed $seed --num_seeds $1 \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
#   sleep 5
#done
#
for ((j=71; j<=76; j++)); do
   OMP_NUM_THREADS=1 python baselines.py evaluate $j 3 --n_iters 2000 --seed $seed --num_seeds $1 \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
   sleep 5
done