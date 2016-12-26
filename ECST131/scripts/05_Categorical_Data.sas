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
	