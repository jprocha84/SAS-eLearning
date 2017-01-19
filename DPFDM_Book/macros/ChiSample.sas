%macro ChiSample(DS1, DS2, VarC, p, M_Result);
	data Temp_1;
		set &DS1;
		keep &VarC DSId;
		DSId=1;
	run;
	data Temp_2;
		set &DS2;
		keep &VarC DSId;
		DSId=2;
	run;
	data Temp_Both;
		set Temp_1 Temp_2;
	run;
	
	%ContnAna(Temp_Both, DSId, &VarC, Temp_Res);
	
	data _null_;
		set temp_res;
		if SAS_Name="P_PCHI" then
			call symput("P_actual", Value);
	run;
	%if %sysevalf(&P_Actual>=&P) %then %let &M_Result=Yes;
	%else %let &M_Result=No;
	
	/* clean workspace */
	proc datasets library=work nolist;
		delete Temp_1 Temp_2 Temp_both Temp_Res;
	quit;
%mend;