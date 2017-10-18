/*
 * 	Lesson 7: Creating User-Defined Functions and Formats
 */
	%let path=/data/sasdata/comn/non_protected/shr_data/tz72dl/2. Projects/3.3 - SAS/7 - ECPG393R/data; 
	libname orion "&path";
	
	* Creating User-Defined Functions;
		proc fcmp outlib=orion.functions.dev;
			function ReverseName(name $) $ 40;
				return(catx(' ',scan(name,2,','),scan(name,1,',')));
			endsub;
		quit;
		
		options cmplib=orion.functions;
		
		data work.emplist;
			set orion.employeeaddresses;
			FMLName=ReverseName(EmployeeName);
			keep EmployeeID EmployeeName FMLName;
		run;
		
		title 'Reverse Names Function in a Data Step';
		proc print data=work.emplist (obs=10);
		run;
		title;
		
		* Using Conditional Logic in a User-Defined Function;
		proc fcmp outlib=orion.functions.Marketing;
			function MKT(ID, Date, Type) $ 40;
				if '01Jan2014'd - Date > 90 then do;
					if Type=1 then return(catx(' - ', 
										  put(ID, z12.), 
										  'Mail In-Store Coupon'));
					else if Type=2 then return(catx(' - ', 
										  put(ID, z12.), 
										  'Send New Catalog'));
					else return(catx(' - ', 
							    put(ID, z12.),
							    'Send Email'));
				end;
				else return(catx(' - ', 
						    put(ID, z12.),
						    'Wait to Contact'));
			endsub;
		quit;
		options cmplib=orion.functions;
		data ordercomments;
			set orion.orderfact;
			MarketingComment=MKT(CustomerID,DeliveryDate,OrderType);
		run;
		title 'Partial ordercomments Data Set';
		proc print data=ordercomments(obs=5) noobs;
			var CustomerID DeliveryDate OrderType MarketingComment;
		run;
		title;
		
		* Practice;
			proc fcmp outlib=work.functions.marketing;
				function Refund(Quantity, TotalRetailPrice);
					if Quantity > 2 then return(Quantity * TotalRetailPrice * 0.10);
					else return(Quantity * TotalRetailPrice * 0.05);
				endsub;
			quit;
			
			options cmplib=work.functions;
		
			data refunds;
			   set orion.orderfact(keep=EmployeeID Quantity TotalRetailPrice);
			   *if Quantity > 2 then RefundAmt=Quantity * TotalRetailPrice * 0.10;
			   *else RefundAmt=Quantity * TotalRetailPrice * 0.05;
			   RefundAmt=Refund(Quantity, TotalRetailPrice);
			run;
			
			proc print data=refunds(obs=5) noobs;
			   title 'test Data Set';
			run;
			title;
	
	* Using Advanced Format Techniques;
		options cmplib=orion.functions;
		proc format fmtlib;
			value $FmtRevName (default=40)
				  ' '='Missing Name'
				  Other=[ReverseName()];
		run;
		
		title1 'Reverse Name Function';
		title2 'Applied Using Format Statement';
		
		proc print data=orion.employeeaddresses(obs=5) noobs;
			var EmployeeID EmployeeName City State PostalCode Country;
			format EmployeeName $FmtRevName.;
		run;
		title;
		
		* Using Formats to Define Functions;
		proc format;
		   value $postabb  '1000'-'1999', 
		                   '2000'-'2599', 
		                   '2619'-'2898', 
		                   '2921'-'2999'='NSW'
		                   '0200'-'0299', 
		                   '2600'-'2618', 
		                   '2900'-'2920'='ACT'
		                   '3000'-'3999', 
		                   '8000'-'8999'='VIC'
		                   '4000'-'4999', 
		                   '9000'-'9999'='QLD'
		                   '5000'-'5799', 
		                   '5800'-'5999'='SA'
		                   '6000'-'6797', 
		                   '6800'-'6999'='WA'
		                   '7000'-'7799', 
		                   '7800'-'7999'='TAS'
		                   '0800'-'0899', 
		                   '0900'-'0999'='NT';
		run;
		proc fcmp outlib=orion.functions.char;
		   function StateProv(Country $,Code $) $ 4;
		      if upcase(country) ='AU' then stpr=put(code,$postabb.);
		      else if upcase(country)='US' then stpr=zipstate(code);
		      else stpr=' ';
		      return(stpr);
		   endsub;
		quit;
		
		options cmplib=orion.functions;
		data addresses;
		   keep EmployeeID EmployeeName country PostalCode PC; 
		   set orion.employeeaddresses;
		   PC=StateProv(country,PostalCode);
		run;
		
		proc print data=addresses(obs=10);
		   var EmployeeID EmployeeName country PostalCode PC; 
		   title 'Employee Postal and State or Province Codes';
		run;
		title;
		
		* Grouping Data with the GROUPFORMAT Option;
		proc format;
		   value salgrp   low-<30000='Under $30,000'
		                30000-<35000='$30,000 to $35,000'
		                35000-<50000='$35,000 to $50,000'
		                  50000-high='Over $50,000';
		run;
		
		proc sort data=orion.employeepayroll 
		          out=sorted;
		   by Salary;
		run;
		
		data highlowsal;
		   set sorted;
		   by groupformat Salary;
		   format Salary salgrp.;
		   SalGroup=put(Salary,salgrp.);
		   if first.Salary or last.Salary; 
		run;
		
		title 'Lowest and Highest Salary by Salary Group';
		proc print data=highlowsal label;
		   id SalGroup;
		   by SalGroup notsorted;
		   var Salary EmployeeID;
		   format salary dollar9.;
		   label SalGroup='Salary Group';
		run;
		title;
		
		* Using Informats to Clean Data;
		proc format;
		   invalue $Gender (upcase) 'M'='Male'
		                            'F'='Female';
		   invalue quant 1-high=_same_ 
		                 other=_error_;
		   invalue eval 'Excellent'=4 'Good'=3
		                'Fair'=2 'Poor'=1;
		run;
		
		data newcustomers;
		   infile "&path/newcustomers.csv" dlm=',' dsd firstobs=2;
		   input CustomerID : 2. CustomerGender : $Gender. CustomerName : $30. 
		         Quantity : quant. TotalRetailPrice Rating : eval.;
		   if _n_ > 6 then _ERROR_=0;
		run;
		 
		proc print data=newcustomers(obs=5) noobs;
		  title 'Using the INVALUE Statement';
		run;
		
		title;
		
		* Practice: Level 1;
			proc fcmp outlib=orion.functions.DataType;
				function CustAge(BirthDay) $ 40;
					age = (today()-BirthDay)/365.25;
					if int(age)<30 then return("Under 30");
					else if int(age)<44 then return("30 to 44 years");
					else if int(age)<60 then return("44 to 60 years");
					else return("Over 60");
				endsub;
			quit;
			
			options cmplib=orion.functions;
			proc format fmtlib;
				value FmtCustAge (default=40)
					  0 = "Missing BirthDay"
					  other = [CustAge()];
			run;
			
			proc print data=orion.customerdim 
               noobs label; 
			   var CustomerID CustomerName 
			       CustomerBirthDate;
			   title 'Customer Age Group Information';
			   format CustomerBirthDate FmtCustAge.;
			   label CustomerID='Customer ID' 
			         CustomerName='Name'
			         CustomerBirthDate='Age Group';
			run;
			title;
			
			* Suggested Solution;
				proc fcmp outlib=orion.functions.DateType;
				   function CustAge(Date) $ 15;
				      age=int((today()-date)/365.25);
				      if age < 30 then return('Under 30');
					     else if age < 45 then return('30 to 44 years');
					     else if age < 60 then return('45 to 60 years');
					     else return('Over 60');
				   endsub;
				quit;
				options cmplib=orion.functions;
	
				proc format;
				   value custgroup other=[custage()];
				run;
				
				proc print data=orion.customerdim
				                (obs=5) noobs label; 
				   var CustomerID CustomerName 
				       CustomerBirthDate;
				   title 'Customer Age Group Information';
				   format CustomerBirthDate custgroup.;
				   label CustomerID='Customer ID' 
				         CustomerName='Customer Name'
				         CustomerBirthDate='Age Group';
				run;
				title;
				
		* Practice: Level 2;
			proc format fmtlib;
				invalue $Gender (upcase) 'M' = 'Male'
									 	 'F' = 'Female';
				invalue $Country (upcase) 'AU' = 'Australia'
										  'US' = 'United States';
			run;
		
			data sales_staff;
			   infile "&path/sales1.dat"; 
			   input @1 Employee_ID 6.
			         @40 Gender :$Gender.
			         @43 Job_Title $20.
			         @64 Salary Dollar8.
			         @73 Country :$Country.
			         @87 Hire_Date mmddyy10.;
			run;
			title 'Australian and US Sales Staff';
			proc print data=sales_staff noobs;
			run;
			title;
			