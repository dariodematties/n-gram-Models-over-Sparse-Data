#This function ...
 

#Inputs:
#	String:			The n-gram string whose probability want to be computed.
#	Statistics		A structure with statistical data for n-grams from the corpus.
#	Statistics.N:		The size of the corpus.
#	Statistics.V:		The vocabulary size.
#	Statistics.Histogram:	The histogram from the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	Cond_Probability:	The conditional probability of the last word in the n-gram.



function Cond_Probability = GT_Probability_Computation_function(String,Statistics)



A= strread(String,"%s");					#A cell array with the words in the n-gram.

n= length(A);							#The number of words in the n-gram.

P0= Statistics.Nr(2,1)/(Statistics.N*( Statistics.V^n - length(Statistics.Histogram) ));

r= n_gram_Frequency_Computation_function (String,Statistics);

if (r == 0)

	Cond_Probability= P0;

else

	Nr= Nr_from_r_function(r,Statistics);

	Nr1= Nr_from_r_function(r+1,Statistics);

	x= (r + 1)*(Nr1)/(Nr);

	S= Smoothed_from_r_function(r, Statistics);

	S1= Smoothed_from_r_function(r, Statistics);

	y= (r + 1)*(S1)/(S);

	SD= sqrt((r + 1)^2 * (Nr1/Nr^2) * (1 + (Nr1/Nr)));

	if abs(x-y) > 1.96*SD
		Cond_Probability= (1-P0)*x/Statistics.N;
	else
		Cond_Probability= (1-P0)*y/Statistics.N;
	endif

endif



endfunction
