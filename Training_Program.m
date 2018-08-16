#This program ...

#load Test.m
load AustenTraining.m

n=1

name= [num2str(n) 'gram.m'];

S= Corpus_Statistics_function (TrainingCorpus,n);
save (name, 'S')
