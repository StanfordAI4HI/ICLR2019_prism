#!/usr/bin/env bash

# Run Prism on Breakfast actions dataset

# Usage
# > ./run_breakfast.sh 10 0
# which runs inference with Prism for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/breakfast/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/breakfast_data/"

# Cereals
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '0-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Coffee
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '1-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Fried Egg
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '2-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Juice
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '3-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Milk
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '4-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Pancakes
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '5-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Salad
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '6-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Sandwiches
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '7-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Scrambled Eggs
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '8-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Tea
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 $dataset --data_config '9-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

