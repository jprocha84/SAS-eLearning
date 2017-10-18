/*
	Lesson 2: Controlling I/O Processing and Memory
*/
	/* Reducing the Amount of Data That Is Processed */

		* Practice - Level 1;
			sasfile orion.employeepayroll load;
			proc freq data=orion.customerdim;
			   tables CustomerType;
			run;
			
			proc freq data=orion.orderfact;
			   tables OrderType;
			run;
			
			proc freq data=orion.productdim;
			   tables ProductCategory;
			run;
			
			proc freq data=orion.employeepayroll;
			   tables EmployeeGender;
			run;
			
			proc means data=orion.employeepayroll;
			   class EmployeeGender;
			   var Salary;
			run;
			
			proc means data=orion.orderfact;
			   class OrderType;
			   var TotalRetailPrice;
			run;
			
			proc means data=orion.employeepayroll;
			   class Dependents;
			   var Salary; 
			run;
			
			proc sort data=orion.employeepayroll 
				out= newpayroll;
			   by descending Salary;
			run;
			sasfile orion.employeepayroll close;
			
		* Practice - Level 2;
			options fullstimer;	
			sasfile orion.employeeaddresses load;
			sasfile orion.employeedonations load;
			proc sql;
			   select EmployeeName,
			          sum(Qtr1, Qtr2, Qtr3, Qtr4) as TotalContribution,
			          Recipients
			      from orion.employeeaddresses as a,
			           orion.employeedonations as d
			         where a.EmployeeID=d.EmployeeID;
			quit;
			sasfile orion.employeeaddresses close;
			sasfile orion.employeedonations close;
			options nofullstimer;  
		
		* Practice - Challenge;
			data salescopy;
			   set orion.sales;
			run;
			sasfile salescopy load;
			data nonsalescopy;
			   set orion.nonsales;
			run; 
			proc append base=salescopy data=nonsalescopy(rename=(First=FirstName Last=LastName )) force;
			run;
			proc print data=salescopy (firstobs=164 obs=168) ;
				var EmployeeID FirstName LastName JobTitle;
				title "work.salescopy";
				title2 "Observations 164-168";
			run;
			sasfile salescopy close;
		
	/* Reducing the Length of Numeric Variables */
			proc sort data=orion.employeephones out=employeephones_sort;
				by EmployeeID;
			run;
			proc sort data=orion.employeeaddresses out=employeeaddresses_sort;
				by EmployeeID;
			run;
			data emps;
				merge employeeaddresses_sort
					  orion.employeeorganization
					  orion.employeepayroll
					  employeephones_sort;
				by EmployeeID;
			run;
			data empsshortlength;
				length StreetID 6
					   EmployeeID ManagerID
					   StreetNumber EmployeeHireDate
					   EmployeeTermDate BirthDate 4
					   Dependents 3;
				merge employeeaddresses_sort
					  orion.employeeorganization
					  orion.employeepayroll
					  employeephones_sort;
				by EmployeeID;
			run;
			data empsshortlength2;
				merge employeeaddresses_sort
					  orion.employeeorganization
					  orion.employeepayroll
					  employeephones_sort;
				by EmployeeID;
				length StreetID 6
					   EmployeeID ManagerID
					   StreetNumber EmployeeHireDate
					   EmployeeTermDate BirthDate 4
					   Dependents 3;
			run;
			proc compare data=emps compare=empsshortlength2;
			run;
	
		* Activity;
			data test; 
			   length x 4; 
			   x=1/10; 
			   y=1/10; 
			   put x=; 
			   put y=; 
			run; 
			
			data _null_; 
			   set test; 
			   put x=; 
			   put y=; 
			run;
			
		* Practice - Level 1;
			proc contents data=orion.internet;
			run;
			proc contents data=orion.retail;
			run;
			proc contents data=orion.catalog;
			run;
			
			data allcustomers;
			   set orion.catalog orion.internet orion.retail;
			run;
			
			data allcustomers_shortlenght;
			   length Quantity 3
			   		  CustomerID OrderDate DeliveryDate 4
			   		  EmployeeID 5
			   		  StreetID OrderID 6
			   		  ProductID 7;
			   set orion.catalog orion.internet orion.retail;
			run;
			proc contents data=allcustomers_shortlenght;
			   title 'allcustomers Contents';
			run;
			title;
			
		* Practice - Level 2;
			data five;
			   length Num5 5 Num8 8;
			   do Num8=1e10 to 1e13 by 1e11;
			      Num5=Num8;
			   output;
			   end;
			run;
			
			proc print data=five;
			   title 'Reducing the Length of Numeric Data to 5';
			   format Num5 Num8 20.;
			run; 
			title;
	/* Compressing Data Files */
		