/*
 * 	Lesson 6: Combining Data Horizontally for Table Lookups
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/7 - ECPG393R/data; 
	libname orion "&path";
	
	/* Using DATA Step Merges and PROC SQL Joins for Table Lookups */
		proc sort data=orion.employeeaddresses
					  (keep=EmployeeID EmployeeName)
				  out=addresses;
			by EmployeeID;
		run;
		data temp1;
			keep EmployeeName EmployeeID ManagerID;
			merge orion.staff(in=S keep=EmployeeID ManagerID)
				  addresses(in=A);
			by EmployeeID;
			if S and A; /* Matches Only */
		run;
		proc sort data=temp1;E
			by ManagerID;
		run;
		data names;
			merge temp1(in=T)
				  addresses(rename=(EmployeeID=ManagerID
				  					EmployeeName=ManagerName) in=A);
			by ManagerID;
			if A and T;
		run;
		
		proc sql;
			create table namessql as
			select e.EmployeeID,
				   e.EmployeeName,
				   ManagerID,
				   m.EmployeeName as ManagerName
			from orion.staff,
				 orion.employeeaddresses as e,
				 orion.employeeaddresses as m
			where e.EmployeeID=staff.EmployeeID and
				  m.EmployeeID=staff.ManagerID
			order by ManagerID,
					 EmployeeID;
		quit;
		proc print data=namessql(obs=10) noobs;
			title 'Employee and Manager Names';
		run;
		title;
		
		* Practice: Level 1;
			proc sql;
				create table purchases as
				select cd.CustomerName,
					   pd.ProductName,
					   pd.SupplierName
				from orion.orderfact as of,
					 orion.customerdim as cd,
					 orion.productdim as pd
				where of.ProductID=pd.ProductID and
					  of.CustomerID=cd.CustomerID
				order by of.ProductID;
			quit;
			proc print data=purchases(obs=5) noobs;
				title 'Partial Purchases Data Set';
			run;
			title;
			
			* Suggested Solution;
				* DATA Step Merge Solution;
				proc sort data=orion.orderfact(keep=CustomerID ProductID)  
				          out=orderfact_sort;
				   by CustomerID;
				run;
				
				data temp;
				   merge orderfact_sort(in=O) 
				         orion.customerdim(keep=CustomerID CustomerName in=C);
				   by CustomerID;
				   if O and C;
				run;
				
				proc sort data=temp;
				   by ProductID;
				run;
				
				data purchases;
				   keep CustomerName ProductName SupplierName;
				   merge temp(in=T) 
				         orion.productdim(keep=ProductID ProductName SupplierName in=P);
				   by ProductID;
				   if P and T;
				run;
				
				* PROC SQL Solution;
				proc sql;
				   create table purchases as
				      select CustomerName, 
				             ProductName, 
				             SupplierName
				         from orion.orderfact as o, 
				              orion.productdim as p, 
				              orion.customerdim as c
				         where o.CustomerID=c.CustomerID and 
				               o.ProductID=p.ProductID
				         order by o.ProductID;
				quit;
				
				* DATA Step Merge Solution;
				proc print data=purchases(obs=5) noobs;
				   title 'Partial Purchases Data Set';
				run;
				title;
				
				* PROC SQL Solution;
				proc sql;
				   title 'Partial Purchases Data Set';
				   select *
				      from purchases(obs=5);
				quit;
				title;
				
		* Practice: Level 2;
			proc sql;
				create table nopurchases as
					select CustomerID,
						   CustomerName
					from orion.customerdim
					where CustomerID not in(
							select CustomerID
							from orion.orderfact);
			
				create table purchases as
					select cd.CustomerID,
						   cd.CustomerName,
						   of.ProductID,
						   of.OrderID,
						   of.Quantity,
						   of.TotalRetailPrice
					from orion.customerdim cd,
						 orion.orderfact of
					where of.CustomerID=cd.CustomerID
					order by of.ProductID;
				
				create table noproducts as 
					select ProductID,
						   ProductName,
						   SupplierName
					from orion.productdim
					where ProductID not in (
							select ProductID
							from orion.orderfact);
			quit;
			proc print data=noproducts(obs=5) noobs;
				title 'noproducts Data Set';
				var ProductID ProductName SupplierName;
			run;
			proc print data=purchases(obs=5) noobs;
				title 'Partial purchases Data Set';
				var CustomerID OrderID ProductID Quantity TotalRetailPrice CustomerName;
			run;
			proc print data=nopurchases(obs=5) noobs;
				title 'Partial nopurchases Data Set';
				var CustomerID CustomerName;
			run;
			title;
			
			* Suggested Solution;
				* DATA Step Merge Solution;
				proc sort data=orion.orderfact 
				          out=orderfact_sort;
				   by CustomerID;
				run;
				
				data temp 
				     nopurchases(keep=CustomerID CustomerName);
				   merge orderfact_sort(in=O)
				         orion.customerdim(keep=CustomerID CustomerName in=C);
				   by CustomerID;
				   if O and C then output temp;
				   else if C and not O then output nopurchases;
				run;
				
				proc sort data=temp;
				   by ProductID;
				run;
				
				data purchases(keep=CustomerID CustomerName ProductID OrderID Quantity TotalRetailPrice)
				     noproducts(keep=ProductID ProductName SupplierName);
				   merge temp(in=T)
				         orion.productdim(keep=ProductID ProductName SupplierName in=P);
				   by ProductID;
				   if P and T then output purchases;
				   else if P and not T then output noproducts;
				run;
				
				* PROC SQL Solution;
				proc sql;
				   create table nopurchases as
				      select CustomerID, CustomerName
				         from orion.customerdim
				         where customerdim.CustomerID not in
				            (select CustomerID from orion.orderfact);
				   create table noproducts as
				      select ProductID, ProductName, SupplierName
				         from orion.productdim
				         where productdim.ProductID not in
				            (select ProductID from orion.orderfact);
				   create table purchases as
				      select c.CustomerID, 
				             CustomerName,
				             o.ProductID,
				             OrderID,
				             Quantity,
				             TotalRetailPrice
				         from orion.orderfact as o,
				              orion.productdim as p,
				              orion.customerdim as c
				         where o.CustomerID=c.CustomerID and 
				               o.ProductID=p.ProductID
				         order by o.ProductID;
				quit;
				
				* PROC PRINT Solution;
				proc print data=noproducts(obs=5) noobs;
				   title 'Partial noproducts Data Set';
				run;
				
				proc print data=purchases(obs=5) noobs;
				   title 'Partial purchases Data Set';
				run;
				
				proc print data=nopurchases(obs=5) noobs;
				   title 'nopurchases Data Set';
				run;
				title;
				
				* PROC SQL Solution;
				proc sql;
				   title 'noproducts Data Set';
				   select *
				      from noproducts(obs=5);
				   title 'nopurchases Data Set';
				   select *
				      from nopurchases(obs=5);
				   title 'purchases Data Set';
				   select *
				      from purchases(obs=5);
				quit;
				title;
				
		* Practice: Challenge;	
			proc sql;
				create table managernames as 
					select od.employeeID,
						   managerlevel1,
						   managerlevel2,
						   managerlevel3,
						   managerlevel4,
						   managerlevel5,
						   managerlevel6,
						   m1.EmployeeName as Manager1Name,
						   m2.EmployeeName as Manager2Name,
						   m3.EmployeeName as Manager3Name,
						   m4.EmployeeName as Manager4Name,
						   m5.EmployeeName as Manager5Name,
						   m6.EmployeeName as Manager6Name
					from orion.organizationdim od
						left join orion.employeeaddresses m1
							on od.managerlevel1=m1.employeeID
						left join orion.employeeaddresses m2
							on od.managerlevel2=m2.employeeID
						left join orion.employeeaddresses m3
							on od.managerlevel3=m3.employeeID
						left join orion.employeeaddresses m4
							on od.managerlevel4=m4.employeeID
						left join orion.employeeaddresses m5
							on od.managerlevel5=m5.employeeID
						left join orion.employeeaddresses m6
							on od.managerlevel6=m6.employeeID
					order by od.employeeID;
			quit;
			proc print data=managernames (firstobs=420);
				title1 'Partial ManagerNames Data';
				title2 'FirstObs=420';
			run;
			
			* Suggested Solution;
			proc sort data=orion.employeeaddresses  
	         out=empaddresses(rename=(EmployeeID=ManagerLevel1 
                                   EmployeeName=Manager1Name));
			   by EmployeeID;
			run;
			
			proc sort data=orion.organizationdim 
			          out=man1(keep=EmployeeID ManagerLevel1-ManagerLevel6);
			   by ManagerLevel1;
			run;
			
			data manager1;
			   merge man1(in=M) 
			         empaddresses(keep=ManagerLevel1 Manager1Name);
			   by ManagerLevel1;
			   if M;
			run;
			
			proc sort data=manager1 out=man2;
			   by ManagerLevel2;
			run;
			
			data manager2;
			   merge man2(in=M) 
			         empaddresses(rename=(ManagerLevel1=ManagerLevel2
			                              Manager1Name=Manager2Name)
			                      keep=ManagerLevel1 Manager1Name);
			   by ManagerLevel2;
			   if M;
			run;
			
			proc sort data=manager2 out=man3;
			   by ManagerLevel3;
			run;
			
			data manager3;
			   merge man3(in=M) 
			         empaddresses(rename=(ManagerLevel1=ManagerLevel3
			                              Manager1Name=Manager3Name)
			                      keep=ManagerLevel1 Manager1Name);
			   by ManagerLevel3;
			   if M;
			run;
			
			proc sort data=manager3 out=man4;
			   by ManagerLevel4;
			run;
			
			data manager4;
			   merge man4(in=M) 
			         empaddresses(rename=(ManagerLevel1=ManagerLevel4
			                              Manager1Name=Manager4Name)
			                      keep=ManagerLevel1 Manager1Name);
			   by ManagerLevel4;
			   if M;
			run;
			
			proc sort data=manager4 out=man5;
			   by ManagerLevel5;
			run;
			
			data manager5;
			   merge man5(in=M) 
			         empaddresses(rename=(ManagerLevel1=ManagerLevel5
			                              Manager1Name=Manager5Name)
			                      keep=ManagerLevel1 Manager1Name);
			   by ManagerLevel5;
			   if M;
			run;
			
			proc sort data=manager5 out=man6;
			   by ManagerLevel6;
			run;
			
			data managernames;
			   merge man6(in=M) 
			         empaddresses(rename=(ManagerLevel1=ManagerLevel6
			                              Manager1Name=Manager6Name)
			                      keep=ManagerLevel1 Manager1Name);
			   by ManagerLevel6;
			   if M;
			run;
			
			proc sort data=managernames;
			   by EmployeeID;
			run;
			
			proc print data=managernames
			          (firstobs=420 obs=424);
			   title 'Partial ManagerNames Data';
			   title2 'FirstObs=420';
			run;
			title;