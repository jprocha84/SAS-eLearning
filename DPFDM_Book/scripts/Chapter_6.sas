/*************************************************
	Chapter 6 - Integrity Checks
*************************************************/
	%let macros=/folders/myshortcuts/SAS_Entrenamiento/DPFDM_Book/macros/;
		
	*** 6.3 Dataset Schema Checks ****;
	proc sql;
		create table TA as 
			select name, type from dictionary.columns
			where memname = "TRANS"
			order by name;
	run;
	quit;
	data _null_;
		set TA;
		call symput('V_'||left(_n_),name);
		call symput('T_'||left(_n_),type);
	run;
	%put _ALL_;
	
	* Calling the Macro;
	%include "&macros.SchCompare.sas";
	%let A=Trans;
	%let B=Transaction;
	%let Result=OutputDS;
	%let I_St=VarResult;
	%SchCompare(&A, &B, &Result, &I_St);
	
	proc print data=&Result;
		%put _All_;
	run;
	
	* 6.3.2 Variable Types;
	data SS;
		x='1';output;
		x='a';output;
	run;
	data NN;
		set SS;
		y=input(x,best10.);
		drop x;
	run;
	
	*** 6.4 Nominal Variables ****;
	
	* 6.4.1 Testing the presence of all categories.;
	%include "&macros.CatCompare.sas";
	%let Base=Transaction;
	%let Sample=Trans;
	%let Var=AccountType;
	%let V_Result=OutDS;
	%global FlagResult;
	%CatCompare(&Base, &Sample, &Var, &V_Result, FlagResult);
	
	proc print data=&V_Result;
		%put &FlagResult;
	run;