#!/usr/bin/env bash

seed=$(($2+1))

OMP_NUM_THREADS=1 python gibbs.py evaluate 6 --seed $seed --num_seeds $1 --d 2 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.8037947498254925 0.8258668390734416 0.7903585938564139 0.8277502110615241 0.7021944444444445 0.7376962397179788 0.9849748064090663 0.9781705294277758
