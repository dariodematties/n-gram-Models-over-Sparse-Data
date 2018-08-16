#This function inserts a blank space character in the final of the string on every cell element.
 

#Inputs:
#	Word_Cell:			The checked cell array of all the words in the corpus with tags for sentences separation and without empty centences.

#Outputs:
#	Output_words_cell:		A cell array whose words have final spaces.

function Output_words_cell = Insert_Final_Spaces_function(Word_Cell)



for i=1:length(Word_Cell)

	Aux= [Word_Cell{i} ' '];	#Insets a blank space character on every string element on the cell.
	Word_Cell{i} = Aux;

endfor


Output_words_cell= Word_Cell;		#Returns the cell array with spaces at the final of every string element in the cell.



endfunction
