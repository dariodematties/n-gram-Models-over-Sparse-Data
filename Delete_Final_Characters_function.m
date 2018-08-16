#This function deletes the character in the final of the string on every cell element on the input cell array.
 

#Inputs:
#	Word_Cell:			The checked cell array of all the words in the corpus with tags for sentences separation and without empty centences.

#Outputs:
#	Output_words_cell:		A cell array whose words don't have final character.

function Output_words_cell = Delete_Final_Characters_function(Word_Cell)



for i=1:length(Word_Cell)

	Aux= Word_Cell{i};		#Deletes a last character on every string element on the cell.
	Word_Cell{i} = Aux(1,1:end-1);

endfor


Output_words_cell= Word_Cell;		#Returns the cell array without the final character of every string element in the cell.



endfunction
