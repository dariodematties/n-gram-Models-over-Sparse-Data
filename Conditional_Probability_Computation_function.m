#This function computes the conditional probability of the last word in a n-gram with respect to the rest of the words in that n-gram. This receives the n-gram in String, two structs called Statistics1 and Statistics2 that contain all the statistics learned from a training corpus for the n-grams and for the (n-1)-grams respectivelly, Method that has a string with the probability computation method: 'MLE', 'Lap' and 'Lid' and the lambda parameter for the Lid method, as the inputs and returns the conditional probability of the last word of n-gram as the output.
 

#Inputs:
#	String:			The n-gram string whose probability want to be computed.
#	Statistics1		A structure with statistical data for n-grams from the corpus.
#	Statistics1.Histogram:	The histogram from the corpus.
#	Statistics1.N:		The size of the corpus.
#	Statistics1.V:		The vocabulary size.
#	Statistics2		A structure with statistical data for (n-1)-grams from the corpus.
#	Statistics2.Histogram:	The histogram from the corpus.
#	Statistics2.N:		The size of the corpus.
#	Statistics2.V:		The vocabulary size.
#	Method:			The method to be applied to compute the probability.
#	lambda:			For the Lid computation.

#Outputs:
#	Cond_Probability:	The conditional probability of the last word in the n-gram.

function Cond_Probability = Conditional_Probability_Computation_function(String,Statistics1,Statistics2,Method,lambda)



switch (Method)

case 'MLE'

	Cond_Probability= MLE_Probability_Computation_function (String,Statistics1,Statistics2);		#The probability for the MLE method.

case 'Lap'

	Cond_Probability= Lap_Probability_Computation_function ('was a',Statistics1,Statistics2);		#The probability for the Lap method.

case 'Lid'

	Cond_Probability= Lid_Probability_Computation_function ('was the',Statistics1,Statistics2,lambda);	#The probability for the Lid method.

case 'ho'

	Cond_Probability= ho_Probability_Computation_function(String,Statistics1,Statistics2);			#The probability for the ho

case 'del'

	Cond_Probability= del_Probability_Computation_function(String,Statistics1,Statistics2);			#The probability for the del

endswitch



endfunction
