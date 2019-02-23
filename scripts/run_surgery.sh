#!/usr/bin/env bash

# Run Prism on JIGSAWS surgical dataset

# Usage
# > ./run_surgery.sh 10 0
# which runs inference with Prism for 10 random seeds, with values 1,...,10

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/surgery/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/surgery_dataset/"

# Run on suturing with 10 expert demonstrations with 5 each from 2 experts
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Run on needle passing with 10 expert demonstrations with 5 each from 2 experts
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1010 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
done

# Run on knot tying with 10 expert demonstrations with 5 each from 2 experts
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1100 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
done


# Run on suturing with 5 expert demonstrations from the same expert
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
done


# Determine sensitivity to varying s on suturing with 5 expert demonstrations
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 30 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 35 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 40 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 45 --k_model -1 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1 &
done



# Determine sensitivity to varying k on suturing with 5 expert demonstrations
for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model 3 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model 5 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model 7 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model 13 --gamma 1.0 --delta 0.1 &
done

for ((i=1; i<=$1; i++)); do
   seed=$(($2+$i))
   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
   --log /next/u/kgoel/bayesian-activity/logs/  \
   --p_type ind --a_type tied-across --s_model 25 --k_model 15 --gamma 1.0 --delta 0.1 &
done