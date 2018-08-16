#This function returns the Cross-Validation or deleted estimation (del) conditional probability computation of a string fron the String input variable.
 

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



function Cond_Probability = del_Probability_Computation_function(String,Statistics_hi,Statistics_ho)



##############################This takes held in (hi) data as hi data and held out (ho) data as ho data.

C1= n_gram_Frequency_Computation_function (String,Statistics_hi);					#Extracts the frequency of the string in the held in data.

if (C1 == 0)

	Aux1= ismember(Statistics_ho.Histogram(1,:),Statistics_hi.Histogram(1,:));
	Tr1= length(find(Aux1==0));									#The number of elements in the held out data that are not in the held in data.
	Nr1= 1;

else

	N_grams1= Extract_n_gram_of_frequency_function (C1,Statistics_hi);				#Extracts the n-grams whose frecuency is C1.

	index1= find(ismember(Statistics_ho.Histogram(1,:),N_grams1(1,:)));				#Finds the indexes of the N_grams' n-grams in the held out data.

	Tr1= sum([Statistics_ho.Histogram{2,index1}]);							#Sums the frequencies of the N_grams' n-grams in the held out data.

	Nr1= n_gram_Frequency_of_Frequency_Computation_function(String,Statistics_hi);			#Extracts the frequency of the frequency of the string in the held in data.

endif

T1= Statistics_ho.N;											#This is the length of the held out corpus.

##############################This takes held in (hi) data as held out (ho) data and ho data as hi data.

C2= n_gram_Frequency_Computation_function (String,Statistics_ho);					#Extracts the frequency of the string in the held in data.

if (C2 == 0)

	Aux2= ismember(Statistics_hi.Histogram(1,:),Statistics_ho.Histogram(1,:));
	Tr2= length(find(Aux2==0));									#The number of elements in the held out data that are not in the held in data.
	Nr2= 1;

else

	N_grams2= Extract_n_gram_of_frequency_function (C2,Statistics_ho);				#Extracts the n-grams whose frecuency is C2.

	index2= find(ismember(Statistics_hi.Histogram(1,:),N_grams2(1,:)));				#Finds the indexes of the N_grams' n-grams in the held out data.

	Tr2= sum([Statistics_hi.Histogram{2,index2}]);							#Sums the frequencies of the N_grams' n-grams in the held out data.

	Nr2= n_gram_Frequency_of_Frequency_Computation_function(String,Statistics_ho);			#Extracts the frequency of the frequency of the string in the held in data.

endif

T2= Statistics_hi.N;											#This is the length of the held out corpus.


N= (T1 + T2)/2;


Cond_Probability= (Tr1 + Tr2)/(N*(Nr1 + Nr2));								#Held out probability computation.



endfunction
