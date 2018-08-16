#This function tests a corpus and returns the probability on each n-gram in a histogram. The fuunction loads the ngram.m necesary files to make the probability computation. The function receives the corpus to be tested in Test_corpus, the number the words in each n-gram in n, the method to be aplied in Method and lambda for the Lid method, as the inputs and returns a struct with each n-gram probability in Probability.


#Inputs:
#	Test_Corpus:		The corpus to be tested.
#	n			The number of words for each n-gram to be analized.
#	Method:			The method to be applied to compute the probability.
#	lambda:			For the Lid computation.


#Outputs:
#	Probability:		A structure whose elements have the statistical data from the corpus.
#	Probability.N:		The number of elements in the corpus.
#	Probability.V:		The size of the vocabulary.
#	Probability.Histogram:	A cell array with the histogram of frequencies C(w1 … wn) for the distinct n-grams (w1 … wn) in the corpus.
#	Probability.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.




function Probability= Corpus_Statistic_Testing_function(Test_Corpus,n,Method,lambda)



Statistics_Test= Corpus_Statistics_function(Test_Corpus,n);

Probability= Statistics_Test;

n1=n-1;


if (!strcmp(Method,'del') && !strcmp(Method,'ho'))
	if (n == 1)
		name= [num2str(n) 'gram.m'];
		load (name)
		S1=S;
		S2=S;
		clear S
	else
		name= [num2str(n) 'gram.m'];
		load (name)
		S1=S;
		clear S
		name= [num2str(n1) 'gram.m'];
		load (name)
		S2=S;
		clear S
	endif
else
	name= [num2str(n) 'gram.m']; #This is temporal. The name array must be ['hi_' num2str(n) 'gram.m']
	load (name)
	S1=S;
	clear S
	#name= ['ho_' num2str(n) 'gram.m'];
	#load (name)
	#S2=S;
	#clear S;
	#S2=Statistics_Test; #This is temporal, there must be a ho_ngram.m file available.
	S2=S1;
endif

for i=1:length(Statistics_Test.Histogram(1,:))

	Probability.Histogram(3,i)= Conditional_Probability_Computation_function (Statistics_Test.Histogram{1,i},S1,S2,Method,lambda);

endfor



endfunction
