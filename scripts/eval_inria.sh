#!/usr/bin/env bash

# Usage
# > ./eval_inria.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/inria/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/inria_dataset/VISION/"

# Run evaluation for each of the activities, in sequence
# Note: run as background processes these by adding & at the end of each command

OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '0' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.7435389529488109 0.7491439356209997 0.4177471419604971 0.45178102423215255 0.4191329272662128


OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.7316059087692145 0.7552801856125961 0.3217223913028921 0.4317093891594749 0.39508085106382984


OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '2' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.5305825533981732 0.6056561808444261 0.13114962319124726 0.3089917913870177 0.31627859890666127


OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.7273285570168948 0.720908385979604 0.2755384729961915 0.21556612113248255 0.2667306769083053


OMP_NUM_THREADS=1 python ../gibbs.py evaluate 91 $dataset --data_config '4' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.6027025938913817 0.6991615407019341 0.16748061257369726 0.3360644458614485 0.3249103514224241
