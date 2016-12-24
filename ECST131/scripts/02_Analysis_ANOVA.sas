/********************************\
| Graphical Analysis Association |
\********************************/
proc sgplot data=statdata.ameshousing3;
   vbox SalePrice / category=Central_Air
                    connect=mean;
   title "Sale Price Differences across Central Air";
run;
 
proc sgplot data=statdata.ameshousing3;
   vbox SalePrice / category=Fireplaces
                    connect=mean;
   title "Sale Price Differences across Fireplaces";
run;
 
proc sgplot data=statdata.ameshousing3;
   vbox SalePrice / category=Heating_QC
                    connect=mean;
   title "Sale Price Differences across Heating Quality";
run;

/********* MACRO *********/
%let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
         Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
         Masonry_Veneer Lot_Shape_2 Central_Air;

/*PROC SGPLOT is used here with the VBAR statement to produce vertical bar charts*/
/*PROC SGPLOT can only produce one plot at a time and so the macro is written to*/
/*produce one plot for each member in the list of the &categorical macro variable.*/
/*
      Macro Usage:
      %box(DSN = ,
           Response = ,
           CharVar = )
*/
%macro box(dsn      = ,
           response = ,
           Charvar  = );
	%let i = 1 ;
	
	%do %while(%scan(&charvar,&i,%str( )) ^= %str()) ;
	    %let var = %scan(&charvar,&i,%str( ));
	    proc sgplot data=&dsn;
	        vbox &response / category=&var 
	                         grouporder=ascending 
	                         connect=mean;
	        title "&response across Levels of &var";
	    run;
	    %let i = %eval(&i + 1 ) ;
	%end ;
%mend box;

%box(dsn      = statdata.ameshousing3,
     response = SalePrice,
     charvar  = &categorical);

title;

options label;
/*************************/


/********************************\
| 		Two-Sample t-Test 				 |
\********************************/
proc ttest data=statdata.testscores
	plots(shownull)=interval;
	class Gender;
	var SATScore;
	Title 'Two-Sample t-Test Comparing Girls to Boys';
run;


proc ttest data=statdata.testscores
	plots(only shownull)=interval h0=0 sides=u;
	class Gender;
	var SATScore;
	title 'One-Sided t-Test Comparing Girls to Boys';
run;

/* Practice */
proc print data=statdata.German (obs=10);run;
proc freq data=statdata.German;run;

proc ttest data=statdata.German
	plots(shownull)=interval h0=0 sides=l;
	class Group;
	var Change;
	title 'One-Sided t-Test Comparing Groups';
run;

/********************************\
| 		One-Way ANOVA			 				 |
\********************************/
proc print data=statdata.mggarlic (obs=10);
	title 'Partial Listing of Garlic Data';
run;
proc means data=statdata.mggarlic printalltypes maxdec=3;
	var BulbWt;
	class Fertilizer;
	title 'Descriptive Statistics of Garlic Weight';
run;
ods graphics on / width=700;
proc sgplot data=statdata.mggarlic;
	vbox BulbWt / category=Fertilizer datalabel=BedID;
	format BedID 5.;
	title 'Box Plots of Garlic Weight';
run;
title;
proc glm data=statdata.mggarlic
	plots(only)=diagnostics(unpack);
	class Fertilizer;
	model BulbWt=Fertilizer;
	means Fertilizer / hovtest;
run;
/* Practice */
proc print data=statdata.ads (obs=10);
run;
proc freq data=statdata.ads;
	tables ad;
run;
proc means data=statdata.ads printalltypes maxdec=3
	n mean median kurtosis skewness min max q1 q3;
	var sales;
	class ad;
	title 'Descriptive Statistics of Ads Data';
run;
ods graphics on /width=700;
proc sgplot data=statdata.ads;
	vbox sales / category=ad;
	title 'Box Plots of Ads';
run;
title;
proc univariate data=statdata.ads;
	var sales;
	class ad;
	histogram sales/ normal(mu=est sigma=est);
	inset skewness kurtosis / position=ne;
	probplot sales / normal(mu=est sigma=est);
	inset skewness kurtosis ;
	title 'Descriptive Statistics Using PROC UNIVARIATE';
run;
proc glm data=statdata.ads
	plots(only)=diagnostics(unpack);
	class ad;
	model sales=ad;
	means ad / hovtest;
run;
/******************************************************************\
| 		ANOVA with Data from a Randomized Block Design			 				 |
\******************************************************************/
proc print data=statdata.mggarlic_block (obs=10);
run;
proc means data=statdata.mggarlic_block printalltypes;
	var BulbWt;
	class Position Sector;
run;
proc glm data=statdata.mggarlic_block plots(only)=diagnostics(unpack);
	class Fertilizer Sector;
	model BulbWt=Fertilizer Sector;
	title 'ANOVA for Ramdomized Block Design';
run;
quit;
title;
/* Practice */
proc print data=statdata.ads1 (obs=10);
run;
proc glm data=statdata.ads1 plots(only)=diagnostics(unpack);
	class Ad Area;
	model Sales=Ad Area;
	title 'ANOVA for Ramdomized Block Design - Ads';
run;

/**************************************\
| 		ANOVA Post Hoc Test			 				 |
\**************************************/
ods graphics on / width=700;
ods trace off;
ods select lsmeans diff meanplot diffplot controlplot;
proc glm data=statdata.mggarlic_block;
	class Fertilizer Sector;
	model BulbWt=Fertilizer Sector;
	lsmeans Fertilizer / pdiff=all adjust=tukey;
	lsmeans Fertilizer / pdiff=controlu('4') adjust=dunnett;
	lsmeans Fertilizer / pdiff=all adjust=T;
	title 'Garlic Data: Multiple Comparisons';
run;
quit;
title;

/* Practice */
ods graphics on / width=700;
ods select lsmeans diff meanplt diffplot controlplot;
proc glm data=statdata.ads1;
	class Ad Area;
	model Sales=Ad Area;
	lsmeans Ad / pdiff=all adjust=tukey;
	lsmeans Ad / pdiff=controlu('display') adjust=dunnett;
	title 'Ads Data: Multiple Comparisons';
run;

/******************************************\
| 		Two-Way ANOVA with Interactions			 |
\******************************************/
proc format;
	value dosef  
					1='Placebo'
					2='100 mg'
					3='200 mg'
					4='500 mg';
run;
proc print data=statdata.drug (obs=10);
run;
proc means data=statdata.drug
	mean var std printalltypes;
	class Disease DrugDose;
	var BloodP;
	output out=means mean=BloodP_Mean;
	format DrugDose dosef.;
	title 'Selected Descriptive Statistics for Drug Data Set';
run;
proc print data=means label;
run;
ods graphics on / width=800;
proc sgplot data=means;
	where _TYPE_=3;
	scatter x=DrugDose y=BloodP_Mean / group=Disease markerattrs=(size=10);
	series x=DrugDose y=BloodP_Mean / group=Disease lineattrs=(thickness=2);
	xaxis integer;
	format DrugDose dosef.;
	title 'Plot of Stratified Means in Drug Data Set';
run;
ods graphics on / width=800;
ods select meanplot lsmeans slicedanova;
proc glm data=statdata.drug;
	class DrugDose Disease;
	model Bloodp=DrugDose Disease DrugDose*Disease;
	lsmeans DrugDose*Disease / slice=Disease;
	format DrugDose dosef.;
	title 'Analyze the Effects of DrugDose';
	title2 'at Each Level of Disease';
run;

/* Practice */
proc print data=statdata.concrete (obs=10);
run;
proc means data=statdata.concrete
	mean var std printalltypes q1 q3 kurtosis skewness;
	class Brand Additive;
	var Strength;
	output out=means mean=Strength_Mean;
	title 'Selected Descriptive Statistics for Concrete Data Set';
run;
proc print data=means;
run;
ods graphics on / width=800;
proc sgplot data=means;
	where _TYPE_=3;
	scatter x=Additive y=Strength_Mean / group=Brand markerattrs=(size=10);
	xaxis integer;
	title 'Plot of Stratified Means in Concrete Data Set';
run;
proc glm data=statdata.concrete;
	class Additive Brand;
	model Strength=Additive Brand Additive*Brand;
	title 'Analyze the Effects of Additive at Each Level of Brand';
run;
proc glm data=statdata.concrete;
	class Additive Brand;
	model Strength=Additive Brand;
	lsmeans Additive;
	title 'Analyze the Effects of Additive at Each Level of Brand';
run;
/* STORE and PLM Procedures */
ods graphics on;
proc glm data=statdata.ameshousing3
	order=internal
	plots(only)=intplot;
	class Season_Sold Heating_QC;
	model SalePrice=Heating_QC Season_Sold Heating_QC*Season_Sold;
	lsmeans Heating_QC*Season_Sold / diff slice=Heating_QC;
	format Season_Sold Season.;
	store out=interact;
	title 'Model with Heating Quality and Season as Interacting Predictors';
run;
ods graphics on;
proc plm restore=interact plots=all;
	slice Heating_QC*Season_Sold / sliceby=Heating_QC adjust=tukey;
	effectplot interaction(sliceby=Heating_QC) / clm;
run;
/* Practice */
proc sgplot data=statdata.drug;
	vline DrugDose / group=Disease
									 stat=mean
									 response=BloodP
									 markers;
	format DrugDose dosefmt.;
run;
ods graphics on;
proc glm data=statdata.drug;
	class DrugDose Disease;
	model BloodP=DrugDose|Disease;
	lsmeans DrugDose*Disease / slice=Disease;
run;
quit;