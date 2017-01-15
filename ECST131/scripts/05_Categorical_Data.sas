/********************************************
		Describing Categorical Data
*********************************************/
	ods graphics / width=800;
	
	proc freq data=statdata.sales;
		tables 	Purchase Gender Income
				Gender*Purchase
				Income*Purchase /
				plots=(freqplot);
		format Purchase purfmt.;
		title 'Frequency Tables for Sales Data';
	run;
	
	ods select histogram probplot;  

	proc univariate data=statdata.sales;
	   var Age;
	   histogram Age / normal (mu=est
	                   sigma=est); 
	   probplot Age / normal (mu=est
	                  sigma=est);
	   title1 'Distribution of Age'; 
	run;
	
	title;
	
	* Sorted by Logical Income;
	data statdata.sales_inc;
	   set statdata.sales;
	   if Income='Low' then IncLevel=1;
	   else If Income='Medium' then IncLevel=2;
	   else If Income='High' then IncLevel=3;
	run;
	
	ods graphics / width=800;
	
	proc freq data=statdata.sales_inc;
	   tables IncLevel*Purchase / plots=freq;
	   format IncLevel incfmt. Purchase purfmt.;
	   title1 'Create variable IncLevel to correct Income';
	run;
	
	title;
	
	******* Practice *******;
	proc contents data=statdata.safety;run;
	proc freq data=statdata.safety;
		tables Unsafe Type Region;
		title 'Vehicle Safety';
	run;
	
/********************************************
		Tests of Association
*********************************************/
	proc freq data=statdata.sales_inc;
	   tables Gender*Purchase /
	          chisq expected cellchi2 nocol nopercent 
	          relrisk;
	   format Purchase purfmt.;
	   title1  'Association between Gender and Purchase';
	run;
	
	title;
	

	proc freq data=statdata.sales_inc;
	   tables IncLevel*Purchase / chisq measures cl;
	   format IncLevel incfmt. Purchase purfmt.;
	   title1 'Ordinal Association between IncLevel and Purchase?';
	run;
	
	title;

	****** Practice *********;
	proc freq data=statdata.safety;
		tables Region*Unsafe / chisq relrisk expected;
		format Unsafe safefmt.;
		title 'Test and Measures of Association of Insurance Company - Region by Unsafe';
	run;
	
	proc freq data=statdata.safety;
		tables Size*Unsafe / chisq measures cl;
		format Unsafe safefmt.;
		title 'Test and Measures of Association of Insurance Company - Size by Unsafe';
	run;
	
/********************************************
		Introduction to Logistic Regression
*********************************************/
	proc logistic data=statdata.sales_inc
				  plots(only)=(effect);
		class Gender;
		model Purchase(event='1')=Gender;
		title 'Logistic using Effect Coding (default)';
	run;
	* Using Reference Cell Coding Option;
	proc logistic data=statdata.sales_inc
				  plots(only)=(effect);
		class Gender (param=ref ref='Male');
		model Purchase(event='1')=Gender;
		title 'Logistic using Reference Parameters';
	run;
	
	**** Practice ****;
	proc logistic data=statdata.safety plots(only)=(effect);
		class Region (param=ref ref='Asia');
		model Unsafe(event='1')=Region;
		title1 'LOGISTIC MODEL (1):Unsafe=Region';
	run;
	
/********************************************
		Multiple Logistic Regression
*********************************************/	
	ods graphics / width=700;
	
	proc format;
		value incfmt = 	1='Low Income'
										2='Medium Income'
										3='High Income';
	run;
	
	proc logistic data=statdata.sales_inc
								plots(only)=(effect oddsratio);
		class Gender (param=ref ref='Male')
				  IncLevel (param=ref ref='Low Income');
		units Age=10;
		model Purchase(event='1')=Gender Age IncLevel /
					selection=backward clodds=pl;
		format IncLevel incfmt.;
		title1 'LOGISTIC MODEL (2): Purchase=Gender Age IncLevel';
	run;
		
	proc logistic data=statdata.sales_inc
								plots(only)=(effect oddsratio);
		class Gender (param=ref ref='Male')
					IncLevel (param=ref ref='1');
		units Age=10;
		model Purchase(event='1')=Gender | Age | IncLevel @2/
					selection=backward clodds=pl;
		title1 'LOGISTIC MODEL (3): Main Effects and 2-Way Interactions';
		title2 '/ sel=backward';
	run;
	
	ods graphics / width=700;
	ods select OddsRatiosPL ORPlot;
	
	proc logistic data=statdata.sales_inc
								plots(only)=(oddsratio);
		class Gender (param=ref ref='Male')
					IncLevel (param=ref ref='1');
		units Age=10;
		model Purchase(event='1')=Gender | IncLevel Age;
		oddsratio Age / cl=pl;
		oddsratio Gender / diff=ref at (IncLevel=all) cl=pl;
		oddsratio IncLevel / diff=ref at (Gender=all) cl=pl;
		title1 'LOGISTIC MODEL (3a): Significant Terms and All Odds Ratios';
		title2 '/ sel=backward';
	run;
	title;
	
	******* Interactions PLOT **********;
	proc means data=statdata.sales_inc noprint nway;
	   class IncLevel Gender;
	   var Purchase;
	   output out=bins sum(Purchase)=Purchase n(Purchase)=BinSize;
	run;
	
	data bins;
	   set bins;
	      Logit=log((Purchase+1)/(BinSize-Purchase+1));
	run;
	
	proc sgscatter data=bins;
	   plot Logit*IncLevel /group=Gender markerattrs=(size=15)
	                        join;
	   format IncLevel incfmt.;
	   label IncLevel='Income Level';
	   title;
	run;
	quit;
	
	* Generate Predictions using PROC PLM;
	ods select none;
	proc logistic data=statdata.ameshousing3;
	   class Fireplaces (ref='0') Lot_Shape_2 (ref='Regular') / param=ref;
	   model Bonus(event='1')=Basement_Area|Lot_Shape_2 Fireplaces;
	   units Basement_Area=100;
	   store out=isbonus;
	run;
	ods select all;
	
	data newhouses;
	   length Lot_Shape_2 $9;
	   input Fireplaces Lot_Shape_2 $ Basement_Area;
	   datalines;
	   0 Regular 1060
	   2 Regular 775
	   2 Irregular 1100
	   1 Irregular 975
	   1 Regular 800
	   ;
	run;
	
	proc plm restore=WORK.ISBONUS;
	   score data=newhouses out=scored_houses / ILINK;
	   title 'Predictions using PROC PLM';
	run;
	
	proc print data=scored_houses;
	run;

	***** Practice ******;
	proc print data=statdata.safety;run;
	proc logistic data=statdata.safety
								plots(only)=(effect oddsratio);
		class Region (param=ref ref='Asia')
					Size (param=ref ref='Small');
		model Unsafe(event='1')=Weight Size Region /
					selection=backward clodds=pl;
		units Weight=-1;
		store isSafe;
		format Size sizefmt.;
		title 'LOGISTIC MODEL(Practice): Backwards Elimination';
	run;
	
	data checkSafety;
	   length Region $9.;
		 input Weight Size Region $ 5-13;
		 datalines;
	4 1 N America
	3 1 Asia     
	5 3 Asia     
	5 2 N America
	;
	run;
	
	proc plm restore=isSafe;
	score data=checkSafety out=scored_cars / ILINK;
	title 'Safety Predictions using PROC PLM';
	run;
	
	proc print data=scored_cars;
	run;
	
	title;