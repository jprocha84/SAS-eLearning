/*
 * 	Lesson 2: Writing Basic Queries
 */
	
%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";

	* Specifying Columns Directly from a Table;
		proc sql feedback;
			select *
				from orion.employee_information;
			select *
				from orion.staff;
		quit;
		
		proc sql;
			describe table orion.employee_information;
		quit;
		
		* Practice: Level 1;
			proc sql feedback;
				describe table orion.staff;
				select *
				   from orion.staff;
			quit;
		
		proc sql;
			select employee_id, employee_gender, salary
			from orion.employee_information;
		quit;
		
		* Practice: Level 1;
			proc sql;
				select Employee_ID, Employee_Gender, Marital_Status, Salary
				from orion.employee_payroll;
			quit;
	
	* Specifying Calculated and Conditional Columns;
	
		proc sql;
			select employee_id, salary , salary * .10
			from orion.employee_information;
		quit;
		
		proc sql;
			select employee_id, salary , salary * .10 as Bonus
			from orion.employee_information;
		quit;
		
		* Similar to do Select from DUAL in Oracle;
		proc sql inobs=1;
			select scan("Secretary I",-1,' ') as animal from dictionary.members where libname = 'WORK';
		quit;
		
		proc sql;
			select job_title, salary,
				case 
					when scan(job_title,-1,' ')='I'
						then salary*.05
					when scan(job_title,-1,' ')='II'
						then salary*.07
					when scan(job_title,-1,' ')='III'
						then salary*.10
					when scan(job_title,-1,' ')='IV'
						then salary*0.12
					else Salary*.08
				end as Bonus
			from orion.employee_information;
		quit;
		proc sql;
			select job_title, salary,
				case scan(job_title,-1,' ')
					when 'I' then salary*.05
					when 'II' then salary*.07
					when 'III' then salary*.10
					when 'IV' then salary*.12
					else Salary*.08
				end as Bonus
			from orion.employee_information;
		quit;
		
		* Calculating Columns Using SAS Dates;
		proc sql;
			select employee_id, employee_gender,
				   int((today()-birth_date)/365.25) as Age
			from orion.employee_information;
		quit;
		
		
		proc sql;
			create table work.birth_months as
			select employee_id, birth_date,
				   month(birth_date) as birth_month,
				   employee_gender
			from orion.employee_information;
			describe table work.birth_months;
			select * from work.birth_months;
		quit;
	
		* Practice: Level 1;
			proc sql;
				select employee_id, employee_gender, marital_status, salary, 
					   (Salary/3) as tax
				from orion.employee_payroll;
			quit;
		* Practice: Level 2;
			proc sql;
				create table work.bonus as
				select employee_id, salary, (salary*.04) as bonus
				from orion.employee_payroll;
				
				select * from work.bonus;
			quit;
		
		* Practice: Challenge;
			proc sql;
				select employee_id, 
					   (case scan(job_title,-1,' ') 
					   		when 'President' then 'Executive'
					   		when 'Officer' then 'Executive'
					   		else scan(job_title,-1,' ') end) as level,
					   salary,
					   (case scan(job_title,-1,' ') 
					   		when 'Manager' then (case 
					   							  when Salary<52000 then 'Low'
					   							  when Salary>72000 then 'High'
					   							  else 'Medium' end)
					   		when 'Director' then (case 
					   							  when Salary<108000 then 'Low'
					   							  when Salary> 135000 then 'High'
					   							  else 'Medium' end)
					   		when 'President' then (case 
					   							   when Salary< 240000 then 'Low'
					   							   when Salary> 300000 then 'High'
					   							   else 'Medium' end)
							when 'Officer' then (case 
					   							   when Salary< 240000 then 'Low'
					   							   when Salary> 300000 then 'High'
					   							   else 'Medium' end)
   						end) as  salary_range
				from orion.staff
				where scan(job_title,-1,' ') in('Manager','Director','Officer','President')
				order by level, Salary desc;
			quit;
			
			* Suggested Solution;
			proc sql;
				select Employee_ID,
				       case (scan(Job_Title,-1," "))
				          when "Manager" then "Manager"
				          when "Director" then "Director"
				          when "Officer" then "Executive"
				          when "President" then "Executive"
				          else "N/A"
				       end as Level,
					   Salary,
				       case (calculated Level)
				          when "Manager" then 
				             case 
				                when  (Salary>72000) then "High"
				                when  (Salary>52000) then "Medium"
				                else "Low"
				             end
				          when "Director" then
				             case 
				                when  (Salary>135000) then "High"
				                when  (Salary>108000) then "Medium"
				                else "Low"
				             end
				          when "Executive" then
					          case 
				                when  (Salary>300000) then "High"
				                when  (Salary>240000) then "Medium"
				                else "Low"
				             end
				          else "N/A"
					  end as Salary_Range
				   from orion.staff
				   where calculated level ne "N/A" 
				   order by Level, Salary desc;
				quit;
	
	* Specifying Rows;
		proc sql;
			select distinct Job_title, department 
			from orion.employee_information;
		quit;
		
		* Using calculated SAS enhancement;
		proc sql;
			select employee_id, employee_gender, salary, salary*.10 as Bonus,
				calculated Bonus / 2 as Half 
			from orion.employee_information
			where calculated Bonus < 3000;
		quit;
		
		* Practice: Level 1;
			proc sql;
				select distinct city
				from orion.employee_addresses;
			quit;
			
		* Practice: Level 2;
			proc sql;
				select employee_id, recipients, sum(qtr1,qtr1,qtr3,qtr4) as total
				from orion.employee_donations
				where calculated total > 90;
			quit;
			
		* Practice: Challenge;
			proc sql;
				select employee_id, recipients
				from orion.employee_donations
				where recipients like ('%Inc._90_');
			quit;
			* Alternative solution;
			proc sql;
			select Employee_ID, Recipients
			   from orion.employee_donations
			   where Recipients like "% Inc. 90~%" ESCAPE "~";
			quit;
			