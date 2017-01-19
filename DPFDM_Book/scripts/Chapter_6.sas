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
	
	* 6.4.2 Testing the Similarity of Ratios;
	data SampleA;
		input x $ y @@;
		datalines;
A 3 A 2 A 2 B 3 B 2 B 1
B 2 B 3 B 3 C 1 C 1 C 2
C 2 C 2 C 1 A 3 A 2 A 1
A 3 A 2 A 2 B 1 B 2 B 1
B 1 B 3 B 2 C 3 C 1 C 1
C 2 C 1 C 3 A 2 A 2 A 1
A 2 A 2 A 3 B 3 B 2 B 1
B 2 B 3 B 2 C 3 C 1 C 2
C 3 C 2 C 3 A 3 A 3 A 2
A 1 A 1 A 3 B 1 B 3 B 1
		;
	run;
	data SampleB;
		input x $ y @@;
		datalines;
C 2 C 3 C 1 C 1 C 3 C 1
B 2 B 2 B 2 B 1 B 2 B 2
B 3 B 1 B 3 B 3 B 2 B 1
A 2 A 1 A 3 A 2 A 2 A 1
B 2 B 1 B 3 B 2 B 1 B 1
C 3 C 2 C 3 C 3 C 1 C 2
C 1 C 3 C 2 C 3 C 1 C 3
B 1 B 1 B 2 B 2 B 1 B 1
C 1 C 2 C 1 C 2 C 2 C 1
A 2 A 2 A 2 A 1 A 2 A 3
		;
	run;
	proc freq data=samplea;
		tables x;
	run;
	proc freq data=sampleb;
		tables x;
	run;
	
	proc freq data=samplea;
		tables x * y/chisq;
		output all out=temp_chi chisq;
	run;
	proc contents data=work.temp_chi;
	run;
	
	* Calling ChiSample;
	%include "&macros.ContnAna.sas";
	%include "&macros.ChiSample.sas"; 
	%let DS1=SampleA;
	%let DS2=SAmpleB;
	%let VarC=x;
	%let p=0.9;
	%let Result=;
	%ChiSample(&DS1, &DS2, &VarC, &p, Result);
	%put Result of Comparison= &Result;
	
	
	*** 6.5 Continuous Variables ****;
	