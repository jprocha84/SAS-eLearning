/********************************************
	Chapter 4 - 4.5 Working with Strings
*********************************************/
%macro Decompose(List);
	%let i=1;
	%let condition = 0;
	
	%do %until (&condition = 1);
		%let Word=%scan(&List,&i);
		%if &Word = %then 
			%let condition =1;
		%else %do;
			%put &Word;
			%let i = %Eval(&i+1);
		%end;
	%end;
%mend;