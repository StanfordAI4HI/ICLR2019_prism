#!/usr/bin/env bash

# Run Prism on INRIA dataset with background frames included

# Usage
# > ./run_inria_background.sh 10 0
# which runs inference with Prism for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/inria_background/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/inria_dataset/VISION/"

# Changing tire
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 9 $dataset --data_config '0' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Coffee
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 9 $dataset --data_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# CPR
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 9 $dataset --data_config '2' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Jump Car
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 9 $dataset --data_config '3' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Repot
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 9 $dataset --data_config '4' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
done