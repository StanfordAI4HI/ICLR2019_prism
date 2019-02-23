#!/usr/bin/env bash

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 100.0 --delta 1.0 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 50 --k_model 30 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '0-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '1-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '2-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '3-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '4-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '5-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '6-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '7-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '8-0-4-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
done



#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '0-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activityg/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '1-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '2-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '3-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '4-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '5-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '6-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '7-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '8-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 8 --data_config '9-0-5-1' --eval_config '1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

