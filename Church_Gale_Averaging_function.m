#This function averages the frequencies of frequencies to make the function follows the trend of a log-log straight line. This also makes a linear regression of the log-log frequency vs. frequencies of frequencies and returns the antilog of the best fit lineaization.


#Inputs:
#	Statistics			A structure with statistical data for n-grams from the corpus.
#	Statistics.N:			The size of the corpus.
#	Statistics.V:			The vocabulary size.
#	Statistics.Histogram:		The histogram from the corpus.
#	Statistics.Nr:			An array with the frequencies of frequencies of the n-grams in the corpus.

#Outputs:
#	GT_Statistics			A structure with statistical data for n-grams from the corpus, adapted for the Simple Good-Turing probability computation.
#	GT_Statistics.N:		The size of the corpus.
#	GT_Statistics.V:		The vocabulary size.
#	GT_Statistics.Histogram:	The histogram from the corpus.
#	GT_Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.


function GT_Statistics = Church_Gale_Averaging_function(Statistics)


Statistics.Nr(3,1)= 2*Statistics.Nr(2,1) / Statistics.Nr(1,2);

Statistics.Nr(3,length(Statistics.Nr))= 2*Statistics.Nr(2,length(Statistics.Nr)) / ( 2*(Statistics.Nr(1,length(Statistics.Nr)) - Statistics.Nr(1,length(Statistics.Nr)-1)) );

for i=2:length(Statistics.Nr)-1					#Nr(3,:) contains the frequencies of frequencies averages.

	Statistics.Nr(3,i)= 2*Statistics.Nr(2,i) / (Statistics.Nr(1,i+1) - Statistics.Nr(1,i-1));

endfor

Statistics.Nr(4,:)= log10(Statistics.Nr(1,:));			#Nr(4,:) contains the frequency logarithms "log10(r)".
Statistics.Nr(5,:)= log10(Statistics.Nr(3,:));			#Nr(5,:) contains the averages logarithms "log10(Z)".

[a b] = Simple_Linear_Regression_function(Statistics.Nr(4:5,:));

Statistics.Nr(6,:)=  a .+ b .* Statistics.Nr(4,:);		#Nr(6,:) contains the smoothing of log10(Z), that is: a+b*log10(r). 

Statistics.Nr(7,:)= 10.^Statistics.Nr(6,:);			#Nr(7,:) contains the antilog of the smoothing.

GT_Statistics= Statistics;


endfunction
