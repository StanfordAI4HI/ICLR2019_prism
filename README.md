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

_INRIA Instructional videos [dataset](https://www.di.ens.fr/willow/research/instructionvideos/release/VISION_data.zip)_
  
Unzip ``VISION_data.zip`` and pass in the dataset path as ``<path_before>/VISION/``
   
_Breakfast Actions video [dataset](https://uni-bonn.sciebo.de/s/lqj3GNVQWXaX1WC/download), 
[coarse segmentations](https://uni-bonn.sciebo.de/s/NsYSceejoCmrlTL/download), 
[fine segmentations](https://uni-bonn.sciebo.de/s/I5hJN7ka53PqlC0/download)_
  
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

#### Using Prism with your data

To run procedure extraction for your own dataset you need to,  

(1) Implement a data loader in ``datasets.py``

Data loaders need to return the time-series and ground-truth labels for evaluation (see `load_inria_dataset()` 
for an example). Call the data loader from `load_dataset()`. You can also pass custom options for different featurizations 
or custom settings using the `data_config` and different ground-truth labelings using the `eval_config` argument. Load 
the data in a new `if` condition (make sure to give your dataset a unique id) and specify all the variables required 
in `load_dataset()` (see examples for the INRIA/JIGSAWS/Breakfast/Bees datasets for clarification).

(2) Run Prism!

Add a script to `scripts/` to run Prism. Examples on how to run Prism can be found in `scripts/run_<dataset>.sh`.

(3) Evaluate

Add a script to `scripts/` to evaluate Prism. Examples on how to evaluate Prism can be found in `scripts/eval_<dataset>.sh`.


Please contact Karan Goel ``kgoel <at> cs <dot> stanford <dot> edu`` for questions!
