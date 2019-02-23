#!/usr/bin/env bash


for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python baselines.py train $j 0 --seed $seed \
       --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
    done
done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python baselines.py train $j 1 --n_iters 2000 --seed $seed \
       --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
    done
done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python baselines.py train $j 2 --n_iters 2000 --seed $seed \
       --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
    done
done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python baselines.py train $j 3 --n_iters 2000 --seed $seed \
       --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
    done
done