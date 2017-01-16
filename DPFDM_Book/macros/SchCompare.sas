%macro SchCompare(A, B, Result, I_St);
	/* This macro compares the schemas of two datasets A and B.
	   It tests the hypothesis that ALL variables in B
	   are preset in A with the same data type. The result of the
	   comparison is stored in the dataset Result, which contains
	   one row per variable of the dataset B.
	   
	   The I_ST contains the status of the comparison, such that
	   	1 = all variables in B are in A,
	   	0 = come variables in B are not in A.
	   
	   In the result dataset, we call B the "Sample", and A the "Base".	*/
	proc sql noprint;
		create table TA as 
			select name, type from dictionary.columns
			where memname = "%upcase(&A)"
			order by name;
			
		create table TB as
			select name, type from dictionary.columns
			where memname = "%upcase(&B)"
			order by name;
		select count(*) into:N from TB;
	run;
	quit;
	
	data _Null_;
		set TB;
		call symput('V_'||left(_n_),name);
		call symput('T_'||left(_n_),Type);
	run;
	
	proc sql noprint;
		create table &Result (VarName char(32),
							  VarType char(8),
							  ExistInBase num,
							  Comment char(80));
			%do i=1 %to &N;
				select count(*) into: Ni from TA where name="&&V_&i";
				%if &Ni eq 0 %then %do;
					%let Value=0;
					%let Comment=Variable does not exist in Base Dataset.;
					%goto NextVar;
				%end;
				select count(*) into: Ti from TA
					where name="&&V_&i" and type="&&T_&i";
				%if &Ti gt 0 %then %do;
					%let Value=1;
					%let Comment=Variable exist in Base Dataset with same data type.;
				%end;
				%else %do;
					%let Value=0;
					%let Comment=Variable exists in Base Dataset but with different data type.;
				%end;
				%NextVar:;
					insert into &Result values("&&V_&i",	  
											  "&&T_&i",
											  &Value,
											  "&Comment");
			%end;
		select min(ExistInBase) into: I from &Result;
	run;
	quit;
	%let &I_St=&I;
%mend;