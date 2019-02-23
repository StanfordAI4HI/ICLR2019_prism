#!/usr/bin/env bash

#for ((j=71; j<=76; j++)); do
#    for ((i=1; i<=$1; i++)); do
#       seed=$(($2+$i))
#       OMP_NUM_THREADS=1 python gibbs.py $3 $j --log_freq 10 --n_iters 2001 --seed $seed \
#       --log /next/u/kgoel/bayesian-activity/logs/bees/  \
#       --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 --gmm_init #&
#   done
#done
#67.88, 32.16
#68.17, 32.34
#67.88, 32.40
#68.70, 32.13
#67.57, 32.20
#
#68.99, 38.65
#70.14, 38.44
#68.97, 38.59
#68.88, 36.44
#69.16, 38.34
#
#50.26, 15.91
#49.48, 14.62
#49.53, 15.36
#49.56,  14.87
#50.10, 15.70
#
#63.70 32.88
#63.9 32.73
#63.87 33.07
#62.78 30.6
#63.87 33.09
#
#86.33 63.44
#86.34 64.3
#69,06 28.66
#86.03 62.57
#86.36 63.74
#
#61.99 26.41
#85.23 62.22
#63.10 26.51
#69.83 30.28
#85.71 63.39

#for ((j=71; j<=76; j++)); do
#    for ((i=1; i<=$1; i++)); do
#       seed=$(($2+$i))
#       OMP_NUM_THREADS=1 python gibbs.py train $j --log_freq 10 --n_iters 201 --seed $seed \
#       --log /next/u/kgoel/bayesian-activity/logs/bees/  \
#       --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 &
#   done
#done
#

#for ((i=1; i<=$1; i++)); do
#    for ((j=71; j<=76; j++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 $j --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/bees/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 10.0 &
#   done
#done



#----Final------#

#for ((j=71; j<=76; j++)); do
#    for ((i=1; i<=$1; i++)); do
#       seed=$(($2+$i))
#       OMP_NUM_THREADS=1 python gibbs.py train $j --log_freq 10 --n_iters 501 --seed $seed \
#       --log /next/u/kgoel/bayesian-activity/final/bees/  \
#       --p_type ind --a_type tied-across --s_model 200 --k_model -1 --gamma 1.0 --delta 1.0 &
#   done
#done

for ((j=71; j<=76; j++)); do
    for ((i=1; i<=$1; i++)); do
       seed=$(($2+$i))
       OMP_NUM_THREADS=1 python gibbs.py train $j --log_freq 10 --n_iters 501 --seed $seed \
       --log /next/u/kgoel/bayesian-activity/final/bees/  \
       --p_type ind --a_type tied-across --s_model 200 --k_model -1 --gamma 1.0 --delta 10.0 &
   done
done

#for ((j=71; j<=76; j++)); do
#    for ((i=1; i<=$1; i++)); do
#       seed=$(($2+$i))
#       OMP_NUM_THREADS=1 python gibbs.py train $j --log_freq 10 --n_iters 201 --seed $seed \
#       --log /next/u/kgoel/bayesian-activity/final/bees/  \
#       --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 &
#   done
#done



#for ((j=71; j<=76; j++)); do
#    for ((i=1; i<=$1; i++)); do
#       seed=$(($2+$i))
#       OMP_NUM_THREADS=1 python gibbs.py train $j --log_freq 10 --n_iters 201 --seed $seed \
#       --log /next/u/kgoel/bayesian-activity/final/bees/  \
#       --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 --a_bound 5 &
#   done
#done
