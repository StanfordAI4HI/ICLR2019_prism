#!/usr/bin/env bash

# Usage
# > ./eval_breakfast.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/breakfast/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/breakfast_data/"

# Run evaluation for each of the breakfast food categories, in sequence
# Note: run as background processes these by adding & at the end of each command

# Cereals, 184 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '0-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.28497637534033937 0.480306249566571 0.10073767773459275 0.4357928258020018 0.3665996068909701

# Coffee, 167 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '1-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.3381145458839744 0.4566800029072704 0.14574878797012708 0.445941663202004 0.3026303184713376

# Fried Egg, 173 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '2-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.39479915750725014 0.4739536978725297 0.17315627182302057 0.5172121593122903 0.29225883764951677

# Juice, 162 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '3-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.5342682429463863 0.5963174687601052 0.30809386992317017 0.5714961765576507 0.4356760917789623

# Milk, 187 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '4-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.37176698781843426 0.5285727297742349 0.1534330753604067 0.45967545179721947 0.3931087884487594

# Pancakes, 157 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '5-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
#0.5610438590817549 0.5830664907785441 0.34509684115551786 0.5976511482736704 0.3376616642589957

# Salad, 163 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '6-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
# 0.35023429855805405 0.4707324883848886 0.11000914690885222 0.38604207643190247 0.28794793691903464

# Sandwiches, 169 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '7-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
# 0.4498513494205434 0.5482078538867354 0.21421397404755407 0.4815645543790069 0.34678777188982685

# Scrambled Eggs, 166 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '8-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
# 0.5608455562352457 0.5878544915465737 0.24948339115415025 0.4777314037829726 0.29361916684053135

# Tea, 184 sequences
OMP_NUM_THREADS=1 python gibbs.py evaluate 8 $dataset --data_config '9-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
# 0.3511473296261841 0.49435284184898753 0.0965746286713798 0.38859552512694145 0.2915826803873725