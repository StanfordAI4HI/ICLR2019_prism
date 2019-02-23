#!/usr/bin/env bash

seed=$(($2+1))

# Making tea -- coarse segmentation
#OMP_NUM_THREADS=1 python baselines.py evaluate 8 0 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1
##0.265811025460546 0.45700063448001316 0.075680463073725 0.2940294904577787
#
#OMP_NUM_THREADS=1 python baselines.py evaluate 8 1 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
##0.13131873322777995 0.44992731290575944 0.03622496793929481 0.33705188240663997
#
#OMP_NUM_THREADS=1 python baselines.py evaluate 8 2 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
##0.20227433161020364 0.44905263570525344 0.056454385674670336 0.24216484043716568
#
#OMP_NUM_THREADS=1 python baselines.py evaluate 8 3 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
##0.2113092277326119 0.45936654623479145 0.06314487109707065 0.23617971317445666

# Making tea -- fine segmentation
OMP_NUM_THREADS=1 python baselines.py evaluate 8 0 --data_config '9-0-4-0' --eval_config '1' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model 28


OMP_NUM_THREADS=1 python baselines.py evaluate 8 1 --data_config '9-0-4-0' --eval_config '1' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model 28


OMP_NUM_THREADS=1 python baselines.py evaluate 8 2 --data_config '9-0-4-0' --eval_config '1' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model 28


OMP_NUM_THREADS=1 python baselines.py evaluate 8 3 --data_config '9-0-4-0' --eval_config '1' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model 28


