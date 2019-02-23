#!/usr/bin/env bash

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 6 --log_freq 10 --n_iters 501 --seed $seed --d 2\
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
done
