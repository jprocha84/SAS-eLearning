/*
 * 	Lesson 2: Using Macro Functions
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/data;
	libname orion "&path";
	
	* Using Macro Character Functions;
		%let startyear=2009;
		%let curr_year=%substr(&sysdate9,6);
		
		data orders;
			set orion.orders;
			where &startyear <= Year(Order_Date) <= &curr_year;
		run;
		
		title "Listing of Orders Data for &startyear-&curr_year";
		proc print data=orders;
		run;
		
		* Using the %SCAN Function;
		options symbolgen;
		%let dsn=orion.orders;
		%let var=order_date;
		%let name=%scan(&dsn,2,.);
		%let startyear=2009;
		%let curr_year=%substr(&sysdate9,6);
		
		data &name;
			set &dsn;
			where &startyear <= Year(&var) <= &curr_year;
		run;
		
		title "Listing of %scan(&syslast,2,.) Data for &startyear-&curr_year";
		proc print data=&syslast;
		run;
		
		* Using the %UPCASE Function;
		%let location=au;
		proc print data=orion.customer noobs;
			where Country="%upcase(&location)";
			var Customer_Name Country;
		run;
		
		* Using the %INDEX function;
		%let sitelist=DALLAS SEATTLE BOSTON;
		%let value=%index(&sitelist,LA);

		* Practice: Level 1;
			%let FullName=Anthony Miller;
			%let NewName=%substr(&FullName,1,1). %scan(&FullName,2);
			%put &NewName;
			
		* Practice: Level 2;
			title "Variables in the ORION.COUNTRY data set"; 
			proc sql;	
			   select name, type, length
			      from dictionary.columns
			      where libname="ORION" and
			      memname="COUNTRY";
			quit;
			
			*%let dsn=orion.country;
			*%let dsn=orion.discount;
			%let dsn=&syslast;
			%let lib=%upcase(%scan(&dsn,1,.));
			%let mem=%upcase(%scan(&dsn,2,.));
			
			title "Variables in the %upcase(&dsn) data set"; 
			proc sql;	
			   select name, type, length
			      from dictionary.columns
			      where libname="&lib" and
			      memname="&mem";
			quit;
			
			data cities;
			   set orion.city;
			   keep city_name country;
			run;
			
	* Using Arithmetic and Logical Expressions;
		* Using the %EVAL Function;
		%let thisyr=%substr(&sysdate9,6);
		%let lastry=%eval(&thisyr-1);
		
		proc means data=orion.order_fact maxdec=2 min max mean;
			class Order_Type;
			var Total_Retail_Price;
			where Year(Order_Date) between &lastry and &thisyr;
			title1 "Orders for &lastry and &thisyr";
			title2 "(as of &sysdate9)";
		run;
		
		* Using the %SYSEVALF Function;
		%let a=100;
		%let b=1.59;
		%let y=%sysevalf(&a+&b);
		
		%put The result with SYSEVALF is: &y;
		%put BOOLEAN conversion: %sysevalf(&a+&b, boolean);
		%put CEIL conversion: %sysevalf(&a+&b,ceil);
		%put FLOOR conversion: %sysevalf(&a+&b,floor);
		%put INTEGER conversion: %sysevalf(&a+&b,integer);
		
		* Practice;
			%let salary1=25000; 
			%let salary2=27000;
			
			%let Salary_Diff=%eval(&salary2-&salary1);
			%put &Salary_Diff;
			
			%let salary2=27050.45;
			%let Salary_Diff=%eval(&salary2-&salary1);
			%let Salary_Diff=%sysevalf(&salary2-&salary1);
			%put &Salary_Diff;
			
		* Using the %SYSFUNC Function;
			title1 "Report Produced on %sysfunc(today(),weekdate.)";
			title2 "at %sysfunc(time(),timeAMPM8.)";
			
			%let dsn=work.orders;
			%let var=order_date;
			%let name=%scan(&dsn,2,.);
			%let startyear=2007;
			%let curr_year=%substr(&sysdate9,6);
			
			data &name;
				set &dsn;
				where &startyear <= Year(&var) <= &curr_year;
			run;
			
			title "Listing of %sysfunc(propcase(%scan(&syslast,2,.))) Data for &startyear-&curr_year";
			proc print data=&syslast;
			run;
			
			* Practice;
				%put %sysfunc(mdy(1,1,2000),WEEKDATE.);
				%put %sysfunc(mdy(11,29,1984),WEEKDATE.);
				
		* Using Macro Functions to Mask Special Characters;
			options symbolgen;
			%let prt=%str(proc print data=&syslast; run;);
			&prt;
			
			* Practice: Level 1;
				%let company=%nrstr(AT&T);
				%let list=%str(one;two);
				%put list=&list company=&company;
				
			* Practice: Level 2;
				*%let Product=Jacket;
				%let Product=%nrstr(R&D);
				proc print data=orion.product_dim;
				   where Product_Name contains "&Product";
				   var Product_Name Product_ID Supplier_Name;
				   title "Product Names Containing '&Product'";
				run;
				
