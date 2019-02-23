#!/usr/bin/env bash


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 6 0 --d 2 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 6 1 --d 2 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 6 2 --d 2 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 6 3 --d 2 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 6 4 --d 2 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
done
