#!/usr/bin/env bash
#
#
seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 10.0
#
#sleep 2
#
#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0
#
#sleep 2
#
#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-1' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1
#
#sleep 2


#WE ARE BETTER THAN GMM
#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 1.0

#sleep 2
#0.35742974600256683 0.5022956041756514 0.22879686860352785 0.4602289280353558
#NEW
#0.356982240674594 0.4693397409355399 0.2293126470324091 0.40176268446302166

#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1

#sleep 2
#0.35546916584949095 0.4973923979585827 0.23260763964805237 0.4569727603239092
#NEW
#0.35530500468346704 0.4652530494866848 0.23213708810498837 0.39611412316720873

#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1

#sleep 2
#0.4227805101734714 0.5210580639371917 0.28626403366844466 0.468760991690481
#NEW
#0.4197260942757235 0.5044500073791631 0.2831390463935256 0.4446813090543479


#********
#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1

#0.4653983042694427 0.5004606135895994 0.33131239632658477 0.4714420170569479
#NEW
#0.46638357217878046 0.4977074092331442 0.33263776837867043 0.4668227096093912


#sleep 2

#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 10.

#0.46488969827716875 0.4697802563961688 0.3276518422406298 0.4323325994542621
#NEW
#0.4656373791285473 0.46679725865296656 0.3297191276124757 0.4291275463280385

#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-within --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1

#NEW
#0.46104322500770045 0.4549266223210601 0.3267045166197986 0.38077583434072887

#sleep 2
#
#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0
#0.46466696533550894 0.48880683666830366 0.32869413468174513 0.44700555159625177
#sleep 2
#
#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 1.0
#0.47783774384607025 0.4586482745759078 0.342337771959717 0.4107946877470985


#GMM
#HMM (det)
#HMM (stoch) 0.19082816039393405 0.37141541164086805
#HMM (v stoch) 0.19082816039393405 0.37141541164086805


# Our model gives superior or comparable performance to HMMs/GMMs -- if the features are not good then our performance
# gap will increase, since encoding the presence of a procedure helps override noisy observations


#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1010 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.37276258808164614 0.397093228991005 0.15468698239253148 0.279835892565606
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1010 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
##0.3112241017201923 0.3721521305265961 0.12022124189592813 0.2753608545912117

#OMP_NUM_THREADS=1 python gibbs.py evaluate 1100 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.3824605428023128 0.5019777856104295 0.09746560935844238 0.28776033366879944

#OMP_NUM_THREADS=1 python gibbs.py evaluate 1100 --data_config '38-3-1-10-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
##0.3398758842919664 0.47760471467499377 0.08446026006362348 0.27755762670103107


#seed=$(($2+1))
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-15-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.3984758970367442 0.38617614635430003 0.2690545232071563 0.30837484598681353

#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-10-15-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.34663481519591743 0.4011568499837039 0.23479612343892664 0.312065792768819

#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.5522902700631157 0.6040003524275817 0.5154212659964093 0.6141885934356661

#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.5445668797333713 0.6246403419589782 0.4979696404766848 0.6335046711918719


# Varying s
#
OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 5 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.35751225376059254 0.31559419350673534 0.3301375812900735 0.3129422202908482 0.40710657785179016 0.19890457183372284 0.8074089171019875 0.7484398772896477

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 10 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.49452185727828724 0.4361802864922941 0.4715878986703224 0.4414075376190314 0.432304329725229 0.30551495496441794 0.8702767819429308 0.82038591343037

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 15 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5244033765946143 0.5268201627278956 0.4978891182089937 0.538295152180735 0.4526269775187345 0.4048924660591896 0.8668690837408759 0.816969822926309


OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 20 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5744616088554167 0.637105978362618 0.5442107915854024 0.6479134889186187 0.4971648626144879 0.5394337070980278 0.8767343039671747 0.8291195840936044


OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5522902700631157 0.6124485452710551 0.5154212659964093 0.6202743437205023 0.4640861781848459 0.5038369528111131 0.873871632855252 0.8262168402447603


OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 30 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5686110444811445 0.6671242306412234 0.5283584599738667 0.6767830171154762 0.49167776852622813 0.5772730495522702 0.8779600341004766 0.8300697333865052


OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 35 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5582221023302817 0.6615691673529249 0.5174854768828904 0.6720534540067152 0.49977935054121564 0.5722977337779994 0.8725934251689897 0.8251225248084572

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 40 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5359017939230319 0.6360083053439122 0.48946371967680957 0.6371389580143803 0.4637094088259783 0.524222315590452 0.870435557193656 0.8222492550732199


OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 45 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5506154085404371 0.6842177888318417 0.5049594315865265 0.6887400963654625 0.4866819317235637 0.598706835429742 0.8735188879649869 0.825751834094967

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 50 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.5445668797333713 0.6539597617191262 0.4979696404766848 0.6531323561258826 0.46397377185678607 0.5468475092565848 0.8671308805041514 0.818458169063929

OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
--log /next/u/kgoel/bayesian-activity/logs/  \
--p_type ind --a_type tied-across --s_model 100 --k_model -1 --gamma 1.0 --delta 0.1
sleep 2
#0.4897051436588833 0.6451323427904939 0.43964258072590556 0.6333406564183519 0.45058076602830976 0.5212541687455687 0.8559494972227691 0.8076009283783417


# Varying k
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model 3 --gamma 1.0 --delta 0.1
#sleep 2
##0.37806452918037114 0.6249736371120844 0.3442596731592489 0.637444138889678 0.48208368026644466 0.5338343268296526 0.8644846636621575 0.8022417127244251
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model 5 --gamma 1.0 --delta 0.1
#sleep 2
##0.5145014015542342 0.6727799280525989 0.48415532731380606 0.6934073958496378 0.5458742714404663 0.6030475827840655 0.8747301311560036 0.8211928634676191
#
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model 7 --gamma 1.0 --delta 0.1
#sleep 2
#
##0.5337131764920791 0.644406498152797 0.49684906505516924 0.6582450249273732 0.4954142381348875 0.5537135316824663 0.8757990587251673 0.8261116337360767
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#0.5522902700631157 0.6124485452710551 0.5154212659964093 0.6202743437205023 0.4640861781848459 0.5038369528111131 0.873871632855252 0.8262168402447603
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model 13 --gamma 1.0 --delta 0.1
#sleep 2
##0.5834163882031952 0.5959231819273885 0.5490380555900669 0.6032681359658805 0.4426124063280599 0.4742385966755074 0.8801295272743268 0.8370271332174966
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model 15 --gamma 1.0 --delta 0.1
#sleep 2
##0.564814489947948 0.5560324515818429 0.5234799955599894 0.5511720911116802 0.39745420482930893 0.41348520259446964 0.8766466275047389 0.8332102264068002

# Varying gamma
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 0.01 --delta 0.1
#sleep 2
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 0.1 --delta 0.1
#sleep 2
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 10.0 --delta 0.1
#sleep 2
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 100.0 --delta 0.1
#sleep 2


#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.01
#sleep 2
##0.5513941326848545 0.5978783868978326 0.5123585071181704 0.6064631450516145 0.4741798501248959 0.4858992673511725 0.8741810896591625 0.8268778184848917
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 0.1
#sleep 2
##0.5522902700631157 0.6124485452710551 0.5154212659964093 0.6202743437205023 0.4640861781848459 0.5038369528111131 0.873871632855252 0.8262168402447603
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 1.0
#sleep 2
##0.5226552238178972 0.5674831614873316 0.48284868509760087 0.5697926822997916 0.4399771024146544 0.4428730863160107 0.8715662771580929 0.8234330480032757
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 10.0
#sleep 2
##0.54765511843056 0.6012822616598115 0.5107052777934411 0.6135990866006759 0.46594088259783517 0.49648354822614954 0.8721924521626013 0.823565720566576
#
#OMP_NUM_THREADS=1 python gibbs.py evaluate 1001 --data_config '38-3-1-15-20-3' --seed $seed --num_seeds $1 \
#--log /next/u/kgoel/bayesian-activity/logs/  \
#--p_type ind --a_type tied-across --s_model 25 --k_model -1 --gamma 1.0 --delta 100.0
#sleep 2
##0.5418396219147038 0.5862250238991887 0.5042064891553775 0.5936206325194355 0.4548501248959201 0.46762401197447556 0.8714024386341735 0.8231077040563741