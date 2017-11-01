/********************************************
		Examining Residuals
*********************************************/
	ods graphics / imagemap=on;
	proc reg data=statdata.fitness;
		PREDICT: model 	Oxygen_Consumption = 
										RunTime Age Run_Pulse Maximum_Pulse;
		id Name;
		title 'PREDICT model - Plot of Diagnostic Statistics';
	run;
	quit;
	
	title;
	
	ods graphics / imagemap=on width=800;
	proc reg data=statdata.fitness
						plots(only)=(QQ RESIDUALBYPREDICTED RESIDUALS);
		PREDICT: model 	Oxygen_Consumption = 
										RunTime Age Run_Pulse Maximum_Pulse;
		id Name;
		title 'PREDICT model - Plot of Diagnostic Statistics';
	run;
	quit;
	
	title;
	
	* Practice;
	ods graphics / imagemap=on width=800;
	proc reg data=statdata.bodyfat2
						plots(only)=(QQ RESIDUALBYPREDICTED RESIDUALS);
		PREDICT: model 	PctBodyFat2 = 
										Abdomen Weight Wrist Forearm;
		id Case;
		title 'PREDICT model - Plot of Diagnostic Statistics';
	run;
	quit;
	
	title;
	
	
/********************************************
		Identifying Influential Observations
*********************************************/
	%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
              Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom ;
	
	ods select none;
	proc glmselect data=statdata.ameshousing3 plots=all;
	   STEPWISE: model SalePrice = &interval / selection=stepwise 
	                                details=steps select=SL slentry=0.05 slstay=0.05;
	   title "Stepwise Model Selection for SalePrice - SL 0.05";
	run;
	quit;

	* Looking for influential Observations;
	* Part 1;
	ods select all;
	
	ods graphics on;
	ods output RSTUDENTBYPREDICTED=Rstud 
	           COOKSDPLOT=Cook
	           DFFITSPLOT=Dffits 
	           DFBETASPANEL=Dfbs;
	proc reg data=statdata.ameshousing3 
	         plots(only label)=
	              (RSTUDENTBYPREDICTED 
	               COOKSD 
	               DFFITS 
	               DFBETAS);
	   SigLimit: model SalePrice = &_GLSIND; 
	   title 'SigLimit Model - Plots of Diagnostic Statistics';
	
	run;
	quit;
	title;
	
	* Part 2;
	title;
	proc print data=Rstud;
	run;
	
	proc print data=Cook;
	run;
	
	proc print data=Dffits;
	run;
	
	proc print data=Dfbs;
	run;
	
	data Dfbs01;
		set Dfbs(obs=300);
	run;
	
	data Dfbs02;
		set Dfbs(firstobs=301);
	run;
	
	data Dfbs2;
		update Dfbs01 Dfbs02;
		by Observation;
	run;
	
	data influential;
		/* Merge datasets from above.*/
		merge Rstud
					Cook
					Dffits
					Dfbs2;
		by observation;
		
		/* Flag observations that have exceeded at least one cutpoint;*/
		if (ABS(Rstudent)>3) or (Cooksdlabel ne ' ') or Dffitsout then flag=1;
		array dfbetas{*} _dfbetasout: ;
		do i=2 to dim(dfbetas);
			if dfbetas{i} then flag=1;
		end;
		
		/* Set to missing values of influence statistics for those */
		/* that have not exceeded cutpoints; */
		if ABS(Rstudent)<=3 then Rstudent=.;
		if Cooksdlabel eq ' ' then CooksD=.;
		
		/* Subset only observations that have been flagged. */
		if flag=1;
		drop i flag;
	run;
	
	title;
	proc print data=influential;
		id observation;
		var Rstudent CooksD Dffitsout _dfbetasout:;
	run;
	
	************* Practice ***********;
	%let interval= Abdomen Weight Wrist Forearm;
	
	ods select none;
	proc glmselect data=statdata.bodyfat2 plots=all;
	   STEPWISE: model PctBodyFat2 = &interval / selection=stepwise 
	                                details=steps select=SL slentry=0.05 slstay=0.05;
	   title "Stepwise Model Selection for Pct Body Fat - SL 0.05";
	run;
	quit;
	
	ods select all;
	
	ods graphics on;
	ods output RSTUDENTBYPREDICTED=Rstud 
	           COOKSDPLOT=Cook
	           DFFITSPLOT=Dffits 
	           DFBETASPANEL=Dfbs;
	proc reg data=statdata.bodyfat2 
	         plots(only label)=
	              (RSTUDENTBYPREDICTED 
	               COOKSD 
	               DFFITS 
	               DFBETAS);
	   SigLimit: model PctBodyFat2 = &_GLSIND; 
	   title 'SigLimit Model - Plots of Diagnostic Statistics';
	
	run;
	quit;
	title;

	title;
	proc print data=Rstud;
	run;
	
	proc print data=Cook;
	run;
	
	proc print data=Dffits;
	run;
	
	proc print data=Dfbs;
	run;
	
	data Dfbs01;
		set Dfbs(obs=300);
	run;
	
	data Dfbs02;
		set Dfbs(firstobs=301);
	run;
	
	data Dfbs2;
		update Dfbs01 Dfbs02;
		by Observation;
	run;
	
	data influential;
		/* Merge datasets from above.*/
		merge Rstud
					Cook
					Dffits
					Dfbs2;
		by observation;
		
		/* Flag observations that have exceeded at least one cutpoint;*/
		if (ABS(Rstudent)>3) or (Cooksdlabel ne ' ') or Dffitsout then flag=1;
		array dfbetas{*} _dfbetasout: ;
		do i=2 to dim(dfbetas);
			if dfbetas{i} then flag=1;
		end;
		
		/* Set to missing values of influence statistics for those */
		/* that have not exceeded cutpoints; */
		if ABS(Rstudent)<=3 then Rstudent=.;
		if Cooksdlabel eq ' ' then CooksD=.;
		
		/* Subset only observations that have been flagged. */
		if flag=1;
		drop i flag;
	run;
	
	title;
	proc print data=influential;
		id observation;
		var Rstudent CooksD Dffitsout _dfbetasout:;
	run;

	
/********************************************
		Detecting Collinearity
*********************************************/
	proc reg data=statdata.fitness;
	   PREDICT: model Oxygen_Consumption = 
	                  RunTime Age Run_Pulse Maximum_Pulse;
	   FULL: model Oxygen_Consumption = 
	               Performance RunTime Age Weight
	               Run_Pulse Rest_Pulse Maximum_Pulse; 
	   title 'Collinearity: Full Model';
	run;
	quit;
	title;
	
	proc reg data=statdata.fitness;
	   FULL: model Oxygen_Consumption = 
	               Performance RunTime Age Weight
	               Run_Pulse Rest_Pulse Maximum_Pulse
	               / vif; 
	   title 'Collinearity: Full Model with VIF';
	run;
	quit;
	title;

	proc reg data=statdata.fitness;
	   NOPERF: model Oxygen_Consumption = 
             RunTime Age Weight
             Run_Pulse Rest_Pulse Maximum_Pulse
             / vif; 
		 NOPERFMAX: model Oxygen_Consumption = 
				     RunTime Age Weight
				     Run_Pulse Rest_Pulse
				     / vif; 
	   title 'Dealing with Collinearity';
	run;
	quit;	
	title;
	
	************ Practice ****************;
	proc contents data=Statdata.BodyFat2; run;
	
	%let interval = Abdomen Adioposity Age Ankle Biceps 
									Case Chest Density FatFreeWt Forearm 
									Height Hip Knee Neck PctBodyFat1 
									Thigh Weight Wrist;
	
	proc reg data=statdata.BodyFat2;
		*FULL: model PctBodyFat2=&interval / vif; 
		*NOWEIGHT: model PctBodyFat2=Abdomen Adioposity Age Ankle Biceps 
																Case Chest Density FatFreeWt Forearm 
																Height Hip Knee Neck PctBodyFat1 
																Thigh Wrist / vif; 
		*NOFact1: model PctBodyFat2=Abdomen Adioposity Age Ankle Biceps 
																Case Chest Density FatFreeWt Forearm 
																Height Hip Knee Neck 
																Thigh Wrist / vif; 
		NOAdioposity: model PctBodyFat2=Abdomen Age Ankle Biceps 
																Case Chest Density FatFreeWt Forearm 
																Height Hip Knee Neck 
																Thigh Wrist / vif; 
		title 'Collinearity: Full Model';
	run;
	quit;
	title;
