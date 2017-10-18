/*** Lesson 2: Working with SAS Programs ***/
	data work.newsalesemps;
	   set orion.sales;
	   where Country='AU';
	run;
	
	title 'New Sales Employees';
	
	proc print data=work.newsalesemps;
	run;
	
	proc means data=work.newsalesemps;
	   class Job_Title;
	   var Salary;
	run;
	
	title;

/*** Lesson 3: Accessing Data ***/
	proc contents data=orion._all_;
	run;
	
	proc contents data=orion._all_ nods;
	run;
	
	* Viewing the Descriptor Portion of a Data Set;
	proc contents data=orion.sales;
	run;
	
	proc print data=orion.sales;
	run;

/*** Lesson 4: Producing Detail Reports ***/
	
	* Subsetting Report;
	proc print data=orion.sales;
	   var Last_Name First_Name Salary;
	   sum Salary;
	run;
	
	* Selecting Observations;
	proc print data=orion.sales noobs;
	   var Last_Name First_Name Salary Country;
	   where Country='AU' and Salary<25500;
	run;
	
	* Using the CONTAINS Operator;
	proc print data=orion.sales noobs;
	   var Last_Name First_Name Country Job_Title;
	   where Country='AU' and Job_Title contains 'Rep';
	run;
	
	* Subsetting Observations and Replacing the Obs Column;
	proc print data=orion.customer_dim;
	   where Customer_Age=21;
	   id Customer_ID;
	   var Customer_Name
	       Customer_Gender Customer_Country
	       Customer_Group Customer_Age_Group
	       Customer_Type;
	run;
	
	* Sorting a Data Set;
	proc sort data=orion.sales
	          out=work.sales_sort;
	   by Salary;
	run;
	
	proc print data=work.sales_sort; 
	run;
	
	* Sorting a Data Set by Multiple Variables;
	proc sort data=orion.sales
	          out=work.sales2;
	   by Country descending Salary;
	run;
	
	proc print data=work.sales2;
	run;
	
	* Grouping Observations in Reports;
	proc sort data=orion.sales          
	          out=work.sales2;   
	   by Country descending Salary;
	run;
	
	proc print data=work.sales2;
	   by Country;
	run;
	
	* Displaying Titles and Footnotes in a Report;
	title1 'Orion Star Sales Staff';
	title2 'Salary Report';
	footnote1 'Confidential';
	
	proc print data=orion.sales;
	   var Employee_ID Last_Name Salary;
	run;
	
	proc print data=orion.sales; 
	   var Employee_ID First_Name Last_Name Job_Title Hire_Date; 
	run;
	
	* Changing and Canceling Titles and Footnotes;
	title1 'Orion Star Sales Staff';
	title2 'Salary Report';
	footnote1 'Confidential';
	
	proc print data=orion.sales;
	   var Employee_ID Last_Name Salary;
	run;
	
	title1 'Employee Information';
	proc print data=orion.sales;
	   var Employee_ID First_Name Last_Name Job_Title Hire_Date;
	run;
	
	* Displaying Labels in a Report;
	title1 'Orion Star Sales Staff';
	title2 'Salary Report';
	footnote1 'Confidential';
	
	proc print data=orion.sales label;
	   var Employee_ID Last_Name Salary;
	   label Employee_ID = 'Sales ID'
	         Last_Name = 'Last Name'
	         Salary = 'Annual Salary';
	run;
	title;
	footnote;

/*** Lesson 5: Formatting Data Values ***/
	
	* Applying Temporary Formats;
	proc print data=orion.sales label noobs;
	   where Country='AU' and 
	         Job_Title contains 'Rep';
	   label Job_Title='Sales Title'
	         Hire_Date='Date Hired';
	   var Last_Name First_Name Country Job_Title
	       Salary Hire_Date;
	run;
	
	proc print data=orion.sales label noobs;
	   where Country='AU' and 
	         Job_Title contains 'Rep';
	   label Job_Title='Sales Title'
	         Hire_Date='Date Hired';
	   format Hire_Date mmddyy10. Salary dollar8.;
	   var Last_Name First_Name Country Job_Title
	       Salary Hire_Date;
	run;
	
	* Specifying a User-Defined Format for a Character Variable;
	proc format;
	   value $ctryfmt 'AU'='Australia'
	                  'US'='United States'
	                  other='Miscoded';
	run;
	
	proc print data=orion.sales label;
	   var Employee_ID Job_Title Salary 
	       Country Birth_Date Hire_Date;
	   label Employee_ID='Sales ID'
	         Job_Title='Job Title'
	         Salary='Annual Salary'
	         Birth_Date='Date of Birth'
	         Hire_Date='Date of Hire';
	   format Salary dollar10. 
	          Birth_Date Hire_Date monyy7.
	          Country $ctryfmt.;
	run;
	
	* Specifying a User-Defined Format for a Numeric Variable;
	proc format;
	   value tiers low-<50000='Tier1'
	               50000-100000='Tier2'
	               100000<-high='Tier3';
	run;
	
	proc print data=orion.sales;
	   var Employee_ID Job_Title Salary 
	       Country Birth_Date Hire_Date;
	   format Birth_Date Hire_Date monyy7.
	          Salary tiers.;
	run;

/*** Lesson 6: Reading SAS Data Sets ***/
	
	* Subsetting Observations in the DATA Step;
	proc print data=orion.sales;
	run;
	
	data work.subset1;
	   set orion.sales;
	   where Country='AU' and
	         Job_Title contains 'Rep';
	run;
	 
	proc print data=work.subset1;
	run;
	
	* Subsetting Observations and Creating a New Variable;
	data work.subset1;
	   set orion.sales;
	   where Country='AU' and
	         Job_Title contains 'Rep' and
	         Hire_Date<'01jan2000'd;
	   Bonus=Salary*.10;
	run;
	
	proc print data=work.subset1 noobs;
	   var First_name Last_Name Salary 
	       Job_Title Bonus Hire_Date;
	   format Hire_Date date9.;
	run;
	
	* Subsetting Variables in a DATA Step: DROP and KEEP;
	data work.subset1;
	   set orion.sales;
	   where Country='AU' and
	         Job_Title contains 'Rep';
	   Bonus=Salary*.10;
	   drop Employee_ID Gender Country Birth_Date;
	run;
	
	proc print data=work.subset1;
	run;
	
	data work.subset1;
	   set orion.sales;
	   where Country='AU' and
	         Job_Title contains 'Rep';
	   Bonus=Salary*.10;
	   keep First_Name Last_Name Salary Job_Title Hire_Date Bonus;
	run;
	
	proc print data=work.subset1;
	run;
	
	* Selecting Observations by Using the Subsetting IF Statement;
	data work.auemps;
	   set orion.sales;
	   where Country='AU';
	   Bonus=Salary*.10;
	   if Bonus>=3000;
	run;
	 
	proc print data=work.auemps;
	run;
	
	* Adding Permanent Labels to a SAS Data Set;
	data work.subset1;
	   set orion.sales;
	   where Country='AU' and 
	         Job_Title contains 'Rep';
	   Bonus=Salary*.10;
	   label Job_Title='Sales Title'
	         Hire_Date='Date Hired';
	   drop Employee_ID Gender Country Birth_Date;
	run;
	
	proc contents data=work.subset1;
	run;
	
	proc print data=work.subset1 label;
	run;
	
	* Adding Permanent Formats to a SAS Data Set;
	data work.subset1;
	   set orion.sales;
	   where Country='AU' and
	         Job_Title contains 'Rep';
	   Bonus=Salary*.10;
	   label Job_Title='Sales Title'
	         Hire_Date='Date Hired';
	   format Salary Bonus dollar12. 
	          Hire_Date ddmmyy10.;
	   drop Employee_ID Gender Country Birth_Date;
	run;
	
	
	proc contents data=work.subset1;
	run;
	
	proc print data=work.subset1 label;
	run;


/*** Lesson 7: Reading Spreadsheet and Database Data ***/
	
	* Accessing Excel Worksheets in SAS;
	libname orionx pcfiles path="&path/sales.xls";
	
	proc contents data=orionx._all_;
	run;
	
	* Printing an Excel Worksheet;
	proc print data=orionx.'Australia$'n;
	run;
	
	proc print data=orionx.'Australia$'n noobs;
	   where Job_Title ? 'IV';
	   var Employee_ID Last_Name Job_Title Salary;
	run;
	
	* Creating a SAS Data Set from an Excel Worksheet;
	libname orionx pcfiles path="&path/sales.xls";
	
	data work.subset;
	   set orionx.'Australia$'n;
	   where Job_Title contains 'Rep';
	   Bonus=Salary*.10;
	   label Job_Title='Sales Title'
	         Hire_Date='Date Hired';
	   format Salary comma10. Hire_Date mmddyy10.
	          Bonus comma8.2;
	run;
	 
	proc contents data=work.subset;
	run;
	 
	proc print data=work.subset label;
	run;
	
	libname orionx clear;
	
/*** Lesson 8: Reading Raw Data Files ***/

	* Creating a SAS Data Set from a Delimited Raw Data File;
	data work.sales1;
	   infile "&path/sales.csv" dlm=',';
	   input Employee_ID First_Name $ 
	         Last_Name $ Gender $ Salary 
	         Job_Title $ Country $;
	run;
	
	proc print data=work.sales1;
	run;
	
	* Specifying the Lengths of Variables Explicitly;
	data work.sales2;
	   length First_Name $ 12 Last_Name $ 18 
	          Gender $ 1 Job_Title $ 25 
	          Country $ 2;
	   infile "&path/sales.csv" dlm=',';
	   input Employee_ID First_Name $ Last_Name $ 
	         Gender $ Salary Job_Title $ Country $; 
	run;
	
	proc contents data=work.sales2;
	run;
	
	proc print data=work.sales2;
	run;
	
	
	data work.sales2;
	   length Employee_ID  8 First_Name $ 12
	          Last_Name $ 18 Gender $ 1 
	          Salary  8 Job_Title $ 25
	          Country $ 2;
	   infile "&path/sales.csv" dlm=',';
	   input Employee_ID First_Name $ Last_Name $ 
	         Gender $ Salary Job_Title $ Country $; 
	run;
	
	proc contents data=work.sales2 varnum;
	run;
	
	proc print data=work.sales2;
	run;
	
	* Specifying Informats in the INPUT Statement;
	data work.sales2;
	   infile "&path/sales.csv" dlm=',';
	   input Employee_ID First_Name :$12. Last_Name :$18.
	         Gender :$1. Salary Job_Title :$25. Country :$2.
	         Birth_Date :date. Hire_Date :mmddyy.;
	run;
	 
	proc print data=work.sales2;
	run;
	
	* Subsetting and Adding Permanent Attributes;
	data work.subset;
	   infile "&path/sales.csv" dlm=',';
	   input Employee_ID First_Name :$12. 
	         Last_Name :$18. Gender :$1. Salary
	         Job_Title :$25. Country :$2.
	         Birth_Date :date. Hire_Date :mmddyy.;
	   if Country='AU';
	   keep First_Name Last_Name Salary 
	        Job_Title Hire_Date;
	   label Job_Title='Sales Title'
	         Hire_Date='Date Hired';
	   format Salary dollar12. Hire_Date monyy7.;
	run;
	
	proc print data=work.subset label;
	run;
	
	* Reading Instream Data;
	data work.newemps;
	   input First_Name $ Last_Name $  
	         Job_Title $ Salary :dollar8.;
	   datalines;
	Steven Worton Auditor $40,450
	Merle Hieds Trainee $24,025
	Marta Bamberger Manager $32,000
	;
	
	proc print data=work.newemps;
	run;
	
	data work.newemps2;
	   infile datalines dlm=',';
	   input First_Name $ Last_Name $
	         Job_Title $ Salary :dollar8.;
	   datalines;
	Steven,Worton,Auditor,$40450
	Merle,Hieds,Trainee,$24025
	Marta,Bamberger,Manager,$32000
	;
	
	proc print data=work.newemps2;
	run; 
	
    * Reading a Raw Data File That Contains Data Errors;
	data work.sales4;
	   infile "&path/sales3inv.csv" dlm=',';
	   input Employee_ID First $ Last $ 
	         Job_Title $ Salary Country $;
	run;
	
	proc print data=work.sales4;
	run;
	
	* Reading a Raw Data File That Contains Missing Data;
	data work.contacts;
	   length Name $ 20 Phone Mobile $ 14;
	   infile "&path/phone2.csv" dsd;
	   input Name $ Phone $ Mobile $;
	run;
	
	proc print data=work.contacts noobs;
	run;
	
	* Reading a Raw Data File Using the MISSOVER Option;
	data work.contacts2;
	   infile "&path/phone.csv" dlm=',' missover; 
	   input Name $ Phone $ Mobile $;
	run;
	
	proc print data=contacts2 noobs;
	run;
	
	
	data work.contacts2;
	   length Name $ 20 Phone Mobile $ 14;
	   infile "&path/phone.csv" dlm=',' missover; 
	   input Name $ Phone $ Mobile $;
	run;
	
	proc print data=contacts2 noobs;
	run;

/*** Lesson 9: Manipulating Data ***/

	* Creating Variables by Using Functions;
	data work.comp;
	   set orion.sales;
	   Bonus=500;
	   Compensation=sum(Salary,Bonus);
	   BonusMonth=month(Hire_Date);
	run;
	
	proc print data=work.comp;
	   var Employee_ID First_Name Last_Name 
	       Salary Bonus Compensation BonusMonth;
	run;
	
	* Assigning Values Conditionally;
	data work.comp;
	   set orion.sales;
	   if Job_Title='Sales Rep. IV' then
	      Bonus=1000;
	   if Job_Title='Sales Manager' then 	  	
	      Bonus=1500;
	   if Job_Title='Senior Sales Manager' then 
	      Bonus=2000;
	   if Job_Title='Chief Sales Officer' then 
	      Bonus=2500;
	run;
	
	proc print data=work.comp;
	   var Last_Name Job_Title Bonus;
	run;
	
	* Using Compound Conditions;
	data work.comp;
	   set orion.sales;
	   if Job_Title='Sales Rep. III' or
	      Job_Title='Sales Rep. IV' then
	      Bonus=1000;
	   else if Job_Title='Sales Manager' then
	      Bonus=1500;
	   else if Job_Title='Senior Sales Manager' then 
	      Bonus=2000;
	   else if Job_Title='Chief Sales Officer' then 
	      Bonus=2500;
	   else Bonus=500;
	run;
	 
	proc print data=work.comp;
	   var Last_Name Job_Title Bonus;
	run;
	
	* Using IF-THEN/ELSE Statements;
	data work.bonus;
	   set orion.sales;
	   if Country='US' then Bonus=500;
	   else Bonus=300;
	run;
	 
	proc print data=work.bonus;
	   var First_Name Last_Name Country Bonus;
	run;
	
	* Creating Two Variables Conditionally;
	data work.bonus;
	   set orion.sales;
	   if Country='US' then 
	      do;
	         Bonus=500;
	         Freq='Once a Year';
	      end;
	   else if Country='AU' then
	      do;
	         Bonus=300;
	         Freq='Twice a Year';
	      end;
	run;
	proc print data=work.bonus;
	   var First_Name Last_Name Country Bonus Freq;
	run;
	
	* Adjusting the Program;
	data work.bonus;
	   set orion.sales;
	   length Freq $ 12;
	   if Country='US' then
	      do;
	         Bonus=500;
	         Freq='Once a Year';
	      end;
	   else if Country='AU' then
	      do;
	         Bonus=300;
	         Freq='Twice a Year';
	      end;
	run;
	
	proc print data=work.bonus;
	   var First_Name Last_Name Country Bonus Freq;
	run;
	
	data work.bonus;
	   set orion.sales;
	   length Freq $ 12;
	   if Country='US' then 
	      do;
	         Bonus=500;
	         Freq='Once a Year';
	      end;
	   else do;
	         Bonus=300;
	         Freq='Twice a Year';
	      end;
	run;
	
	proc print data=work.bonus;
	   var First_Name Last_Name Country 
	       Bonus Freq;
	run;
	
/*** Lesson 10: Combining SAS Data Sets ***/

	* Concatenating Data Sets with Different Variables;	
	********** Create Data **********;
	data empscn;
	   input First $ Gender $ Country $;
	   datalines;
	Chang   M   China
	Li      M   China
	Ming    F   China
	;
	run;
	
	data empsjp;
	   input First $ Gender $ Region $;
	   datalines;
	Cho     F   Japan
	Tomi    M   Japan
	;
	run;
	
	********** Unlike-Structured Data Sets **********;
	data empsall2;
	   set empscn empsjp;
	run;
	
	proc print data=empsall2;
	run;
	
	*Merging Data Sets One-to-One;
	********** Create Data **********;
	data empsau;
	   input First $ Gender $ EmpID;
	   datalines;
	Togar   M   121150
	Kylie   F   121151
	Birin   M   121152
	;
	run;
	
	data phoneh;
	   input EmpID Phone $15.;
	   datalines;
	121150 +61(2)5555-1793
	121151 +61(2)5555-1849
	121152 +61(2)5555-1665
	;
	run;
	
	********** Match-Merge One-to-One**********;
	data empsauh;
	   merge empsau phoneh;
	   by EmpID;
	run;
	
	proc print data=empsauh;
	run;
	
	* Match-Merging Data Sets with Non-Matches;
	********** Create Data **********;
	data empsau;
	   input First $ Gender $ EmpID;
	   datalines;
	Togar   M   121150
	Kylie   F   121151
	Birin   M   121152
	;
	run;
	
	data phonec;
	   input EmpID Phone $15.;
	   datalines;
	121150 +61(2)5555-1795
	121152 +61(2)5555-1667
	121153 +61(2)5555-1348
	;
	run;
	
	********** Match-Merge with Non-Matches**********; 
	data empsauc;
	   merge empsau phonec;
	   by EmpID;
	run;
	
	proc print data=empsauc;
	run;
	
	* Selecting Non-Matches;
	********** Create Data **********;
	data empsau;
	   input First $ Gender $ EmpID;
	   datalines;
	Togar   M   121150
	Kylie   F   121151
	Birin   M   121152
	;
	run;
	
	data phonec;
	   input EmpID Phone $15.;
	   datalines;
	121150 +61(2)5555-1795
	121152 +61(2)5555-1667
	121153 +61(2)5555-1348
	;
	run;
	
	********** Non-Matches from empsau Only **********;
	data empsauc2;
	   merge empsau(in=Emps) 
	         phonec(in=Cell);
	   by EmpID;
	   if Emps=1 and Cell=0;
	run;
	
	proc print data=empsauc2;
	run;
	
/*** Lesson 11: Creating Summary Reports ***/

	* Creating a One-Way Frequency Report;
	proc freq data=orion.sales;
	   tables Gender;
	   where Country='AU';
	run;
	
	* Using Formats in PROC FREQ;
	proc format;
	   value Tiers low-25000='Tier1'
	               25000<-50000='Tier2'
	               50000<-100000='Tier3'
	               100000<-high='Tier4';
	run;
	 
	proc freq data=orion.sales;
	   tables Salary;
	   format Salary Tiers.;
	run;
	
	* Listing Multiple Variables on a TABLES Statement;
	proc freq data=orion.sales;
	   tables Gender Country;
	run;
	
	proc sort data=orion.sales out=sorted;
	   by Country;
	run;
	
	proc freq data=sorted;
	   tables Gender; 
	   by Country;
	run;
	
	* Creating a Crosstabulation Table;
	proc freq data=orion.sales;
	   tables Gender*Country;
	run;

	* Examining Your Data;
	proc print data=orion.nonsales2 (obs=20);
	run;
	
	* Using PROC FREQ Options to Validate Your Data;
	proc freq data=orion.nonsales2 order=freq;
	   tables Employee_ID/nocum nopercent;
	run;
	
	proc freq data=orion.nonsales2 nlevels;
	   tables Gender Country Employee_ID/nocum nopercent;
	run;
	
	proc freq data=orion.nonsales2 nlevels;
	   tables Gender Country Employee_ID/nocum nopercent noprint;
	run;
	
	* Using PROC PRINT to Validate Your Data;
	proc print data=orion.nonsales2;
	   where Gender not in ('F','M') or
	         Country not in ('AU','US') or
	         Job_Title is null or 
	         Salary not between 24000 and 500000 or 
	         Employee_ID is missing or
	         Employee_ID=120108;
	run;

	* Creating a Summary Report with PROC MEANS;
	proc means data=orion.sales;
	   var Salary;
	run;
	
	* Creating a PROC MEANS Report with Grouped Data;
	proc means data=orion.sales;
	   var Salary;
	   class Gender Country;
	run;
	
	* Requesting Specific Statistics in PROC MEANS;
	proc means data=orion.sales n mean;
	   var Salary;
	run;
	
	proc means data=orion.sales min max sum;
	   var Salary;
	   class Gender Country;
	run;
	
	* Validating Data Using PROC MEANS;
	proc means data=orion.nonsales2 n nmiss min max;
	   var Salary;
	run; 
	
	* Validating Data Using PROC UNIVARIATE;
	
	proc univariate data=orion.nonsales2;
	   var Salary;
	run;
	
	proc univariate data=orion.nonsales2 nextrobs=3;
	   var Salary;
	run;
	
	proc univariate data=orion.nonsales2 nextrobs=3;
	   var Salary;
	   id Employee_ID;
	run;
	
	* Using the SAS Output Delivery System;
	
	/*Use a filepath to a location where you have Write access.*/
	ods pdf file="c:/output/salaries.pdf";
	
	proc means data=orion.sales min max sum;
	   var Salary;
	   class Gender Country;
	run;
	
	ods pdf close;
	
	ods csv file="c:/output/salarysummary.csv";
	
	proc means data=orion.sales min max sum;
	   var Salary;
	   class Gender Country;
	run;
	
	ods csv close;