#!/usr/bin/env bash

seed=$(($2+1))
OMP_NUM_THREADS=1 python baselines.py evaluate 1001 0 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1
#0.2719311523001443 0.40323054790129137 0.19958548293533723 0.3302275219994034

OMP_NUM_THREADS=1 python baselines.py evaluate 1001 1 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
#0.2719311523001443 0.40323054790129137 0.19958548293533723 0.3302275219994034

OMP_NUM_THREADS=1 python baselines.py evaluate 1001 2 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
#0.244615942672663 0.43020797350241063 0.17520818875835467 0.37040468619083783

OMP_NUM_THREADS=1 python baselines.py evaluate 1001 3 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
#0.2690348033457517 0.42575214637433545 0.18982132004389146 0.3693866697351207

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 4 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hsmm/ --k_model -1
#0.2762014912325945 0.4243217552651048 0.19771780473510955 0.36146377351188197


OMP_NUM_THREADS=1 python baselines.py evaluate 1010 0 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1
sleep 2
#0.15610392395712547 0.3299417839634296 0.029423076183203258 0.21288656064289327

OMP_NUM_THREADS=1 python baselines.py evaluate 1010 1 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
sleep 2
#0.15839589691996508 0.3526781240686143 0.029887702183847953 0.24703132367419153

OMP_NUM_THREADS=1 python baselines.py evaluate 1010 2 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
sleep 2
#0.17365131050172775 0.3393215500173259 0.03265640701571173 0.22115784410010142


OMP_NUM_THREADS=1 python baselines.py evaluate 1010 3 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
sleep 2
#0.17280619586871432 0.3385502406595172 0.03205328048907477 0.22284067053064377



OMP_NUM_THREADS=1 python baselines.py evaluate 1100 0 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1
sleep 2
#0.2904341146049695 0.445386786813205 0.07428585230843875 0.2516495048228378

OMP_NUM_THREADS=1 python baselines.py evaluate 1100 1 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
sleep 2
#0.24802988440381238 0.4093400129813592 0.04971686555126091 0.23071681457065493

OMP_NUM_THREADS=1 python baselines.py evaluate 1100 2 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
sleep 2
#0.26346265024708615 0.41643195308685765 0.054975900816813396 0.24019169222703787

OMP_NUM_THREADS=1 python baselines.py evaluate 1100 3 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
sleep 2
#0.2922075169256894 0.4468177202676613 0.061144153691103056 0.24715262543740663


#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 0 --data_config '38-3-1-10-15-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1
#sleep 2
#0.197179949820731 0.33754457935985516 0.1505534088823598 0.2829198764660476

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 1 --data_config '38-3-1-10-15-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
#sleep 2
#0.12385465814258387 0.3447967279480534 0.08112376070146543 0.31772327986353394

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 2 --data_config '38-3-1-10-15-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
#sleep 2
#0.1528921639501575 0.33478749193501633 0.10324350949335148 0.2796460846818477

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 3 --data_config '38-3-1-10-15-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
#sleep 2
#0.1520726056640514 0.33919309943624465 0.10100912841203147 0.2917731788067783

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 0 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/gmm/ --k_model -1
#sleep 2
#0.37561689119373987 0.49616967791432814 0.3257804507911487 0.4903078637931766

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 1 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-det/ --k_model -1
#sleep 2
#0.3231616170863009 0.5020055881051733 0.27487386076552606 0.49921364640224636

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 2 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-stoch/ --k_model -1
#sleep 2
#0.35715601596435265 0.4975039594775622 0.29930976565693096 0.4872203688187319

#OMP_NUM_THREADS=1 python baselines.py evaluate 1001 3 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/hmm-vstoch/ --k_model -1
#sleep 2
#0.34619676626835855 0.4886026496555417 0.2865439701098043 0.4731625815176236