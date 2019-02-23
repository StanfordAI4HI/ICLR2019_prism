#!/usr/bin/env bash

# Usage
# > ./eval_inria.sh 10 0
# which runs evaluation for results from Prism from 10 random seeds, with values 1,...,10

# Sets the start seed
seed=$(($2+1))

# Path to where the logs are
log="/next/u/kgoel/bayesian-activity/logs/surgery/"

# Path to where the dataset is
dataset="/next/u/kgoel/bayesian-activity/datasets/surgery_dataset/"

# Run evaluation
# Note: run as background processes by adding & at the end of each command

# Evaluation on suturing on expert demonstrations with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0
#0.46466696533550894 0.48880683666830366 0.32869413468174513 0.44700555159625177

# Evaluation on needle passing with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python gibbs.py evaluate 1010 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#0.37276258808164614 0.397093228991005 0.15468698239253148 0.279835892565606

# Evaluation on knot tying with 10 expert demonstrations with 5 each from 2 experts
OMP_NUM_THREADS=1 python gibbs.py evaluate 1100 $dataset --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#0.3824605428023128 0.5019777856104295 0.09746560935844238 0.28776033366879944

# Evaluation on suturing with 5 expert demonstrations from the same expert
OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#0.5522902700631157 0.6040003524275817 0.5154212659964093 0.6141885934356661



# Evaluation to determine sensitivity to varying s on suturing with 5 expert demonstrations
OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1
#0.35751225376059254 0.31559419350673534 0.3301375812900735 0.3129422202908482 0.40710657785179016 0.19890457183372284 0.8074089171019875 0.7484398772896477

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1
#0.49452185727828724 0.4361802864922941 0.4715878986703224 0.4414075376190314 0.432304329725229 0.30551495496441794 0.8702767819429308 0.82038591343037

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1
#0.5244033765946143 0.5268201627278956 0.4978891182089937 0.538295152180735 0.4526269775187345 0.4048924660591896 0.8668690837408759 0.816969822926309

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1
#0.5744616088554167 0.637105978362618 0.5442107915854024 0.6479134889186187 0.4971648626144879 0.5394337070980278 0.8767343039671747 0.8291195840936044

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#0.5522902700631157 0.6124485452710551 0.5154212659964093 0.6202743437205023 0.4640861781848459 0.5038369528111131 0.873871632855252 0.8262168402447603

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 30 --k_model -1 --gamma 1.0 --delta 0.1
#0.5686110444811445 0.6671242306412234 0.5283584599738667 0.6767830171154762 0.49167776852622813 0.5772730495522702 0.8779600341004766 0.8300697333865052

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 35 --k_model -1 --gamma 1.0 --delta 0.1
#0.5582221023302817 0.6615691673529249 0.5174854768828904 0.6720534540067152 0.49977935054121564 0.5722977337779994 0.8725934251689897 0.8251225248084572

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 40 --k_model -1 --gamma 1.0 --delta 0.1
#0.5359017939230319 0.6360083053439122 0.48946371967680957 0.6371389580143803 0.4637094088259783 0.524222315590452 0.870435557193656 0.8222492550732199

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 45 --k_model -1 --gamma 1.0 --delta 0.1
#0.5506154085404371 0.6842177888318417 0.5049594315865265 0.6887400963654625 0.4866819317235637 0.598706835429742 0.8735188879649869 0.825751834094967

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1
#0.5445668797333713 0.6539597617191262 0.4979696404766848 0.6531323561258826 0.46397377185678607 0.5468475092565848 0.8671308805041514 0.818458169063929

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1
#0.4897051436588833 0.6451323427904939 0.43964258072590556 0.6333406564183519 0.45058076602830976 0.5212541687455687 0.8559494972227691 0.8076009283783417



# Evaluation to determine sensitivity to varying k on suturing with 5 expert demonstrations
OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 3 --gamma 1.0 --delta 0.1
#0.37806452918037114 0.6249736371120844 0.3442596731592489 0.637444138889678 0.48208368026644466 0.5338343268296526 0.8644846636621575 0.8022417127244251

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 5 --gamma 1.0 --delta 0.1
#0.5145014015542342 0.6727799280525989 0.48415532731380606 0.6934073958496378 0.5458742714404663 0.6030475827840655 0.8747301311560036 0.8211928634676191

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 7 --gamma 1.0 --delta 0.1
#0.5337131764920791 0.644406498152797 0.49684906505516924 0.6582450249273732 0.4954142381348875 0.5537135316824663 0.8757990587251673 0.8261116337360767

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
# 0.5522902700631157 0.6124485452710551 0.5154212659964093 0.6202743437205023 0.4640861781848459 0.5038369528111131 0.873871632855252 0.8262168402447603

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 13 --gamma 1.0 --delta 0.1
#0.5834163882031952 0.5959231819273885 0.5490380555900669 0.6032681359658805 0.4426124063280599 0.4742385966755074 0.8801295272743268 0.8370271332174966

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 $dataset --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log $log --p_type ind --a_type tied-across --s_model 25 --k_model 15 --gamma 1.0 --delta 0.1
#0.564814489947948 0.5560324515818429 0.5234799955599894 0.5511720911116802 0.39745420482930893 0.41348520259446964 0.8766466275047389 0.8332102264068002