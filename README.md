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

- _INRIA Instructional videos [dataset](https://www.di.ens.fr/willow/research/instructionvideos/release/VISION_data.zip)_
  
Unzip ``VISION_data.zip`` and pass in the dataset path as ``<path_before>/VISION/``
   
- _Breakfast Actions video [dataset](https://uni-bonn.sciebo.de/s/lqj3GNVQWXaX1WC/download), 
[coarse segmentations](https://uni-bonn.sciebo.de/s/NsYSceejoCmrlTL/download), 
[fine segmentations](https://uni-bonn.sciebo.de/s/I5hJN7ka53PqlC0/download)_
  
Create a folder for the dataset (e.g. `breakfast`). Inside `breakfast` create a folder called `fisher`. 
First untar the dataset, and move the `s1` folder inside `breakfast/fisher/`. 
Then untar and move the label data so that all of them can be accessed inside 
`breakfast/`. The directory structure should look like,
 
`breakfast/`  
`---- breakfast/fisher/s1/`  
`---- breakfast/segmentation_coarse/`  
`---- breakfast/segmentation_fine/`. 
 

(2) Download the [logs](https://drive.google.com/drive/folders/1rVlEopUpWVmtbmX_9rpXQLM-QjaI2YJ2?usp=sharing),
and unzip them at a suitable location. Note that the logs are quite large (~10 GB total).

(3) As an example, to run evaluation for Prism on the INRIA dataset with background frames, run
  
``> cd scripts``  
``> ./eval_inria_background.sh 10 0``

after editing `scripts/eval_inria_background.sh` to update the location of the log and dataset paths. Your output
should reproduce those shown in `scripts/eval_inria_background.sh`. Running on other datasets is exactly identical using 
the other evaluation scripts in `/scripts`. Note that evaluation may be slow since the logs are very large and contain
the history of the entire Gibbs sampler.


#### Using Prism with your data

To run procedure extraction for your own dataset you need to,  

(1) Implement a data loader in ``datasets.py``

Data loaders need to return the time-series and ground-truth labels for evaluation (see `load_inria_dataset()` 
for an example). Call the data loader from `load_dataset()`. You can also pass custom options for different featurizations 
or custom settings using the `data_config` and different ground-truth labelings using the `eval_config` argument. Load 
the data in a new `if` condition (make sure to give your dataset a unique id) and specify all the variables required 
in `load_dataset()` (see examples for the INRIA/JIGSAWS/Breakfast/Bees datasets for clarification).

(2) Run Prism in `gibbs.py`!

Add a script to `scripts/` to run Prism. Examples on how to run Prism can be found in `scripts/run_<dataset>.sh`.

(3) Evaluate

Add a script to `scripts/` to evaluate Prism. Examples on how to evaluate Prism can be found in `scripts/eval_<dataset>.sh`.

Word of caution: The logs can grow to be very large since they are storing the history of the entire Gibbs sampler so you should have
plenty of disk space. You  will need to edit `gibbs.py` to change this behavior (make sure to also edit the evaluation functions in this case).

Please contact Karan Goel ``kgoel <at> cs <dot> stanford <dot> edu`` for questions!
