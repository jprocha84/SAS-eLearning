%macro CatCompare(Base, Sample, Var, V_Result, I_St);
	/*
		Base: Base Dataset
		Sample: Sample Dataset
		Var: The variable for which the categories in the Base
			 dataset are compared to the categories in the 
			 Sample dataset
		V_Result: A dataset containing the comparison summary
		I_St: A status indicator set as follows:
			  0: all categories of Var in Base exist in Sample
			  1: Not all categories of Var in Base exist in Sample
	*/
	proc sql noprint;
		create table CatB as select distinct &Var from &Base;
		select count(*) into:NB from CatB;
		create table CatS as select distinct &Var from &Sample;
		select count(*) into:NS from CatS;
		create table &V_Result (Category char(32),
								ExistsInSample num,
								Comment char(80));
	run;
	quit;
	
	data _Null_;
		set CatB;
		call symput('C_'||left(_n_),&Var);
	run;
	
	proc sql noprint;
		%do i=1 %to &NB;
			select count(*) into:Nx
			from CatS where &Var="%trim(&&C_&i)";
			%if &Nx=0 %then %do;
				insert into &V_Result
				values("%trim(&&C_&i)",0,'Category does not exist in sample.');
			%end;
			%if &Nx>0 %then %do;
				insert into &V_Result
				values("%trim(&&C_&i)",1,'Category exists in sample.');
			%end;
		%end;
		select min(ExistsInSample) into:Status from &V_Result;
	quit;
	%let &I_St=&Status;

	proc datasets nodetails library=work;
		delete CatB CatC;
	quit;
	
%mend;