# Statistical  Inference:  n-gram Models over Sparse Data

In this repository I have implemented computational models for the estimation of frequency of occurrence of chain of words
(n-grams) under the hypotheses of maximum likelihood and the laws of Laplace, Lidstone and Jaffreys-Perks.
In order to estimate the probability of occurrency of n-grams, I have elaborated models such as:
held-out estimator and cross validation; I have also elaborated the estimator of frequencies of n-grams of
Good-Turing. The Good-Turing estimator returns the best results vs the standard measurements in front of Data Sparseness phenomenon
for the available linguistic corpora.
All these models have been tested using the same linguistic corpora that were used for the original models [1] in the book
with satisfactory results. 

[1] C. D. Manning and H. Schütze, Statistical Inference: n-gram Models over Sparse Data, ,
1999, Cambridge, Massachusetts, London, England. In: Foundations of Statistical Natural
Language Processing. Ed by: , Ed: The MIT Press, vol: , pp 191-217

All the code in this repository is in: [GNU Octave](https://www.gnu.org/software/octave/) programming language for scientific computing.

