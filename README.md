# Learning Procedural Abstractions

This repository provides code to run experiments from,
 
**Learning Procedural Abstractions and Evaluating Discrete Latent Temporal Structure**  
Karan Goel and Emma Brunskill  
_ICLR 2019_

This repository provides an implementation of Prism, the hierarchical Bayesian model introduced in the paper.
 

#### Usage

(1) Install the requirements into your virtual environment using ``pip install -r requirements.txt``.

(2) Unzip ``logs.zip`` and ``datasets.zip`` which should yield ``logs/`` and `datasets/`. 

(3) Then, reproduce results on the `bees_0` dataset by running   

``> python evaluate.py --dataset bees_0``
  
which will reproduce all the plots and visualizations from the first sequence of the Bees dataset in ``plots/``. 
Run ``python evaluate.py`` to see a list of the available datasets.


Please contact Karan Goel ``kgoel <at> cs <dot> stanford <dot> edu`` for questions!
