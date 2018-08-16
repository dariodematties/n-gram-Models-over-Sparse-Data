#This function elaborates a cell array with n-grams from the input cell array Word_Cell.
 

#Inputs:
#	Word_Cell:			The checked cell array of all the words in the corpus with sentences marked for separation and without empty sentences.
#	n				The number of words that will be in each n-gram. The input "n" must be greater than one.

#Outputs:
#	Output_words_cell:		A cell array with the n-grams.

function Output_words_cell = N_gram_Formation_function(Word_Cell,n)



if n == 1									#If n is equal to one, this program must do nothing.

	Output_words_cell= Word_Cell;						#Returns the input cell array as it is in its original version.

else

	Fill= cell(1,n-1);							#This cell array serves to fill the n-grams that occur at the beginning of the sentences.
	for i=1:n-1

		Fill{i}= 'fill_ ';

	endfor

	Word_Cell= Insert_Final_Spaces_function(Word_Cell);			#It is necessary to insert final spaces in every element on the input cell array.

	i= 1;
	while i <= length(Word_Cell)

		if strcmp(Word_Cell{i},'s1x ') || strcmp(Word_Cell{i},'s1x1 ')	#This function does not make n-grams with the sentence marker string elements; instead it copies every mark as it is in the n-gram cell array.
			Aux_Word_Cell{i}= Word_Cell{i};
			i= i + 1;
		else
			j=1;
			while j <= n-1 && !strcmp(Word_Cell{i+j-1},'s1x1 ')	#These statements use the "_fill_ " string elements from the Fill cell array to fill the n-grams that occur at the beginning of the sentences.
				Aux= [Fill{1:n-j} Word_Cell{i:i+j-1}];
				Aux_Word_Cell{i+j-1}= Aux;
				j= j + 1;
			endwhile

			while !strcmp(Word_Cell{i+j-1},'s1x1 ')			#These statements make the n-grams that are not at the beginning of the sentences.
				Aux= [Word_Cell{i+j-n:i+j-1}];
				Aux_Word_Cell{i+j-1}= Aux;
				j= j + 1;
			endwhile

			if strcmp(Word_Cell{i+j-1},'s1x1 ')			#This function does not make n-grams with the sentences marker strings elements; instead it copies every mark as it is in the n-gram cell array.
				Aux_Word_Cell{i+j-1} = 's1x1 ';
			endif
			i=i+j;
	
		endif

	endwhile

Output_words_cell= Delete_Final_Characters_function(Aux_Word_Cell);		#Deletes the last spaces in every string element and returns the cell array with the n-grams.

endif



endfunction
