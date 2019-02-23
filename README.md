# Learning Procedural Abstractions

This repository provides code to run experiments from,
 
**Learning Procedural Abstractions and Evaluating Discrete Latent Temporal Structure**  
Karan Goel and Emma Brunskill  
_ICLR 2019_

This repository provides an implementation of Prism, the hierarchical Bayesian model introduced in the paper.
 

### Usage

Install the requirements into your virtual environment using ``pip install -r requirements.txt``.

#### Running Evaluation

It's possible to run evaluation by downloading the datasets and logs and then running the evaluation scripts. The steps
to do this are,

(1) Download the datasets, 

INRIA Instructional videos [dataset](https://www.di.ens.fr/willow/research/instructionvideos/release/VISION_data.zip)  
Unzip ``VISION_data.zip`` and pass in the dataset path as ``<path_before>/VISION/``
   
Breakfast Actions video [dataset](https://uni-bonn.sciebo.de/index.php/s/lqj3GNVQWXaX1WC), 
[coarse segmentations](https://uni-bonn.sciebo.de/index.php/s/NsYSceejoCmrlTL), 
[fine segmentations](https://uni-bonn.sciebo.de/index.php/s/I5hJN7ka53PqlC0)  
Unzip all the folders inside a single dataset directory (say `breakfast`) so that all  



(2) Unzip ``logs.zip`` and ``datasets.zip`` which should yield ``logs/`` and `datasets/`. 

(3) Then, reproduce results on the `bees_0` dataset by running   

``> python evaluate.py --dataset bees_0``
  
which will reproduce all the plots and visualizations from the first sequence of the Bees dataset in ``plots/``. 
Run ``python evaluate.py`` to see a list of the available datasets.


Please contact Karan Goel ``kgoel <at> cs <dot> stanford <dot> edu`` for questions!
