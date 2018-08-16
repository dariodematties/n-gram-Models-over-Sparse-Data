#This function makes an histogram for the n-grams that are in a cell array from the input data. This function can make a histogram for any kind of cell array. In fact this function can be used to get the frequencies of frequencies Nr too.
 

#Inputs:
#	Word_Cell:			The cell array of all the n-grams in the corpus.

#Outputs:
#	Histogram:			A cell array with the corpus' vocabulary and the number of occurrences of every n-gram in the corpus.

function Histogram = Histogram_function(Word_Cell)



[Unique, j, j]= unique(Word_Cell);	#Save the non repeated n-grams in a cell array called Unique, alphabetically sorted . The variable j is a vector with the same number of components than Word_Cell. In every component of this vector there is a number that is equal to the position in Unique that correspons with the occurence of the string finded in the same position on Word_Cell as the position in j. That is: if [y, i, j]= unique(x), then y(j)==x.


Histogram= cell(2,length(Unique));


Aux= histc(j,1:length(Unique));		#Computes the number of repetitions of every n-gram.

Histogram(1,:)= Unique(:);		#Puts the vocabulary in the histogram cell array.
Histogram(2,:)= num2cell(Aux);		#Puts the number of repetitions of every n-gram in the histogram cell array.



endfunction
