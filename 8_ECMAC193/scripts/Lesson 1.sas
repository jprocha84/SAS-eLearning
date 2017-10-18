/*
 * 	Lesson 1: Introducing Macro Variables
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/data;
	libname orion "&path";
	
	* Using Automatic Macro Variables;
		proc print data=orion.customer_type;
			footnote1 "Created &SYSTIME &SYSDAY, &SYSDATE9";
			footnote2 "on the &SYSSCP System using SAS &SYSVER";
		run;
		
		* Practice;
			proc print data=orion.customer_dim;
				footnote1 "Report Created on &SYSDATE9";
			run;
			
	*Creating User-Defined Macro Variables;
		%let year=2011;
		proc print data=orion.order_fact;
			where Year(Order_Date)=&year;
			title "Orders for &year";
		run;
		proc means data=orion.order_fact mean;
			where Year(Order_Date)=&year;
			class Order_Type;
			var Total_Retail_Price;
			title "Average Retail Price for &year";
			title2 "by Order_Type";
		run;
		
		* Practice: Level 1;
			%let location=ZA;
			title 'Customers in &location';
			proc print data=orion.customer;
			   var Customer_ID Customer_Name Gender; 
			   where Country="&location";
			run;
			
		* Practice: Level 2;
			%let minsal=100000;

			proc print data=orion.employee_payroll;
			   where Salary >= &minsal;
			   format Birth_Date date9.
			   		  Employee_Hire_Date date9.
			   		  Employee_Term_Date date9.
			   		  Salary dollar8.;
				title "Employee Earnings &minsal or More";
			run;
		
	* Displaying Macro Variables in the SAS Log;
		%put _all_;
		%put _user_;
		%put _global_;
		
		options symbolgen;
		
		* Practice;
			options symbolgen;
			%let type=Internet;
			proc print data=orion.customer_dim;
			   var Customer_Name Customer_Gender Customer_Age;
			   where Customer_Group contains "&type";
			   title "&type Customers";
			run;
			%put &type;
			
	* Processing Macro Variables;

	* Combining Macro Variable References with Text;
		* Practice: Level 1;
			%let month=JUL;
			%let year=2003;
			proc print data=orion.organization_dim;
			   where Employee_Hire_Date="01&month&year"d;
			   id Employee_ID;
			   var Employee_Name Employee_Country Employee_Hire_Date;
			   title "Personal Information for Employees Hired in &month &year";
			run;
		
		* Practice: Level 2;
			%let dsn=customer;
			%let var=Customer;
			proc print data=orion.&dsn._dim;
			   id &var._ID;
			   var &var._Name &var._Country &var._Gender;
			   title "Listing of All &var.s From orion.&dsn._dim";
			run;
