/*
 * 	Lesson 5: Using Conditional and Iterative Processing in Macro Programs
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/data;
	libname orion "&path";
	
	* Processing Statements Conditionally;
		options mcompilenote=all;
		%macro reports;
			proc print data=orion.order_fact;
				where order_date="&sysdate9"d;
				var product_id total_retail_price;
				title "Daily Sales: &sysdate9";
			run;
			%if &sysday=Friday %then %do;
				proc means data=orion.order_fact n sum mean;
					where order_date between "&sysdate9"d - 6 and "&sysdate9"d;
					var quantity total_retail_price;
					title "Weekly Sales: &sysdate9";
				run;
			%end;
		%mend;
		
		options mlogic;
		%reports;
		
		* Using the %INCLUDE statement;
		options mprint;
		options mcompilenote=all;
		options symbolgen;
		options mlogic;
		%let macrospath=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/scripts/macros;
		%macro reports;
			%include "&macrospath/daily.sas" / source2;
			*%put &sysday;
			%if &sysday=Monday %then %do;
				%include "&macrospath/weekly.sas" / source2;
			%end;
		%mend;
		%reports;
		
		* Adding Complete Statements to a PROC step;
		%macro count(type=, start=01jan2011, stop=31dec2011);
			proc freq data=orion.order_fact;
				where order_date between "&start"d and "&stop"d;
				table quantity;
				title1 "orders from &start to &stop";
				%if &type= %then %do;	
					title2 "For all Order Types";
				%end;
				%else %do;
					title2 "For Order Type &type Only";
					where same and order_type=&type;
				%end;
			run;
		%mend;
		
		options mprint mlogic;
		%count();
		%count(type=3);
		
		* Adding Complete Statements to a DATA Step;
		%macro cust(place);
			%let place=%upcase(&place);
			data customers;
				set orion.customer;
				%if &place=US %then %do;
				   where Country='US';
				   keep Customer_Name Customer_Address Country;
				%end;
				%else %do;
				   where Country ne 'US';
				   keep Customer_Name Customer_Address Country Location;
				   length location $ 12;
				   if      country="AU" then location='Australia';
				   else if country="CA" then location='Canada';
				   else if country="DE" then location='Germany';
				   else if country="IL" then location='Israel';
				   else if country="TR" then location='Turkey';
				   else if country="ZA" then location='South Africa';
				%end;
			run;
			
			title;
		%mend cust;
		options mprint mlogic;
		
		%cust(us);
		%cust(international);
		
		* Processing Partial Statements;
		%macro counts(rows);
			title "Customer Counts by Gender";
			proc freq data=orion.customer_dim;
				tables
				%if &rows ne %then &rows *;
					customer_gender;
			run;
		%mend;
		
		%counts(customer_age_group);
		%counts();
		
		* Practice: Level 1;
			%macro listing(custtype);
			    proc print data=orion.customer noobs;
			    	%if &custtype= %then %do;
			    		var customer_ID customer_name customer_type_ID;
						title "All Customers";
			    	%end;
			    	%else %do;
			    		where customer_type_ID=&custtype;
						var customer_ID customer_name;
						title "Customer Type: &custtype";
			    	%end;
			    run;
			%mend listing;
			
			%listing();
			%listing(2010);
			
		* Practice: Level 2;
			options mprint symbolgen;
			%macro day;
			    %if &sysday=Monday
			    %then %put Yes;
			    %else %put Sorry;
			%mend day;
			
			options nomlogic nosymbolgen;
			
			%day;
			
	* Using Conditional Processing to Validate Parameters;
		%macro customers(place);
			%let place =%upcase(&place);
			%if &place=AU or
				&place=CA or
				&place=DE or
				&place=IL or
				&place=TR or
				&place=US or
				&place=ZA %then %do;
				proc print data=orion.customer;
					var Customer_Name Customer_Address Country;
					where upcase(Country)="&place";
					title "Customer from &place";
				run;
			%end;
			%else %put Sorry, no customers from &place..;
		%mend;
		
		%macro customers(place) / minoperator;
			%let place =%upcase(&place);
			%if &place in AU CA DE IL TR US ZA %then %do;
				proc print data=orion.customer;
					var Customer_Name Customer_Address Country;
					where upcase(Country)="&place";
					title "Customer from &place";
				run;
			%end;
			%else %put Sorry, no customers from &place..;
		%mend;
		
		* Using Data-Driven Parameter Validation;
		options mprint mlogic symbolgen;

		%macro customers(place) / minoperator;
		   %let place=%upcase(&place);
		   proc sql noprint;
		      select distinct Country into :list separated by ' '
		         from orion.customer;
		   quit;
		   %if &place in &list %then %do;
		      proc print data=orion.customer;
		         var Customer_Name Customer_Address Country;
		         where upcase(country)="&place";
		         title "Customers from &place";
		      run;
		
		      title;
		   %end;
		   %else %do;
		      %put Sorry, no customers from &place..;
		      %put Valid countries are: &list..;
		   %end;
		   
		%mend customers;
		
		%customers(de);
		%customers(dk);		
		
		* Practice: Level 1;
			%macro custtype(type) / minoperator;
				%let type=%upcase(&type);
				%if &type in INTERNET GOLD %then %do;
					proc print data=orion.customer_dim;
						var customer_group customer_name customer_gender
						customer_age;
						where upcase(customer_group) contains "&type";
						title "&type Customers";
					run;
				%end;
				%else %do;
					%put ERROR: Missing Type.;
					%put ERROR: Valid TYPE values are INTERNET or GOLD.;
				%end;
			%mend custtype;
			
			%custtype(silver);
			%custtype(gold);
			%custtype(internet);
			
		* Practice: Level 2;
			%macro listing(custtype) / minoperator;
			   proc sql noprint;
			     select distinct Customer_Type_ID 
			     	into :IDlist separated by ' '
			     from orion.customer_type;
			   quit;
			
			   %if &custtype in &IDlist %then %do;
			        proc print data=orion.customer noobs;
			           var customer_ID customer_name customer_type_ID;
			           title "All Customers";
			        run;
			  %end;
			  %else %do;
			  	%put ERROR: Invalid CustType.; 
        		%put ERROR- Valid CustTypes: &IDlist..;
			  %end;
			%mend listing;
			
			%listing(1020);
			%listing();
			%listing(9999);
			
	* Processing Statements Iteratively;
		options mlogic mprint;
		
		%macro read(first=2007, last=2011);	
			%do year=&first %to &last;
				data orders&year;
					infile "&path/orders&year..dat";
					input Order_ID Order_Type Order_Date : date9.;
				run;
			%end;
		%mend;
		
		%read(first=2008,last=2010);
		
		* Generating Data-Driven Code Based on Parameter Values;
		options  nomlogic nosymbolgen mprint;

		%macro split (data=, var=);
		   proc sort data=&data(keep=&var) out=values nodupkey;
		      by &var;
		   run;
		   data _null_;
		      set values end=last;
		      call symputx('site'||left(_n_),&var);
		      if last then call symputx('count',_n_);
		   run;
		   %put _local_;
		   data
			   %do i=1 %to &count;
			      &&site&i
			   %end;
			   ;
			      set &data;
			      select(&var);
			   %do i=1 %to &count;
			      when("&&site&i") output &&site&i;
			   %end;
			      otherwise;
			      end;
		   run;
		%mend split;
		
		%split(data=orion.customer, var=Country);
		%split(data=orion.employee_payroll, var=Employee_Gender);
		
		* Practice: Level 1;
			options mprint spool;
			%macro sampleMacro;
				%do i=1 %to 3;
					proc means data=orion.order_fact sum mean maxdec=2;
					    where order_type = &i;
					    var total_retail_price costprice_per_unit;
					    title "Order Type: &i";
			      	run;
		     	%end;
		     	
		     	data _null_;
				   set orion.lookup_order_type;
				   call symputx('type',_n_);
				run;

		     %mend;
		     
		     %sampleMacro();

			