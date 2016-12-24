/**************************
	Macro Version 
***************************/
%macro TBRollup(TDS, IDVar, TimeVar, TypeVar, NChars, Value, RDS);
proc sort data=&TDS;
 by &IDVar &TimeVar &TypeVar;
run;

data Temp1;
 retain _TOT 0;
 set &TDS;
 by &IDVar &TimeVar &TypeVar;
 if first.&TypeVar then _TOT=0;
 _TOT = _TOT + &VAlue;
 if last.&TypeVar then output;
 drop &Value;
run;
proc sort data=Temp1;
 by &IDVar &TypeVar;
run;

proc freq data=Temp1 noprint;
 tables &TypeVar /out=Types;
run;

data _null_;
 set Types nobs=Ncount;
 if &TypeVar ne '' then
   call symput('Cat_'||left(_n_),&TypeVar);
 if _N_=Ncount then call symput('N',NCount);
run;

%do i=1 %to &N;
proc transpose 
 data=Temp1
 out=_R_&i
 prefix=%substr(&&Cat_&i,1,&NChars)_;
 by &IDVar &TypeVar;
 ID &TimeVar;
 var _TOT;
 where &TypeVar="&&Cat_&i";
run;
%end;

data &RDS;
 merge %do i=1 %to &N; _R_&i %end ; ;
 by &IDVar;
 drop &TypeVar _Name_;
run;

proc datasets library=work nodetails;
 delete Temp1 Types %do i=1 %to &N; _R_&i %end; ;
run;
quit;
%mend;