#!/usr/bin/env bash

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 0 --data_config '38-3-1-10-20-3' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 1 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 2 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 3 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 4 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hsmm/ --k_model -1 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1010 0 --data_config '38-3-1-10-20-3' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1010 1 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1010 2 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1010 3 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1100 0 --data_config '38-3-1-10-20-3' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1100 1 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1100 2 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1100 3 --data_config '38-3-1-10-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 0 --data_config '38-3-1-10-15-3' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 1 --data_config '38-3-1-10-15-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 2 --data_config '38-3-1-10-15-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 3 --data_config '38-3-1-10-15-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 0 --data_config '38-3-1-15-20-3' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 1 --data_config '38-3-1-15-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 2 --data_config '38-3-1-15-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 1001 3 --data_config '38-3-1-15-20-3' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done
