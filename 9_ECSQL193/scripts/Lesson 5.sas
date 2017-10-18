/*
 * 	Lesson 5: Working with Nested Queries
 */

%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";

	* Understanding Subqueries;
		proc sql;
			select avg(salary) as CompanyMeanSalary
			from orion.staff;
		quit;
		
		proc sql;
			select job_title,
				   avg(salary) as MeanSalary
			from orion.staff
			group by job_title
			having avg(salary) > (select avg(salary)
								  from orion.staff);
		quit;
	
		* Using a Subquery that returns multiple values;
		proc sql;
			select employee_name, city, country
			from orion.employee_addresses
			where employee_id in
						( select employee_id
						  from orion.employee_payroll
						  where month(Birth_date)=2)
			order by employee_name;
		quit;
		
		* Operators that accept multiple values;
		proc sql;
			title 'Level IV Sales Reps who earn less than';
			title2 'Any lower level sales sales Reps';
			select employee_id, salary
			from orion.staff
			where job_title='Sales Rep. IV'
				and Salary < any(select salary
					             from orion.staff
					             where job_title in ('Sales Rep. I','Sales Rep. II','Sales Rep. III'));
		quit;
		title;

		* Practice: Level 1;
			proc sql;
				select avg(total_retail_price) as MeanSales
				from orion.order_fact
				where order_type=1;
			quit;
			
			title "Customers Whose Average Retail Sales";
			title2 "Exceeds the Average Retail Sales";
			title3 "for All Retail Customers";
			proc sql;
				select customer_id,
					   avg(total_retail_price) as MeanSales format=10.2
				from orion.order_fact
				where order_type=1
				group by customer_id
				having MeanSales > (select avg(total_retail_price) as MeanSales
									from orion.order_fact
									where order_type=1);
			quit;
			title;
			
			
	* Understanding In-Line Views;
		proc sql;
			title 'Employees with Salaries less than';
			title2 '95 % of the Average for their Job';
			select Employee_Name, emp.Job_Title,
				   Salary format=comma7., Job_Avg format=comma7.
			from (select job_title,
						 avg(salary) as Job_Avg format=comma7.
				  from orion.employee_payroll as p,
				  	   orion.employee_organization as o
				  where p.employee_id=o.employee_id
				  	    and employee_term_date is missing
				  	    and department="Sales"
				  group by job_title) as Job,
				  orion.salesstaff as emp
			where emp.job_title=job.job_title and 
				  salary<job_avg*.95 and
				  emp_term_date is missing
			order by job_title, employee_name;
		quit;
		
		* Using an In-Line View and a Subquery;
			proc sql;
				select distinct employee_id
				from orion.order_fact as of,
					 orion.product_dim as p
				where of.product_id=p.product_id and
					  year(order_date)=2011 and
					  product_name contains 'Expedition Zero' and
					  employee_id ne 99999999;
			quit;
			
			proc sql;
				select manager_id
				from orion.employee_organization as o,
					 (
		   			    select distinct employee_id
						from orion.order_fact as of,
							 orion.product_dim as p
						where of.product_id=p.product_id and
							  year(order_date)=2011 and
							  product_name contains 'Expedition Zero' and
							  employee_id ne 99999999
					 ) as ID
				where o.employee_id=ID.employee_id;
			quit;
			
			proc sql;
				select employee_name format=$25. as Name,
					   city
				from orion.employee_addresses
				where employee_id in(
					select manager_id
					from orion.employee_organization as o,
						 (
			   			    select distinct employee_id
							from orion.order_fact as of,
								 orion.product_dim as p
							where of.product_id=p.product_id and
								  year(order_date)=2011 and
								  product_name contains 'Expedition Zero' and
								  employee_id ne 99999999
						 ) as ID
					where o.employee_id=ID.employee_id
				);
			quit;
			
		* Practice: Level 1;
		* Practice: Level 2;
		* Practice: Challenge;
			
		