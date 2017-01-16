%macro ABRollup(TDS, IDVar, TimeVar, 
				TypeVar, Nchars, Value, RDS);
	/* 	This macro performs a rollup of transactions to produce the
		Average Balance (AB) rollup file on the level of the IDVar
		in the time variable TimeVar by accumulating the Value
		variable over the different categories of the TypeVar.
		
		The new names will include the values of the time
		variable TimeVar prefixed by the first NChars of
		the categories of TypeVar.
		
		The input file is the transaction dataset TDS, and the 
		output file is the rollup file RDS.
	*/
	proc sort data=&TDS;
		by &IDVar &TimeVar &TypeVar;
	run;
	
	* 5.5 Step 2;
	data _Temp1;
		retain _TOT 0;
		retain _NT 0;
		set &TDS;
		by &IDVar &TimeVar &TypeVar;
		if first.&TypeVar then _TOT=0;
		_TOT = _TOT + &Value;
		if &Value ne . then _NT=_NT+1;
		if last.&TypeVar then
		do;
			_AVG=_TOT/_NT;
			output;
			_NT=0;
		end;
		drop &Value;
	run;
	
	proc sort data=_Temp1;
		by &IDVar &TypeVar;
	run;
	
	proc freq data=_Temp1 noprint;
		tables &TypeVar /out=_Types;
	run;
	
	data _null_;
		set _Types nobs=Ncount;
		if &TypeVar ne '' then call symput('Cat_'||left(_N_),&TypeVar);
		if _N_=NCount then call symput('N',NCount);
	run;
	
	%do i=1 %to &N;
		proc transpose data=_Temp1 out=_R_&i
					   prefix=%substr(&&Cat_&i,1,&Nchars)_;
			by &IDVar &TypeVar;
			ID &TimeVar;
			var _AVG;
			where &TypeVar="&&Cat_&i";
		run;
	%end;
	
	data &RDS;
		merge %do i=1 %to &N;
			  	_R_&i
			  %end; ;
		by &IDVar;
		drop &TypeVar _Name_;
	run;
	
	proc datasets library=work nodetails;
		delete _Temp1 _Types %do i=1 %to &N; _R_&i %end; ;
	run;
	quit;
	
%mend;