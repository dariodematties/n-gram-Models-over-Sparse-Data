#This function computes the frequency of the frequency in a n-gram. This receives the n-gram in String and a struct called Statistics that contains all the statistics learned from a training corpus, as the inputs and returns the frequency of the n-gram as the output.
 

#Inputs:
#	String:			The n-gram string whose frequency of frequency want to be computed.
#	Statistics		A structure with statistical data from the corpus.
#	Statistics.N:		The size of the corpus.
#	Statistics.V:		The vocabulary size.
#	Statistics.Histogram:	The histogram from the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	Frequency_of_Frequency:	The frequency of the frequency in the n-gram.

function Frequency_of_Frequency = n_gram_Frequency_of_Frequency_Computation_function(String,Statistics)



n=  length(strread(String,"%s"));						#Extracts the number of word in the n-gram.

C= n_gram_Frequency_Computation_function(String,Statistics);			#Extracts the frequency of the n-gram String in the corpus.

if (C == 0)
	Frequency_of_Frequency= 0;
else
	ind= find(Statistics.Nr(1,:)==C);
	Frequency_of_Frequency= Statistics.Nr(2,ind);
endif


endfunction
