#!/usr/bin/env bash

# Making tea -- coarse
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '9-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

# Making tea -- fine
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '9-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model 30 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model 30 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model 30 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model 30 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '0-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '0-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '0-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '0-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '1-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '1-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '1-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '1-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '2-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '2-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '2-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '2-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '3-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '3-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '3-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '3-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '4-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '4-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '4-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '4-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '5-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '5-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '5-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '5-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '6-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '6-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '6-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '6-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '7-0-4-1' --eval_config '1' --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '7-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '7-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '7-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
#done


for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '8-0-4-1' --eval_config '1' --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '8-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '8-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '8-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
done


for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 0 --data_config '9-0-4-1' --eval_config '1' --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 1 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 2 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python baselines.py train 8 3 --data_config '9-0-4-1' --eval_config '1' --n_iters 2000 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1 &
done