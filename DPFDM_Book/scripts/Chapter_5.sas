/*************************************************
	Chapter 5 - Data Acquisition and Integration
*************************************************/
	%let macros=/folders/myshortcuts/SAS_Entrenamiento/DPFDM_Book/macros/;

	* 5.4 Data Rollup;
	data Transaction;
		informat CustID $10.;
		informat TransDate date9.;
		format TransDate Date9.;
		input CustID $ TransDate Amount AccountType $;
		Cards;
			55555 11Jun2003 114.56 Savings
			55555 12Jun2003 119.56 Savings
			55555 21Jun2003 -56.78 Checking
			55555 07Jul2003 359.31 Savings
			55555 19Jul2003 89.56 Checking
			55555 03Aug2003 1000.00 Savings
			66666 22Feb2003 549.56 Checking
			77777 03Dec2003 645.21 Savings
			55555 17Aug2013 -1200.00 Checking
			88888 14Jun2013 122.51 Savings
			88888 27Jun2013 42.07 Checking
			88888 09Jul2013 -146.30 Savings
			88888 09Jul2013 -1254.48 Checking
			88888 10Aug2013 400.00 Savings
			88888 11Aug2013 500.00 Checking
			88888 13Aug2013 300.00 Checking
		;
	run;
	
	data Trans;
		set Transaction;
		Month = month(TransDate);
		drop transdate;
	run;
	
	proc sort data=Trans;
		by CustID month AccountType;
	run;
	
	data Trans2;
		retain Balance 0;
		set Trans;
		by CustID month AccountType;
		if first.AccountType then Balance=0;
		Balance = Balance + Amount;
		if last.AccountType then output;
		drop Amount;
	run;
	* Prepare for the transpose;
	proc sort data=trans2;
		by CustID accountType;
	run;
	
	proc transpose data=trans2 out=rolled_C prefix=C_;
		by CustID accountType;
		ID month;
		var balance;
		where accountType='Checking';
	run;
	proc transpose data=trans2 out=rolled_S prefix=S_;
		by CustID accountType;
		ID month;
		var balance;
		where accountType='Savings';
	run;
	data Rollup;
		merge Rolled_S Rolled_C;
		by CustID;
		drop accountType _Name_;
	run;
		
	* Calling the Macro TBRollup;
	%include "&macros.TBRollup.sas";
	%let IDVar = CustID;
	%let TimeVar = Month;
	%let TypeVar = AccountType;
	%let Value = Amount;
	%let NChars = 1;
	%let TDS = Trans;
	%let RDS = Rollup;
	
	%TBRollup(&TDS, &IDVar, &TimeVar, &TypeVar, &NChars, &Value, &RDS);
	proc print data=&RDS;
	run;
	* Revisando variable;
	data _null_;
		set Types nobs=Ncount;
		call symput('Cat_'||left(_n_),AccountType);
		if _N_=Ncount then do;
			call symput('N',Ncount);
			%put &N;
			%put _ALL_;
		end;
	run;
	
	* 5.5 Rollup with Sums, Averages and Counts;
	%include "&macros.ABRollup.sas";
	%let IDVar = CustID;
	%let TimeVar = Month;
	%let TypeVar = AccountType;
	%let Value = Amount;
	%let NChars = 1;
	%let TDS = Trans;
	%let RDS = Rollup;
	
	%ABRollup(&TDS, &IDVar, &TimeVar, &TypeVar, &NChars, &Value, &RDS);
	proc print data=&RDS;
	run;
	
	* 5.6 Calculation of the Mode;
	%include "&macros.VarMode.sas";
	%let TransDS = Trans;
	%let XVar = Month;
	%let IDVar = CustID;
	%let OutDS = ModeDS;
	%VarMode(&TransDS, &XVar, &IDVar, &OutDS);
	proc print data=ModeDS;
	run;
	
	* 5.7.1 Merging;
	data left;
		input ID Age Status $;
		datalines;
		1 30 Gold
		2 20 .
		4 40 Gold
		5 50 Silver
		;
	run;
	data right;
		input ID Balance Status $;
		datalines;
		2 3000 Gold
		4 4000 Silver
		;
	run;
	data Both;
		merge Left Right;
		by ID;
	run;
	proc print data=Both;
	run;
	
	%include "&macros.MergeDS.sas";
	%let List=Left Right;
	%let IDVar=ID;
	%let ALL=Both;
	%MergeDS(&List, &IDVar, &ALL);
	
	* 5.7.2 Concatenation;
	data top;
		input ID Age Status $;
		datalines;
		1 30 Gold
		2 20 .
		3 30 Silver
		4 40 Gold
		5 50 Silver
		;
	run;
	data bottom;
		input ID Balance Status $;
		datalines;
		6 6000 Gold
		7 7000 Silver
		;
	run;
	data both;
		set top bottom;
	run;
	
	%include "&macros.ConcatDS.sas";
	%let List=Top Bottom;
	%let ALL=Both;
	%ConcatDS(&List, &ALL);