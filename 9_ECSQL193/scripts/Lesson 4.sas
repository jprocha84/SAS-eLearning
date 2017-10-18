/*
 * 	Lesson 4: Working with SQL Joins
 */
	
%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";
	
	* Working with Inner Joins;
		proc sql;
			title "Australian Employee's Birth Months";
			select p.employee_id 'ID',
				   Employee_name as Name format=$25.,
				   City format=$25.,
				   month(Birth_date) 'Birth Month' format=3.
			from orion.employee_payroll as p,
				 orion.employee_addresses as a
			where p.employee_id = a.employee_id
				  and Country='AU'
			order by 4, city, employee_name;
		quit;
		
		* Practice: Level 1;
			proc sql;
				title "Employees with More Than 30 Years of Service";
				title2 "As of February 1, 2013";
				select employee_name 'Employee Name',
					   int(('1FEB2013'd-employee_hire_date)/365.25) 'Years of Service' as yos
				from orion.employee_addresses as a inner join
					 orion.employee_payroll as p on a.employee_id=p.employee_id
				where calculated yos > 30
				order by employee_name;
			quit;
			title;
			
		* Practice: Level 2;
			proc sql;
				title 'Total Quantities Sold by Product ID and Name';
				select p.product_id,
					   p.product_name,
					   sum(quantity) as total_sold
				from orion.product_dim as p inner join 
					 orion.order_fact as o on p.product_id = o.product_id
				where o.order_date >='01Jan2010'd
				group by p.product_id, p.product_name
				order by total_sold desc, product_name;
			quit;
			title;
			
		* Practice: Challenge;
			proc sql;
				title "US and Australian Internet Customers";
				title2 "Purchasing Foreign-Manufactured Products";
				select customer_name 'Name',
					   count(*) 'Purchases' as count
				from orion.product_dim as p,
					 orion.order_fact as o,
					 orion.customer as c
				where p.product_id = o.product_id and
					  o.customer_id = c.customer_id and
					  employee_id = 99999999 and
					  p.supplier_country <> c.country and
					  c.country in ('AU','US')
				group by customer_name
				order by count desc, customer_name;
			quit;
			title;
	
	* Working with Outer Joins;
		proc sql;
		select p.Employee_ID, Recipients
		   from orion.employee_payroll as p
		        left join
		        orion.employee_donations as d
		   on p.Employee_ID=d.Employee_ID;
		quit;
		
		proc sql;
		select p.Employee_ID, Recipients
		   from orion.employee_payroll as p
		        left join
		        orion.employee_donations as d
		   on p.Employee_ID=d.Employee_ID
		   where Marital_Status="M";
		quit;
		
		proc sql;
			select coalesce(c.ID, t.ID)	 as ID,
				   Name,
				   Action,
				   Amount
			from orion.customers c
				 full join transactions t on c.ID = t.ID
			order by ID;
		quit;
		
		* Practice: Level 1;
			proc sql;
			select Employee_Name 'Name' format=$35., 
			       City, Job_Title
			   from orion.employee_addresses as a
			        left join 
			        orion.sales as s
			        on a.Employee_ID=s.Employee_ID
			   order by City, Job_Title, Employee_Name;
			quit;
			
		* Practice: Level 2;
			proc sql;
				title 'Products That Have Not Been Sold';
				select Product_Name,
				          p.Product_ID,
				          Quantity
				   from orion.product_dim as p
				           left join
				           orion.order_fact as o
				           on p.Product_ID=o.Product_ID
				   where Order_ID is missing;
				quit;
			quit;
			
	* Working with Complex SQL Joins;
		proc sql;
			select e.employee_id 'Employee ID',
				   e.employee_name 'Employee Name',
				   m.employee_ID 'Manager ID',
				   m.employee_name 'Manager Name',
				   e.country
			from orion.employee_addresses as e,
				 orion.employee_addresses as m,
				 orion.employee_organization as o
			where e.employee_ID=o.employee_ID and
				  o.employee_Id=m.employee_Id and
				  department contains 'Sales';
		quit;
		
		* Practice: Level 1;
			proc sql;
				select ea.employee_Id 'Employee ID',
					   ea.employee_name,
					   s.job_title,
					   ma.employee_id 'Manager ID',
					   ma.employee_name 'Manager Name'
				from orion.employee_addresses as ea,
					 orion.employee_addresses as ma,
				     orion.staff as s
				where ea.employee_id=s.employee_id and
					  s.manager_id=ma.employee_id and
					  (s.job_title contains 'Temp' or s.job_title contains 'Trainee' )
				order by ea.employee_Id;
			quit;
		
		* Practice: Level 2;
			proc sql;
				select ea.employee_name, 
					   int(('01Feb2013'd-p.employee_hire_date)/365.25) 'Years of Service' as years_service,
					   ma.employee_name as manager_name
				from orion.employee_addresses as ea,
					 orion.employee_addresses as ma,
					 orion.employee_organization as o,
					 orion.employee_payroll p
				where calculated years_service > 30 and
					  ea.employee_id=o.employee_id and
					  ea.employee_id=p.employee_id and
					  o.manager_id=ma.employee_id
				order by manager_name, years_service desc, ea.employee_name;
			quit;