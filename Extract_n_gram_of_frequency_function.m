#This function returns a cell array with all the n-grams of frequency Frequency in the struct Statistics
 

#Inputs:
#	Frequency:		The frequency of the n-grams to be extracted.
#	Statistics		A structure with statistical data from the corpus.
#	Statistics.N:		The size of the corpus.
#	Statistics.V:		The vocabulary size.
#	Statistics.Histogram:	The histogram from the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	N_grams:		A cell array with the n-grams of frequency Frequency.



function N_grams = Extract_n_gram_of_frequency_function(Frequency,Statistics)



[a index]= find([Statistics.Histogram{2,:}] == Frequency);	#Extracts the n-grams indexes with frequency equal to Frequency.

N_grams= Statistics.Histogram(1,index);				#Returns all the n-grans whit that frequency from the histogram.



endfunction
