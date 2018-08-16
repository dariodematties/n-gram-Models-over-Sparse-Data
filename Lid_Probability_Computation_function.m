#This function computes the conditional probability of the last word in a n-gram with respect to the rest of the words in that n-gram througth the Lidstone's (Lid) method. This receives the n-gram in String, two structs called Statistics1 and Statistics2 that contain all the statistics learned from a training corpus for the n-grams and for the (n-1)-grams respectivelly, as the inputs and returns the conditional probability of the last word of n-gram as the output.
 

#Inputs:
#	String:			The n-gram string whose probability want to be computed.
#	Statistics1		A structure with statistical data for n-grams from the corpus.
#	Statistics1.N:		The size of the corpus.
#	Statistics1.V:		The vocabulary size.
#	Statistics1.Histogram:	The histogram from the corpus.
#	Statistics1.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.
#	Statistics2		A structure with statistical data for (n-1)-grams from the corpus.
#	Statistics2.N:		The size of the corpus.
#	Statistics2.V:		The vocabulary size.
#	Statistics2.Histogram:	The histogram from the corpus.
#	Statistics2.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.
#	lambda:			For the Lid computation.

#Outputs:
#	Cond_Probability:	The conditional probability of the last word in the n-gram.



function Cond_Probability = Lid_Probability_Computation_function(String,Statistics1,Statistics2,lambda)



A= strread(String,"%s");							#A cell array with the words in the n-gram.

n= length(A);									#The number of words in the n-gram.

if (n > 1)									#If n > 1 then computes the frequency of the (n-1)-gram in C2 too.

	A= Insert_Final_Spaces_function (A);

	One_less_String= [A{1:end-1}];

	One_less_String= [One_less_String(1:end-1)];				#Forms the (n-1)-gram string.

	C1= n_gram_Frequency_Computation_function (String,Statistics1);

	C2= n_gram_Frequency_Computation_function (One_less_String,Statistics2);

	Cond_Probability= (C1 + lambda)/(C2 + lambda*Statistics2.V^(n-1));	#The probability computation for the Lid method.

else

	C1= n_gram_Frequency_Computation_function (String,Statistics1);

	C2= Statistics1.N;

	Cond_Probability= (C1 + lambda)/(C2 + lambda*Statistics1.V);		#The probability computation for the Lid method.

endif



endfunction
