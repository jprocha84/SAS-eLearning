%macro ContnAna(DSin, VarX, VarY, ResDS);
	/* Calculation of measures of association between
	   two categorical variables (VarX, VarY)
	   in a dataset (DSin) using PROC FREQ and
	   arranging the results in a dataset (ResDS) */

	proc freq data=&DSin noprint;
		tables &VarX * &VarY/chisq;
		output All out=temp_chi chisq;
	run;
	
	proc sql noprint;
		create table &ResDS(SAS_Name char(10), Description char(50), Value num);
		select _PHI_, P_MHCHI, P_LRCHI, P_PCHI, N, _MHCHI_,
			   _LRCHI_, DF_MHCHI, DF_LRCHI, DF_PCHI, _CRAMV_,
			   _CONTGY_, _PCHI_
			into :PHI, :P_MHCHI, :P_LRCHI, :P_PCHI, :N, :MHCHI,
				 :LRCHI, :DF_MHCHI, :DF_LRCHI, :DF_PCHI, :CRAMV,
				 :CONTGY, :PCHI
			from temp_chi;
		insert into &ResDS
			values("N","Number of Subjects in the Stratum",&N)
			values("_PCHI_","Chi-Square",&PCHI)
			values("DF_PCHI","DF for Chi-Square",&DF_PCHI)
			values("P_PCHI","P-value for Chi-Square",&P_PCHI)
			values("_MHCHI_","Mantel-Haenszel Chi-Square",&MHCHI)
			values("DF_MHCHI","DF for Mantel-Haenszel Chi-Square",&DF_MHCHI)
			values("P_MHCHI","P-value for Mantel-Haenszel Chi-Square",&P_MHCHI)
			values("_LRCHI_","Likelihood Ratio Chi-Square",&LRCHI)
			values("DF_LRCHI","DF for Likelihood Ratio Chi-Square",&DF_LRCHI)
			values("P_LRCHI","P-value for Likelihood Ratio Chi-Square",&P_LRCHI)
			values("_PHI_","Phi Coefficient",&PHI)
			values("_CONTGY_","Contingency Coefficient",&CONTGY)
			values("_CRAMV_","Cramer's V",&CRAMV);
	quit;
	proc datasets library=work nolist;
		delete temp_chi;
	quit;
%mend;