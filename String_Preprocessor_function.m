#This function receives a string replaces all the punctuations marks by blank characters, extracts only the words from the string and stores them in a Cell Array.

#Cell Arrays: It can be both necessary and convenient to store several variables of different size or type in one variable. A cell array is a container class able to do just that. In general cell arrays work just like N -dimensional arrays with the exception of the use of ‘{’ and ‘}’ as allocation and indexing operators.
 

#Inputs:
#	string:		The string to preprocess.

#Outputs:
#	preprocessing:	The preprocessed string. A cell array with a word from the original text string in each component of it.

function preprocessing = String_Preprocessor_function(string)


[one, N_char]=size(string);			#Extracts the number of characters from string.

a=ispunct(string);				#"a" is a vector with a number one in each position that match a punctuation position on the string and zeros in any other positions.


for i=1:N_char

	if a(i) == 1
		string(i)=" ";			#Replaces every punctuation with a blank space.
	endif

endfor

preprocessing=strread(string,"%s");		#Returns the cell array with a word from the original text in every component of it.

endfunction
