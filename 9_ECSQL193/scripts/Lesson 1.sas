/*
 * 	Lesson 1: Getting Started with the SQL Procedure
 */
	
%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";

	* Understanding PROC SQL Syntax;
		proc sql;
			validate
			select job_title,
				   avg(Salary) as MeanSalary
			from orion.staff
			group by job_title
			having avg(salary) > 
					(select avg(Salary)
				     from orion.staff);
		quit;
		
		proc sql;
			*validate;
			select Employee_ID, Employee_Gender,
			       Salary
			   from orion.employee_information
			   where Employee_Gender='M'
			   order by Employee_ID;
		quit;
		
		proc sql noexec;	
			select Employee_ID, Employee_Gender,
			       Salary
			   from orion.employee_information
			   where Employee_Gender='M'
			   order by Employee_ID;
		quit;
		
		proc sql noexec;
			select *
			   from orion.order_fact;
			reset exec;
			select Employee_ID, Employee_Gender,
			       Salary
			   from orion.employee_information
			   where Employee_Gender='M'
			   order by Employee_ID;
		quit;