#This function returns the held out conditional probability computation of a string fron the String input variable.
 

#Inputs:
#	String:				The n-gram string whose probability want to be computed.
#	Statistics_hi			A structure with statistical data for n-grams from the held in corpus.
#	Statistics_hi.N:		The size of the corpus.
#	Statistics_hi.V:		The vocabulary size.
#	Statistics_hi.Histogram:	The histogram from the corpus.
#	Statistics_hi.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.
#	Statistics_ho			A structure with statistical data for n-grams from the held out corpus.
#	Statistics_ho.N:		The size of the corpus.
#	Statistics_ho.V:		The vocabulary size.
#	Statistics_ho.Histogram:	The histogram from the corpus.
#	Statistics_ho.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	Cond_Probability:		The conditional probability of the last word in the n-gram.



function Cond_Probability = ho_Probability_Computation_function(String,Statistics_hi,Statistics_ho)



C1= n_gram_Frequency_Computation_function (String,Statistics_hi);					#Extracts the frequency of the string in the held in data.

if (C1 == 0)

	Aux= ismember(Statistics_ho.Histogram(1,:),Statistics_hi.Histogram(1,:));
	Tr= length(find(Aux==0));									#The number of elements in the held out data that are not in the held in data.
	Nr= 1;

else

	N_grams= Extract_n_gram_of_frequency_function (C1,Statistics_hi);				#Extracts the n-grams whose frecuency is C1.

	index= find(ismember(Statistics_ho.Histogram(1,:),N_grams(1,:)));				#Finds the indexes of the N_grams' n-grams in the held out data.

	Tr= sum([Statistics_ho.Histogram{2,index}]);							#Sums the frequencies of the N_grams' n-grams in the held out data.

	Nr= n_gram_Frequency_of_Frequency_Computation_function(String,Statistics_hi);			#Extracts the frequency of the frequency of the string in the held in data.

endif

T= Statistics_ho.N;											#This is the length of the held out corpus.

Cond_Probability= Tr/(Nr*T);										#Held out probability computation.



endfunction
