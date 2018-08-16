#This function marks the beginning and the end of each sentence in the string string.
 

#Inputs:
#	string:		The string to be marked.

#Outputs:
#	marked_string:	The marked string. A string with the sentences marked between the tags <s1x> and <s1x1>.

function marked_string = Sentence_Marker_function(string)


[one, N_char]=size(string);							#Extracts the number of characters from string.

string= ['<s1x> ' string(1,1:end)];						#Inserts the first mark in the text.



#######################################This is the marker for the non-contiguous sentences.



endposition= findstr(string, "\n\n", 0);					#Finds the finals of the non-contiguous sentences and put their position in a vector.

[one, N_pos]=size(endposition);							#Extracts the number of occurrences of the string '\n\n'.


for i=1:N_pos-1

	index= endposition(1,i) + 13*(i-1);					#This index points to the current position where every sentence must be marked. This is because the string is modified in every marking iteration, so the position must be modified too.

	string(1,index + 1) = " ";						#Replaces the last "\n" character by the blank space character.

	string= [string(1,1:index) "<s1x1> <s1x> " string(1,index+1:end)];	#Inserts the mark <s1x1> at the final of a sentence and the mark <s1x> at the beginning of the next.

endfor

index= endposition(1,N_pos) + 13*(N_pos-1);					#This index points to the current position where the last sentence must be marked. This is because the string is modified in every marking iteration, so the position must be modified too.

string(1,index + 1) = " ";							#Replaces the "\n" character by the blank space character.

string= [string(1,1:index) '<s1x1>'];						#Inserts the mark <s1x1> at the final of the last sentence.



#######################################This is the marker for the contiguous sentences.



clear endposition;

endposition= findstr(string, ". ", 0);						#Finds the finals of the contiguous sentences after a dot character "." and put their position in a vector.

endposition= [endposition findstr(string, "? ", 0)];				#Finds the finals of the contiguous sentences after a question mark character "?" and put their position in a vector.

endposition= [endposition findstr(string, "! ", 0)];				#Finds the finals of the contiguous sentences after a exclamation mark character "!" and put their position in a vector.

endposition= sort(endposition);							#Sorts the positions of the continuous sentences' finals in the vector.

[one, N_pos]=size(endposition);							#Extracts the number of positions where any final occurs.


for i=1:N_pos

	index= endposition(1,i) + 13*(i-1);					#This index points to the current position where every sentence must be marked. This is because the string is modified in every marking iteration, so the position must be modified too.


	string= [string(1,1:index) '<s1x1> <s1x> ' string(1,index+1:end)];	#Inserts the mark <s1x1> at the final of a continuous sentence and the mark <s1x> at the beginning of the next.

endfor


marked_string= string;								#Returns the marked string.


endfunction





