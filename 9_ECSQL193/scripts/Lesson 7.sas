/*
 * 	Lesson 7: Creating Tables and Views
 */

%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";

	* Creating Tables;
		proc sql;
			create table work.birthmonths as
			select Employee_Name as Name format=$25.,
			       City format=$25.,
			       month(Birth_Date) /* as BirthMonth
			          'Birth Month' */ format=3.
			   from orion.employee_payroll as p,
			        orion.employee_addresses as a
			   where p.Employee_ID=a.Employee_ID
			         and Employee_Term_Date is missing 
			   order by 3,City,Name;
		quit;
		
		proc sql;
			describe table work.birthmonths;
			select * from work.birthmonths;
		quit;