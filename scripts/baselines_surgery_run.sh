#!/usr/bin/env bash

# Run baselines on JIGSAWS surgical dataset

# Usage
# > ./baselines_surgery_run.sh 10 0
# which runs inference with baselines for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/baselines/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/surgery_dataset/"


# Run on suturing with 10 expert demonstrations with 5 each from 2 experts
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 0 $dataset --data_config '38-3-1-10-20-3' --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 1 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 2 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 3 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done


# Run on needle passing with 10 expert demonstrations with 5 each from 2 experts
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1010 0 $dataset --data_config '38-3-1-10-20-3' --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1010 1 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1010 2 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1010 3 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done


# Run on knot tying with 10 expert demonstrations with 5 each from 2 experts
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1100 0 $dataset --data_config '38-3-1-10-20-3' --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1100 1 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1100 2 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1100 3 $dataset --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done


# Run on suturing with 5 expert demonstrations from the same expert
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 0 $dataset --data_config '38-3-1-15-20-3' --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 1 $dataset --data_config '38-3-1-15-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 2 $dataset --data_config '38-3-1-15-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 1001 3 $dataset --data_config '38-3-1-15-20-3' --n_iters 2000 --seed $seed \
   --log $log --k_model -1 &
done
