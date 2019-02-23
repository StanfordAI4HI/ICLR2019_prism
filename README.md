# Learning Procedural Abstractions

This repository provides code to run experiments from,
 
**Learning Procedural Abstractions and Evaluating Discrete Latent Temporal Structure**  
Karan Goel and Emma Brunskill  
_ICLR 2019_

This repository provides an implementation of Prism, the hierarchical Bayesian model introduced in the paper.
 

### Usage

Install the requirements into your virtual environment using ``pip install -r requirements.txt``.

#### Running the ICLR Evaluation

It's possible to run evaluation for the ICLR paper by downloading the datasets and logs and then running the evaluation 
scripts. The steps to do this are,

(1) Download the datasets, 

INRIA Instructional videos [dataset](https://www.di.ens.fr/willow/research/instructionvideos/release/VISION_data.zip)  
Unzip ``VISION_data.zip`` and pass in the dataset path as ``<path_before>/VISION/``
   
Breakfast Actions video [dataset](https://uni-bonn.sciebo.de/s/lqj3GNVQWXaX1WC/download), 
[coarse segmentations](https://uni-bonn.sciebo.de/s/NsYSceejoCmrlTL/download), 
[fine segmentations](https://uni-bonn.sciebo.de/s/I5hJN7ka53PqlC0/download)  
Create a folder for the dataset (e.g. `breakfast`). Inside `breakfast` create a folder called `fisher`. 
First untar the dataset, and move the `s1` folder inside `breakfast/fisher/`. 
Then move the label data that all of them can be accessed inside 
`breakfast/`. The directory structure should look like,
 
`breakfast/fisher/s1`
`breakfast/segmentation_coarse`
`breakfast/segmentation_fine`. 
 

(2) Download the logs from,

and unzip them at a suitable location. Note that the logs are quite large (~3-5 GB each).

(3) As an example, to run evaluation for Prism on the INRIA dataset with background frames, run  
``> cd scripts``  
``> ./eval_inria_background.sh 10 0``
after editing `scripts/eval_inria_background.sh` to update the location of the log and dataset paths. Your output
should reproduce those shown in `scripts/eval_inria_background.sh`. Running on other datasets is exactly identical.



(2) Unzip ``logs.zip`` and ``datasets.zip`` which should yield ``logs/`` and `datasets/`. 

(3) Then, reproduce results on the `bees_0` dataset by running   

``> python evaluate.py --dataset bees_0``
  
which will reproduce all the plots and visualizations from the first sequence of the Bees dataset in ``plots/``. 
Run ``python evaluate.py`` to see a list of the available datasets.


Please contact Karan Goel ``kgoel <at> cs <dot> stanford <dot> edu`` for questions!
