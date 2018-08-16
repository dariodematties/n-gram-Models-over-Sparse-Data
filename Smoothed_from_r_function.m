#This function extracts the smoothed expectation of the frequency of the r frequency. This receives the r frequency in r and a structure called Statistics that contains all the statistics learned from a training corpus, as the inputs and returns the smoothed expectation of the frequency of the r frequency as the output.

 

#Inputs:
#	r:			The frequency whose frequency of frequency want to be computed.
#	Statistics		A structure with statistical data from the corpus.
#	Statistics.N:		The size of the corpus.
#	Statistics.V:		The vocabulary size.
#	Statistics.Histogram:	The histogram from the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	Smoothed:		The frequency of the frequency r.

function Smoothed = Smoothed_from_r_function(r,Statistics)



if (r == 0)
	Smoothed= 0;
else
	ind= find(Statistics.Nr(1,:)==r);
	Smoothed= Statistics.Nr(7,ind);
endif



endfunction
