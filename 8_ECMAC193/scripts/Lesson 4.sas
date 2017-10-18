/*
 * 	Lesson 4: Creating and Using Macro Programs
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/data;
	libname orion "&path";
	
	* Basic Concepts;
		options mcompilenote=all;
		%macro prtlast;
			proc print data=&syslast (obs=10);
				title "Listing of &syslast data set";
			run;
		%mend;
		
		%macro puttime;
			%put The current time is %sysfunc(time(),timeampm.);
		%mend;
		
		proc catalog cat=work.sasmac1;
			contents;
		run;
		
		* Calling a Macro;
		%puttime;
		
		options mcompilenote=all;
		%macro prtlast;
			proc print data=&syslast (obs=10);
				title "Listing of &syslast data set";
			run;
		%mend;
		data work.customers;
			set orion.customer;
			keep Customer_ID Country Customer_Name;
		run;
		%prtlast;
		
		proc sort data=work.customers out=work.sort_customers;
			by Country;
		run;
		%prtlast;
		
		* Understanding Macro Execution;
		
	* Using Macri Variables;
		* Using Position Parameters;
		options mcompilenote=all;
		
		%macro count(opts, start, stop);
			proc freq data=orion.orders;
				where Order_Date between "&start"d and "&stop"d;
				table Order_Type / &opts;
				title1 "Orders from &start to &stop";
			run;
		%mend;
		
		options mprint;
		%count(nocum, 01jan11, 31dec11);
		%count(, 01jul11, 31dec11);
		
		* Using Keyword Parameters;
		%macro prtlast(dsn=orion.city, vars=City_Name Country);
			proc print data=&dsn;
				var &vars;
			run;
		%mend;
		
		%prtlast()
		%prtlast(dsn=work.city, vars=City_Name)
		
		%macro count(opts=, start=01jan11, stop=31dec11);
			proc freq data=orion.orders;
				where order_date between "&start"d and "&stop"d;
				table order_type / &opts;
				title1 "Orders from &start to &stop";
			run;
		%mend;
		
		options mprint;
		%count();
		%count(opts=nocum);
		%count(stop=01jul11, opts=nocum nopercent);
		
		* Mixed Parameter list;
		%macro prtlast(dsn, vars=City_Name Country);
			proc print data=&dsn;
				var &vars;
			run;
		%mend;
		
		%prtlast(orion.city);
		
		%macro count(opts, start=01jan11, stop=31dec11);
			proc freq data=orion.orders;
				where order_date between "&start"d and "&stop"d;
				table order_type / &opts;
				title1 "Orders from &start to &stop";
			run;
		%mend;
		
		options mprint;
		%count();
		%count(nocum);
		%count(stop=30jun11, start=01apr11);
		%count(nocum nopercent, stop=30jun11);
		
		* Practice: Level 1;
			options mprint;
			%macro customers(type); 
				title "&type Customers"; 
				proc print data=orion.customer_dim; 
				   var Customer_Name Customer_Gender Customer_Age; 
				   where Customer_Group contains "&type"; 
				run; 
				title;
			%mend customers;
			
			%customers(Gold)
			%customers(Catalog)
			
			%macro customers(type=Club); 
				title "&type Customers"; 
				proc print data=orion.customer_dim; 
				   var Customer_Name Customer_Gender Customer_Age; 
				   where Customer_Group contains "&type"; 
				run; 
				title;
			%mend customers;
			
			%customers(type=Internet);
			%customers();
			
		* Practice: Level 2;
			options nolabel; 
			title 'Order Stats'; 
			proc means data=orion.order_fact maxdec=2 mean; 
			   var total_retail_price; 
			   class order_type; 
			run; 
			title;
			
			%macro orderstats(statistics=mean, decplaces=2,analysisvars=Total_retail_price,classvars=order_type);
				options nolabel; 
				title 'Order Stats'; 
				proc means data=orion.order_fact maxdec=&decplaces &statistics; 
				   var &analysisvars; 
				   class &classvars; 
				run; 
				title;
			%mend;
			
			%orderstats();
			%orderstats(statistics=min mean max,decplaces=0,classvars=quantity,analysisvars=costprice_per_unit);
			%orderstats(statistics=min mean max,decplaces=0);