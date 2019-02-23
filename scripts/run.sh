#!/usr/bin/env bash

# $1: number of random seeds to run with
# $2: optional offset for random seeds
# $3: train or evaluate


## Vanilla models perform as a baseline
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model -1 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#53, 47
#55, 48
#54, 54
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model -1 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#58, 56
#52, 46
#56, 52
#
## This model makes gamma higher which didn't help much
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model -1 --k_model -1 --gamma 5.0 --delta 1.0 #&
#done
#51, 48
#54, 48
#56, 54
#
#
## Having a lot more segments boosted performance for the mean of scores but not the overall score
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#58, 43
#67, 49
#62, 53
#
## This model made things much worse -- don't need this model because we'll give k_model as known
## It does highlight the fragility of the observation model
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model -1 --k_model 20 --gamma 1.0 --delta 1.0 #&
#done
#45, 35
#51, 45
#40, 27
#
## More evidence that giving more segments is useful for optimization
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 50 --k_model 20 --gamma 1.0 --delta 1.0 #&
#done
#54, 43
#54, 43
#58, 45
#
#
## Having a lot lot more segments boosted performance for the mean of scores and a little for the overall score(?)
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#65, 51
#
#62, 54
#
## Having more segments boosted performance for the mean of scores and a little for the overall score
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#63, 58
#60, 52
#61, 49
#
## Changing gamma doesn't seem to help matters, reducing delta probably made things worse
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 100 --k_model -1 --gamma 10.0 --delta 0.1 #&
#done
#61, 46
#63, 54
#61, 50
#
#
## Making delta large incentivizes all the segments to be used and the procedure to be shared across the dataset
## However, this means we shouldn't use a constrained procedure
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 100.0 #&
#done
#55, 52
#60, 59
#57, 55
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 100.0 --a_bound 1 #&
#done
#58, 51
#59, 59
#57, 57
#
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 100.0 --a_bound 1 #&
#done
#53, 49
#56, 51
#54, 50


# GMM
# 10 runs, --k_model -1
# 62.54, 49.63, 38
# It does nice optimization of the clusters but can't capture the procedure properly!!!!

# Lessons
# Use any procedure with a larger number of segments to make optimization better and boost performance
# For constrained procedure maybe fewer segments with large delta and a_bound?
# For independent procedure, large delta with more segments helps keep procedures aligned and boosts performance


# Optimize a constrained model with a lot of segments but no other hyper-params tuned
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#61 46 51
#62 54 49
#59 46 54
#61 49 44
#63 54 48

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model 200 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#62 45 43
#61 53 55
#61 49 51
#61 50 51
#61 50 49

# Optimize a constrained model with few segments, a_bound and delta tuning (bad performance)
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model -1 --k_model -1 --gamma 1.0 --delta 1.0 --a_bound 10 #&
#done
#47 45
#53 50
#46 44
#52 54
#44 39

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type constrained --a_type tied-across --s_model -1 --k_model -1 --gamma 1.0 --delta 100.0 --a_bound 10 #&
#done
#54 49
#46 41
#52 52
#52 52
#42 36

# Optimize an independent procedure with lots of segments and high delta
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 100.0 #&
#done
#57 47 47
#50 47 46
#60 51 45
#64 68 45
#54 50 47

# Optimize an independent procedure with lots of segments and high delta
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 10000.0 #&
#done
#59 57 41
#54 51 50
#57 54 55
#58 53 43
#57 50 43

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 10.0 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-1' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-1-0-10-20-2' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 #&
#done
#
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-1-0-10-20-2' --log_freq 10 --n_iters 2001 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 100.0 #&
#done
#
#

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py $3 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 &
#done



#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 10. &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-within --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 1.0 &
#done


## Needle passing
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1010 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
## Knot tying
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1100 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
## Needle passing
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1010 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
## Knot tying
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1100 --data_config '38-3-1-10-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1 &
#done



## Suturing expert 1
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-15-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

# Suturing expert 2
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

## Suturing expert 1
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-10-15-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
## Suturing expert 2
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1 &
#done


# Hyper-parameter varying
# Suturing expert 2
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 30 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 35 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 45 --k_model -1 --gamma 1.0 --delta 0.1 &
#done

#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 40 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model 3 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model 5 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model 7 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model 13 --gamma 1.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model 15 --gamma 1.0 --delta 0.1 &
#done


#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 0.1 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 0.01 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 10.0 --delta 0.1 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 100.0 --delta 0.1 &
#done

#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.01 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 10.0 &
#done
#
#for ((i=1; i<=$1; i++)); do
#   seed=$(($2+$i))
#   OMP_NUM_THREADS=1 python gibbs.py train 1001 --data_config '38-3-1-15-20-3' --log_freq 10 --n_iters 501 --seed $seed \
#   --log /next/u/kgoel/bayesian-activity/logs/  \
#   --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 100.0 &
#done
