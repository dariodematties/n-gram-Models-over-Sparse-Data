#This function erases every empty sentence in the input cell array Word_Cell. If this finds a cell element with the string <s1x1> following a cell element with the string <s1x>, that means those two markers mark an empty sentence and must be eliminated from the input cell array Word_Cell.
 

#Inputs:
#	Word_Cell:			The cell array of all the words in the corpus with markers for sentence's separation.

#Outputs:
#	Output_words_cell:		A cell array without empty sentences marked on the original text.

function Output_words_cell = Erase_Empty_Sentences_function(Word_Cell)



while strcmp(Word_Cell{2},'s1x1') && strcmp(Word_Cell{1},'s1x')		#While the first and the second cell array's elements contain the strings "s1x1" and "s1x1" without quotation marks respectively, then there is an empty sentence in the beginning of the cell array and this must be treated in a special way.

	Word_Cell= {Word_Cell{3:end}};

endwhile

i=1;
while i <= length(Word_Cell)						#These statements erase all the empty sentences that are not at the beginning of the cell array. The length of the cell array is changing at every moment the statements find an empty sentence.

	if strcmp(Word_Cell{i}, 's1x') && strcmp(Word_Cell{i+1}, 's1x1')

		Word_Cell= {Word_Cell{1:i-1} Word_Cell{i+2:end}};

	endif
	i= i + 1;

endwhile


Output_words_cell= Word_Cell;						#Returns the new cell array without empty sentences.


endfunction
