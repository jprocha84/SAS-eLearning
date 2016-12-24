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
proc print data=statdata.bodyfat (obs=10);
run;
proc univariate data=statdata.bodyfat;
	var PctBodyFat2 Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;
	probplot PctBodyFat2 Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist / normal(mu=est sigma=est);
run;

data bodyfat_lab1;
	set statdata.bodyfat;
	if Height < 30 then
		Height = Height + 40;
run;
proc univariate data=bodyfat_lab1;
	var PctBodyFat2 Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist;
	probplot PctBodyFat2 Age Weight Height Neck Chest Abdomen Hip Thigh Knee Ankle Biceps Forearm Wrist / normal(mu=est sigma=est);
run;