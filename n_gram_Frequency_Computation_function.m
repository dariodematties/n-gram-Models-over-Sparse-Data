#This function computes a n-gram frequency. This receives the n-gram in String and a struct called Statistics that contains all the statistics learned from a training corpus, as the inputs and returns the frequency of the n-gram as the output.
 

#Inputs:
#	String:			The n-gram string whose probability want to be computed.
#	Statistics		A structure with statistical data from the corpus.
#	Statistics.N:		The size of the corpus.
#	Statistics.V:		The vocabulary size.
#	Statistics.Histogram:	The histogram from the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	C:			The frequency of the n-gram.

function C = n_gram_Frequency_Computation_function(String,Statistics)



n=  length(strread(String,"%s"));						#Extracts the number of word in the n-gram.

if (isempty( ind=find(ismember(Statistics.Histogram(1,:),String)) ))		#Returns the index where String occurs.
	C= 0;									#The n-gram did not occur in the corpus.
else
	C= Statistics.Histogram{2,ind};						#Extracts the frequency of the n-gram.
endif



endfunction
