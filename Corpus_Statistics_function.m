#This function receives a raw corpus, the parameter n to form the n-grams from the corpus and the range of values of r for which must be analyzed the frequencies of frequencies Nr, as the inputs and returns the size of the corpus N, the size of the vocabulary V, a histogram for the n-grams frequencies C(w1 … wn) and an array with the frequencies of frequencies Nr from 1 until the input r.


#Inputs:
#	Corpus:			The corpus to be analyzed.
#	n			The number of words for each n-gram to be built.

#Outputs:
#	Statistics:		A structure whose elements have the statistical data from the corpus.
#	Statistics.N:		The number of elements in the corpus.
#	Statistics.V:		The size of the vocabulary.
#	Statistics.Histogram:	A cell array with the histogram of frequencies C(w1 … wn) for the distinct n-grams (w1 … wn) in the corpus.
#	Statistics.Nr:		An array with the frequencies of frequencies of the n-grams in the corpus.

function Statistics = Corpus_Statistics_function(Corpus,n)



#The variable A is a cell array with one word per element and special markers elements to indicate the beginning and the end of the sentences.
A= Erase_Empty_Sentences_function(String_Preprocessor_function(Sentence_Marker_function (Corpus)));

#The variable B is a cell array with one n-gram per element without markers of any type.
B= Clean_Cell_Array_function(N_gram_Formation_function(A,n));

#Extracts the number of n-grams in the corpus.
Statistics.N= length(B);

#Histogram is a cell array that contains a histogram of the distinct n-grams (w1 … wn) and its frequencies C(w1 … wn) in the corpus. The distinct n-grams are put in Histogram(1,:) while their frequencies are put in Histogram(2,:).
Statistics.Histogram= Histogram_function (B);

#The size of the vocabulary.
Statistics.V= length(Statistics.Histogram(1,:));

#Nr is a cell array with the n-grams' frequencies C(w1 … wn) in the Nr(1,:) elements and the number of times each of those frequencies  occurred in the corpus (Nr) in the Nr(2,:) elements.
for i=1:Statistics.V
	Aux(1,i)= Statistics.Histogram{2,i};
endfor
Statistics.Nr(1,:)= unique(Aux);
Statistics.Nr(2,:)= histc(Aux,Statistics.Nr(1,:));

#If n is greater than one then the size of the vocabulary has to be corrected to the real number of different words in the vocabulary. The number of distinct n-grams is not the real size of the vocabulary.
if (n > 1)
	C= Clean_Cell_Array_function(N_gram_Formation_function(A,1));
	Aux_Hist= Histogram_function (C);
	Statistics.V= length(Aux_Hist(1,:));
endif



endfunction
