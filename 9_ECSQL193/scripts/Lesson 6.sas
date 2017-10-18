/*
 * 	Lesson 6: Working with Set Operators
 */

%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/9 - ECSQL193/data;
libname orion "&path";

	* Using the INTERSECT Operator;
		proc sql;
			title "Who on Bob's Team Has Not";
			title2 'Started Any Training';
			select ID, Name
				from orion.team
			except
				(select ID, Name
				 from orion.train_a
				 union 
				 select ID, Name
				 from orion.train_b);
		quit;
		
		* Practice: Level 1;
			proc sql;
				title 'Customers Who Placed Orders';
				select Customer_ID
				   from orion.order_fact
				intersect
				select Customer_ID
				   from orion.customer;
			quit;
			title;
			
		* Practice: Level 2;
			proc sql;
				select count(*) label='No. Customers w/ Orders'
				   from (select Customer_ID
				            from orion.order_fact
				         intersect
				         select Customer_ID
				            from orion.customer);
			quit;
			title;
			
		* Practice: Challenge;
			proc sql;
				title 'Name of Customers Who Placed Orders';
				select Customer_ID, Customer_Name
				   from orion.customer
				   where Customer_ID in
				      (select Customer_ID
				          from orion.order_fact
				       intersect
				       select Customer_ID
				          from orion.customer);
			quit;
			title;