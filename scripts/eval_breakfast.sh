#!/usr/bin/env bash

seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
##0.3233684131386005 0.47626909337952467 0.08227135551211597 0.3477815247231997
#sleep 2
#
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0
##0.32423960747690106 0.4762961180182456 0.08359380234453449 0.3503549585794559
#sleep 2
#
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1
##0.3690059067717034 0.49901292076869697 0.11953247308945605 0.41141808731087154
#sleep 2
#
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1
##0.3792146505249881 0.5060954518682363 0.11628440303888996 0.46026184033138795
#sleep 2

#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.4978953779954128 0.5807122720178542 0.19593151636611553 0.5676257730388671

#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 100.0 --delta 1.0
##0.49861718807238614 0.5782319465860669 0.19645069697362497 0.5720183955690633
#sleep 2

##36 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '0-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.3983341785825042 0.5469814876547998 0.22512545102212025 0.592191728978347 0.4387826682065101
##35 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '1-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.3625743070027573 0.5496952660636529 0.18194546909360054 0.5308169669140133 0.32665167275794205
##29 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '2-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.4019722580746176 0.5798579564740748 0.18618562040300218 0.5685652263909343 0.32066829019652265
##27 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '3-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.4735983118319852 0.6192785402621508 0.22847711636434037 0.52709889551542 0.36694497153700195
##40 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '4-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.4495806865238527 0.5705233297716484 0.1983392407849927 0.5150455150381928 0.4610267630813566
##19 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '5-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.5045916076598235 0.6106343880399553 0.2866051574978292 0.5602234964393173 0.2904943739720897
##22 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '6-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.3300405667085845 0.5335292962624605 0.09282431976219062 0.42976022945182385 0.29958657253523063
##31 seqs
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '7-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.48765440148449357 0.6177481720693926 0.24976811115848285 0.5365122409476769 0.39315870232354233

OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '8-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1 &
sleep 2
#0.5200303729176924 0.6203828211228892 0.2378586180931765 0.5142187941140837 0.2743290904269425

#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-4-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1 &
#sleep 2
##0.4854196009719846 0.5894181948356849 0.19019984512313617 0.560219091870466 0.4376186059784547




##184
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '0-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.2848239139991655 0.4801973951312128 0.10073315640097395 0.4358375714434636
#
##0.28497637534033937 0.480306249566571 0.10073767773459275 0.4357928258020018 0.3665996068909701
#
#
##167
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '1-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.35126073086112547 0.457307551712843 0.15218319659944624 0.44967543722040937
#
##0.3381145458839744 0.4566800029072704 0.14574878797012708 0.445941663202004 0.3026303184713376
#
##173
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '2-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.39433626290152063 0.47305001861513996 0.17323979034738127 0.5198605640163425
#
##0.39479915750725014 0.4739536978725297 0.17315627182302057 0.5172121593122903 0.29225883764951677
#
##162
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '3-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.5342315238770416 0.5960199958346821 0.30837406329662154 0.5721947132620848
#
##0.5342682429463863 0.5963174687601052 0.30809386992317017 0.5714961765576507 0.4356760917789623
#
##187
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '4-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.37178893192955464 0.5285463383193948 0.153461926587762 0.45967702527613297
#
##0.37176698781843426 0.5285727297742349 0.1534330753604067 0.45967545179721947 0.3931087884487594
#
##157
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '5-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.5610438590817549 0.5830664907785441 0.34509684115551786 0.5976511482736704
#
##0.5610438590817549 0.5830664907785441 0.34509684115551786 0.5976511482736704 0.3376616642589957
#
##163
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '6-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.3485884164643044 0.4678345754745948 0.10944664702563847 0.38684677254390626
#
## 0.35023429855805405 0.4707324883848886 0.11000914690885222 0.38604207643190247 0.28794793691903464
#
##169
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '7-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
##0.4496738343609872 0.5477124973111129 0.2142863700770296 0.4824055356805624
#
## 0.4498513494205434 0.5482078538867354 0.21421397404755407 0.4815645543790069 0.34678777188982685
#
#
##166
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '8-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
#
##0.5608455562352457 0.5878544915465737 0.24948339115415025 0.4777314037829726 0.29361916684053135
#
##184
#OMP_NUM_THREADS=1 python gibbs.py evaluate 8 --data_config '9-0-5-1' --eval_config '1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1 &
##sleep 2
#
##0.3511473296261841 0.49435284184898753 0.0965746286713798 0.38859552512694145 0.2915826803873725
