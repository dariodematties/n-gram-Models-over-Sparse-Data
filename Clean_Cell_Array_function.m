#This function cleans the input cell array of the strings 's1x' and 's1x1'.
 

#Inputs:
#	Word_Cell:			The cell array of all the n-grams in the corpus with tags for sentences separation and without empty centences.

#Outputs:
#	Output_words_cell:		A cell array with all the n-grams but without the strings 's1x' and 's1x1'.

function Output_words_cell = Clean_Cell_Array_function(Word_Cell)



Word_Cell= {Word_Cell{2:end}};

i=1;
while i < length(Word_Cell)

	if strcmp(Word_Cell{i},'s1x1') && strcmp(Word_Cell{i+1},'s1x')
		Word_Cell= {Word_Cell{1:i-1} Word_Cell{i+2:end}};
	endif
	i= i + 1;

endwhile

if strcmp(Word_Cell{end},'s1x1')
	Word_Cell= {Word_Cell{1:end-1}};
endif


Output_words_cell= Word_Cell;		#Returns the cell array with spaces at the final of every string element in the cell.



endfunction
