/*
 * 	Lesson 6: More on Macro Programming
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/data;
	libname orion "&path";
	
	* Understanding Symbol Tables;
		%let dsn=orion.city;
		%macro printdsn;	
			%local dsn vars;
			%let dsn=work.city;
			%let vars=city_name country;
			%put The value of dsn inside Printdsn is &dsn;
			
			proc print data=&dsn;
				var &vars;
				title "Listing of &dsn data set";
			run;
		%mend;
		
		%printdsn;
		%put The value of dsn outside Printdsnis &dsn;
		
		
		%macro putloop;
			%local i;
			%do i=1 %to &numrows;
				%put Country&i is &&country&i;
			%end;
		%mend putloop;
		
		
		options mcompilenote=all;
		%macro numobs(lib,dsn);
		   options nonotes;
		   data _null_;
		      call symputx('num', number,'G');
		      stop;
		      set &lib..&dsn nobs=number;
		   run;
		   options notes;
		%mend numobs;	
		
		%macro check(month=,year=);
		   data internet;
		      keep Order_Date Order_Type Quantity Total_Retail_Price;
		      set orion.order_fact;
		      where Order_Type=3 and month(Order_Date)=&month
			and  year(Order_Date)=&year;
		   run;
		
		   %numobs(work,internet)
		   %if &num=0 %then %put No Internet orders this month.;
		   %else %do;
		      title1 "Internet Orders &month-&year";
		      %if &num>10
		         %then %do; title2 "First 10 of &num Orders"; %end;
		         %else %do; title2 "All &num Orders";         %end;
		      proc print data=internet(obs=10);
		         var Order_Date Quantity Total_Retail_Price;
		      run;
		   %end;
		   
		   title;
		%mend check;
		
		%check (month=11, year=2011);
		%check (month=12, year=2011);
		
		%symdel num;
		
		
		* Practice: Level 1;
			%let dog=Paisley;
			%macro whereisit;
			   %put My dog is &dog;
			%mend whereisit;
			
			%whereisit;
			
			%macro whereisit;
			   %let dog=Paisley;
			   %put My dog is &dog;
			%mend whereisit;
			
			%whereisit;
			
			%macro whereisit(dog);
			   %put My dog is &dog;
			%mend whereisit;
			
			%whereisit(Paisley);
			
		* Practice: Level 2;
			%macro varscope;
			   data _null_;
			      set orion.customer_type end=final;
			      call symputx('localtype'||left(_n_), Customer_Type,'L');
			      if final then call symputx('localn',_n_,'L');
			   run;
			   %put _user_;
			%mend varscope;

			%macro varscope;
			   %local x;
			   data _null_;
			      set orion.customer_type end=final;
			      call symputx('localtype'||left(_n_), Customer_Type,'G');
			      if final then call symputx('localn',_n_,'G');
			   run;
			   %put _user_;
			%mend varscope;
			
			%varscope