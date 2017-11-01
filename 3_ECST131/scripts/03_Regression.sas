/********************************************\
| 		Exploratory Data Analysis			 				 |
\********************************************/
	proc print data=statdata.ameshousing3;
	run;
	proc contents data=statdata.ameshousing3;
	run;
	proc sgscatter data=statdata.ameshousing3;
		plot SalePrice*Gr_Liv_Area / reg;
		title 'Association of Above Grade Living Area with Sale Price';
	run;
	%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area
		Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
	
	options nolabel;
	proc sgscatter data=statdata.ameshousing3;
		plot SalePrice*(&interval) / reg;
		title 'Associate of Interval Variables with Sale Price';
	run;
	
	ods graphics / width=800;
	proc corr data=statdata.fitness rank
		plots(only)=scatter(nvar=all ellipse=none);
		var RunTime Age Weight Run_Pulse
			Rest_Pulse Maximum_Pulse Performance;
		with Oxygen_Consumption;
		title 'Correlations with Oxygen_Consumption';
	run;
	title;
	
	ods graphics / imagemap=on;
	proc corr data=statdata.fitness nosimple
		plots(only)=matrix(nvar=all histogram);
		var RunTime Age Weight Run_Pulse
			Rest_Pulse Maximum_Pulse Performance;
		id name;
		title 'Correlations with Oxygen_Consumption';
	run;
	title;
	
	/* Practice */
	* Descriptive Analysis;
	ods select histogram probplot;
	proc univariate data=statdata.bodyfat;
		var PctBodyFat2 Age Weight Height 
				Neck Chest Abdomen Hip Thigh 
				Knee Ankle Biceps Forearm Wrist;
		histogram / normal (mu=est sigma=est);
		probplot / normal (mu=est sigma=est);
		inset skewness kurtosis;
		title "Predictors of % Body Fat";
		*probplot PctBodyFat2 Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist / normal(mu=est sigma=est);
	run;
	title;
	
	* Fix the record of a person with incorrect Height;
	data bodyfat_lab1;
		set statdata.bodyfat;
		if Height < 30 then
			Height = Height + 40;
	run;
	* Re-run the univariate descriptibe analysis;
	ods select histogram probplot;
	proc univariate data=bodyfat_lab1;
		var PctBodyFat2 Age Weight Height 
				Neck Chest Abdomen Hip Thigh 
				Knee Ankle Biceps Forearm Wrist;
		histogram / normal (mu=est sigma=est);
		probplot / normal (mu=est sigma=est);
		inset skewness kurtosis;
		title "Predictors of % Body Fat";
		*probplot PctBodyFat2 Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist / normal(mu=est sigma=est);
	run;
	title;
	
	* Generate Scatter Plots;
	ods graphics / width=800;
	proc corr data=bodyfat_lab1 rank
		plots(only)=scatter(nvar=all ellipse=none);
		var Age Weight Height;
		with PctBodyFat2;
		title 'Correlations with Body Fat %';
	run;
	title;
	
	proc corr data=bodyfat_lab1 rank
		plots(only)=scatter(nvar=all ellipse=none);
		var Neck Chest Abdomen Hip Thigh
				Knee Ankle Biceps Forearm Wrist;
		with PctBodyFat2;
		title 'Correlations and Scatter Plots with Body Fat %';
	run;
	title;
	
	* Scatter Plots Matrix;
	proc corr data=statdata.bodyfat2 nosimple
			plots=matrix(histogram);
		var Age Weight Height;
		title 'Correlations and Scatter Plot Matix of Basic Measures';
	run;
	
	proc corr data=statdata.bodyfat2 nosimple;
		var Neck Chest Abdomen Hip Thigh
				Knee Ankle Biceps Forearm Wrist;
		title 'Correlations and Scatter Plot Matix of Basic Measures';
	run;
	
	proc corr data=statdata.bodyfat2 nosimple
			plots=matrix;
		var Neck Chest Abdomen Hip Thigh
				Knee Ankle Biceps Forearm Wrist;
		with Age Weight Height;
		title 'Correlations and Scatter Plot Matix between';
		title2 'Basic Measure and Circumferences';
	run;

/********************************************
	Simple Linear Regression
*********************************************/
	proc reg data=statdata.fitness;
		model Oxygen_Consumption=RunTime;
		title 'Predicting Oxygen_Consumption from RunTime';
	run;
	
	* Predict values for records with missing values in target variable;
	data need_predictions;
		input RunTime @@;
		datalines;
	9 10 11 12 13
	;
	run;
	data predoxy;
		set need_predictions
				statdata.fitness;
	run;
	proc reg data=predoxy;
		model Oxygen_Consumption=RunTime /p;
		id RunTime;
		title 'Oxygen_Consumption=RunTime with Predicted Values';
	run;
	* Using Proc Score;
	proc reg data=statdata.fitness noprint outest=estimates;
		model Oxygen_Consumption=RunTime;
	run;
	quit;
	proc score data=need_predictions score=estimates
			out=scored type=parms;
		var RunTime;
	run;
	proc print data=scored;
		title 'Scored New Observations';
	run;

* Practice;
	proc reg data=statdata.bodyfat2;
		model PctBodyFat2=Weight;
		title 'Predicting Body Fat % from Weight';
	run;
	proc reg data=statdata.bodyfat2;
		model PctBodyFat2=Weight / clm cli;
	  title "Regression of % Body Fat on Weight";
	run;
	quit;
	title;
	
	proc reg data=statdata.bodyfat2 outest=estimates;
		model PctBodyFat2=Weight;
		title "Regression of % Body Fat on Weight";
	run;
	data toscore;
		input Weight @@;
		datalines;
	125 150 175 200 225
	;
	run;
	proc score data=toscore score=estimates
			out=scored type=parms;
		var Weight;
	run;
	proc print data=scored;
		title "Predicted % Body Fat from Weight";
	run;
	
/********************************************
	Multiple Regression
*********************************************/
	ods graphics on;
	
	proc reg data=statdata.ameshousing3 ;
	    model SalePrice=Basement_Area Lot_Area;
	    title "Model with Basement Area and Lot Area";
	run;
	quit;
	
	proc glm data=statdata.ameshousing3 
	         plots(only)=(contourfit);
	    model SalePrice=Basement_Area Lot_Area;
	    store out=multiple;
	    title "Model with Basement Area and Gross Living Area";
	run;
	quit;
	
	proc plm restore=multiple plots=all;
	    effectplot contour (y=Basement_Area x=Lot_Area);
	    effectplot slicefit(x=Lot_Area sliceby=Basement_Area=250 to 1000 by 250);
	run; 
	
	title;
	
	* Practice;
	proc reg data=statdata.bodyfat2;
		model PctBodyFat2=Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;
		title 'Model with Body Fat % and Circumferences';
	run;
	proc reg data=statdata.bodyfat2;
		model PctBodyFat2=Age Weight Height Neck Abdomen Hip Thigh Ankle Biceps Forearm Wrist;
		title 'Model with Body Fat % and Circumferences';
	run;
	
/********************************************
	Model Building and Interpretation
*********************************************/
	* The REG Procedure: Using the All-Possible Regressions Technique;
	ods graphics / imagemap=on;
	proc reg data=statdata.fitness
			plots(only)=(cp);
		ALL_REG: model oxygen_consumption = Performance RunTime Age Weight
																				Run_Pulse Rest_Pulse Maximum_Pulse
																				/ selection=cp rsquare adjrsq best=20;
		title 'Best Models Using All-Regression Option';
	run;
	quit;
	
	proc reg data=statdata.fitness;
		PREDICT: model oxygen_consumption = RunTime Age Run_Pulse Maximum_Pulse;
		EXPLAIN: model oxygen_consumption = RunTime Age Weight Run_Pulse Maximum_Pulse;
		title 'Check Best Two Candidate Models';
	run;
	quit;
	title;
	
	* Practice;
	ods graphics / imagemap=on;
	proc reg data=statdata.bodyfat2
			plots(only)=(cp);
		ALL_REG: model PctBodyFat2 = 	Age Weight Height
																	Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist
																	/ selection=cp rsquare adjrsq best=60;
		title 'Best Models Using All-Regression Option';
	run;
	quit;

	* Stepwise Selection Approach;
	%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
	ods graphics on;
	proc glmselect data=statdata.ameshousing3 plots=all;
		STEPWISE: model SalePrice=&interval / selection=stepwise
										details=steps select=SL slstay=0.05 slentry=0.05;
		title 'Stepwise Model Selection for SalePrice - SL 0.05';
	run;
	/*Optional code that will execute forward and backward selection, each with slentry and slstay = 0.05.
	proc glmselect data=statdata.ameshousing3 plots=all;
	   FORWARD: model SalePrice=&interval / selection=forward details=steps select=SL slentry=0.05;
	   title "Forward Model Selection for SalePrice - SL 0.05";
	run;
	
	proc glmselect data=statdata.ameshousing3 plots=all;
	   BACKWARD: model SalePrice=&interval / selection=backward details=steps select=SL slstay=0.05;
	   title "Backward Model Selection for SalePrice - SL 0.05";
	run;
	title;
	*/
	
	%let interval=Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;
	ods graphics on;
	proc glmselect data=statdata.BodyFat2 plots=all;
		STEPWISE: model PctBodyFat2=&interval / selection=stepwise
										details=steps select=SL;
		title 'Stepwise Model Selection for Body Fat % - SL 0.05';
	run;
	proc glmselect data=statdata.BodyFat2 plots=all;
	   FORWARD: model PctBodyFat2=&interval / selection=forward details=steps;
	   title "Forward Model Selection for Body Fat % - SL 0.05";
	run;
	
	* Practice;
	ods graphics on;
	proc glmselect data=statdata.bodyfat2 plots=all;
	   STEPWISESBC: model PctBodyFat2=Age Weight Height Neck Chest
	                      Abdomen Hip Thigh Knee Ankle Biceps Forearm
	                      Wrist / SELECTION=STEPWISE SELECT=SBC;
	   title 'SBC STEPWISE Selection with PctBodyFat2';
	run;
	quit;
	title;
	proc glmselect data=statdata.bodyfat2 plots=all;
	   STEPWISEAIC: model PctBodyFat2=Age Weight Height
	                      Neck Chest Abdomen Hip Thigh
	                      Knee Ankle Biceps Forearm Wrist
	                      / SELECTION=STEPWISE SELECT=AIC;
	   title 'AIC STEPWISE Selection with PctBodyFat2';
	run;
	quit;
	title;
