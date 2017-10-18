/*
 * 	Lesson 3: Displaying Query Results
 */
	
%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";
 
	* Presenting Data;
		proc sql;
			select employee_id, qtr1
			from orion.employee_donations
			where paid_by="Cash or Check"
			order by qtr1 desc;
		quit;
		
		proc sql;
			select employee_id 'Employee ID',
				   max(Qtr1,Qtr2,Qtr3,Qtr4) label='Maximum' format=dollar5.
			from orion.employee_donations
			where Paid_by="Cash or Check"
			order by 2 desc, employee_id;
		quit;
		
		proc sql;
		title 'Maximum Quarterly Donation';
		select Employee_ID 'Employee ID', 
		       'Maximum Donation is:',
		       max(Qtr1,Qtr2,Qtr3,Qtr4)
		          label='Maximum' format=dollar5.
		   from orion.employee_donations
		   where Paid_By="Cash or Check"
		   order by 3 desc, Employee_ID;
		quit;
		title; 
		
		
		proc sql number;
		title 'Maximum Quarterly Donation';
		select Employee_ID 'Employee ID', 
		       'Maximum Donation is:',
		       max(Qtr1,Qtr2,Qtr3,Qtr4)
		          label='Maximum' format=dollar5.
		   from orion.employee_donations
		   where Paid_By="Cash or Check"
		   order by 3 desc, Employee_ID;
		quit; 
		title;
		
		* Practice: Level 1;
			proc sql;
			title 'Single Male Employee Salaries';
			select Employee_ID 'Employee ID', 
			       Salary 'Annual Salary' format=comma10.2, 
			       Salary/3 as Tax 'Federal Tax Withdrawn' format=comma10.2
			   from orion.employee_payroll
			   where Marital_Status="S"
			         and Employee_Gender ="M" 
			         and Employee_Term_Date is missing
			   order by Salary desc;
			quit;
		
		* Practice: Level 2;
			proc sql;
				title "Autralian Clothing Products";
				select supplier_name format=$18. 'Supplier',
					   product_group format=$12. 'Group',
					   product_name format=$30. 'Product'
				from orion.product_dim
				where Product_Category="Clothes" and Supplier_Country="AU"
				order by Product_Name;
			quit;
			title;
			
		* Practice: Challenge;
			proc sql;
				select Customer_id 'Customer ID' format=z7.,
					   catx(', ',Customer_LastName,Customer_FirstName) 'Last Name, First Name' format=$20. as Name, 
					   Gender,
					   int(('02feb2013'd-Birth_Date)/365.25) as Age
				from orion.customer
				where Country="US" and 
					calculated Age > 50
				order by calculated Age desc, Name;
			quit;
			
			* Suggested Solution;
				proc sql; 
				title "US Customers >50 Years Old as of 02FEB2013";
				select Customer_ID format=z7. 'Customer ID',
				       catx(', ',Customer_LastName,Customer_FirstName)
				            format=$20. 'Last Name, First Name' as Name, 
				       Gender 'Gender',
				       int(('02feb2013'd-Birth_Date)/365.25) as Age
				   from orion.customer
				   where Country="US" and
				         calculated Age>50
				   order by Age desc, Name;
				quit;
				title;
				
	* Producing Summary Statistics;
		proc sql;	
			select count(employee_term_date) as former_employees
			from orion.employee_information;
		quit;
		
		* Practice: Level 1;
			proc sql;
				select sum(dependents) as Total_Dependents
				from orion.employee_payroll
				where employee_term_date is missing;
			quit;
			
			proc sql;
				select count(*) 'Employee with Dependents'
				from orion.employee_payroll
				where dependents > 0 and employee_term_date is missing;
			quit;
			
	* Calculating Summary Statistics for Groups of Data;
		proc sql ;
			title "Males Employee Salaries";
			select Employee_ID, Salary format=comma12.,
				   Salary/sum(Salary)
				   'PC of Total' format=percent7.2
			from orion.employee_payroll
			where employee_gender='M'
				  and employee_term_date is missing
			order by 3 desc;
		quit;
		title;
		
		proc sql;
			title "Average Salary by Gender and Marital Status";
			select employee_gender as gender,
				   marital_status as M_status,
				   avg(Salary) as Average
			from orion.employee_payroll
			where employee_term_date is missing
			group by employee_gender, marital_status;
		quit;
				
		proc sql;
			select department,
				   sum(find(Job_Title,"manager","i")>0) as Manager,
				   sum(find(Job_Title,"manager","i")=0) as Employee
			from orion.employee_information
			group by department;
		quit;
		
		proc sql;
			select department,
				   sum(find(Job_Title,"manager","i")>0) as Managers,
				   sum(find(Job_Title,"manager","i")=0) as Employees,
				   calculated Managers/calculated Employeess 'M/E Ratio' format=percent8.1
			from orion.employee_information
			group by department;
		quit;
		
		* Practice: Level 1;
			proc sql;
				title "Cities where Employees Live";
				select city, count(*)
				from orion.employee_addresses
				group by city;
			quit;
			title;
			
			proc sql;
				title "Age at Employment";
				select employee_id 'Employee ID', 
					   birth_date  format=MMDDYY10. 'Birth Date', 
					   employee_hire_date format=MMDDYY10. 'Hire Date',
					   int((Employee_Hire_Date-Birth_Date)/365.25) as age 'Age'
				from orion.employee_payroll;
			quit;
			
		* Practice: Level 2;
			proc sql;
			title "Customer Demographics: Gender by Country";
			select Country, Count(*) as Customers,
			       sum(Gender="M") as Men,
			       sum(Gender="F") as Women,
			       calculated Men/calculated Customers 'Percent Male' 
			          format=percent6.1
			   from orion.customer
			   group by Country
			   order by 5;
			quit;
			title;
			
			proc sql;
			title "Countries with More Female than Male Customers";
			select Country 'Country',
			       sum(Gender="M") as M "Male Customers",
			       sum(Gender="F") as F "Female Customers"
			   from orion.customer
			   group by Country
			   having F > M
			   order by F desc;
			quit;
			title;
			
		* Practice: Challenge;
			proc sql;
			title "Countries and Cities Where Employees Live";
			select upcase(Country) 'Country', 
			       propcase(City) 'City',
			       count(*) 'Employees'
			   from orion.employee_addresses
			   group by 1,2
			   order by 1,2;
			quit;
			title;
			
		