#This function makes a simple linear regression from the samples in Array.


#Inputs:
#	Array:			The sample array from which to make the linear regression.

#Outputs:
#	a:			The intercept.
#	b:			The slope.


function [a b] = Simple_Linear_Regression_function(Array)


	n= length(Array);

	Aux(1)= sum(Array(1,:));
	Aux(2)= sum(Array(2,:));
	Aux(3)= sum(Array(2,:).*Array(1,:));
	Aux(4)= sum(Array(1,:).^2);

	b= (n*Aux(3)-Aux(1)*Aux(2))/(n*Aux(4)-Aux(1)^2);

	a= (Aux(2)-b*Aux(1))/n;


endfunction
