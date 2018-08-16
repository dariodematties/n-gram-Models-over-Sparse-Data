#This function extracts the frequency of the frequency in a n-gram. This receives the r frequency in r and a struct called Statistics that contains all the statistics learned from a training corpus, as the inputs and returns the frequency of the r frequency as the output.
 

#Inputs:
#	r:			The frequency whose frequency of frequency want to be computed.
#	Statistics		A structure with statistical data from the corpus.
#	Statistics.N:		The size of the corpus.
#	Statistics.V:		The vocabulary size.
#	Statistics.Histogram:	The histogram from the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	Nr:			The frequency of the frequency r.

function Nr = Nr_from_r_function(r,Statistics)



if (r == 0)
	Nr= 0;
else
	ind= find(Statistics.Nr(1,:)==r);
	Nr= Statistics.Nr(2,ind);
endif



endfunction
