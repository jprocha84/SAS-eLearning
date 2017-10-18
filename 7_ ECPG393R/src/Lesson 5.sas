/*
	Lesson 5: Using DATA Step Hash and Hiter Objects for Table Lookups
*/
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/7 - ECPG393R/data; 
	libname orion "&path";
	
	/* Using Hash Object Methods to Define a Hash Object */
		data newcountry;
			length ContinentName $ 30;
			if _N_=1 then 
				do;
					call missing(ContinentName);
					declare hash ContName();
					ContName.definekey('ContinentID');
					ContName.definedata('ContinentName');
					ContName.definedone();
					ContName.add(key:91, data:'North America');
					ContName.add(key:93, data:'Europe');
					ContName.add(key:94, data:'Africa');
					ContName.add(key:95, data:'Asia');
					ContName.add(key:96, data:'Australia/Pacific');
				end;
			set orion.country(keep=ContinentID Country CountryName);
			rc=ContName.find(key:ContinentID);
		run;
		proc print data=work.newcountry;
		run;
		
		* Practice;
			data descriptions;
				drop rc;
				length SaleType $ 30;
				if _N_=1 then
					do;
						call missing(SaleType);
						declare hash slType();
						slType.definekey('OrderType');
						slType.definedata('SaleType');
						slType.definedone();
						slType.add(key:1, data:'Retail Sale');
						slType.add(key:2, data:'Catalog Sale');
						slType.add(key:3, data:'Internet Sale');
					end;
				set orion.orders(keep=OrderID OrderType);
				rc=slType.find(key:OrderType);
				if rc=0;
			run;
			proc print data=descriptions(obs=5) noobs;
				title 'descriptions';
			run;
			title;
			
			* Suggested Solution;
				data descriptions;
				   length SaleType $40;
				   keep OrderID OrderType SaleType;
				   if _N_=1 then 
				      do;
				         declare hash Product();
				         Product.definekey('OrderType');
				         Product.definedata('SaleType');
				         Product.definedone();
				         Product.add(key:1, data:'Retail Sale');
				         Product.add(key:2, data:'Catalog Sale');
				         Product.add(key:3, data:'Internet Sale');
				         call missing(SaleType);
				      end;
				   set orion.orders;
				   rc=Product.find();
				   if rc=0; 
				run;      
				proc print data=descriptions(obs=5) noobs;
				   title 'descriptions Data Set';
				run;   
				title; 
	
	/* Loading a Hash Object with Data from a SAS Data Set */
		data newcountry;
			drop rc;
			length ContinentName $ 30;
			if _N_=1 then
				do;
					call missing(ContinentName);
					declare hash ContName(dataset:'orion.continent');
					ContName.definekey('ContinentID');
					ContName.definedata('ContinentName');
					ContName.definedone();					
				end;
			set orion.country(keep=ContinentID Country CountryName);
			rc=ContName.find(key:ContinentID);
			if rc=0;
		run;
		proc print data=newcountry;
		run;
		
		* Defining PDV variables;
		data newcountry;
			if 0 then set orion.continent(keep=ContinentName);
			if _N_=1 then
				do;
					declare hash ContName(dataset:'orion.continent');
					ContName.definekey('ContinentID');
					ContName.definedata('ContinentName');
					ContName.definedone();					
				end;
			set orion.country(keep=ContinentID Country CountryName);
			if ContName.find(key:ContinentID)=0;
		run;
		
		* Creating the output dataset;
		data _null_;
			if 0 then set orion.continent;
			if _N_=1 then
				do;
					declare hash ContName(dataset:'orion.continent');
					ContName.definekey('ContinentID');
					ContName.definedata('ContinentName');
					ContName.definedone();
					declare hash C(multidata: 'Yes', ordered: 'ascending');
					C.definekey('ContinentID');
					C.definedata('ContinentID','ContinentName','Country',
								 'CountryName','Population');
					C.definedone();
				end;
			set orion.country(keep=ContinentID Country CountryName Population)
				end=eof;
			rc=ContName.find(key:ContinentID);
			rc=C.add();
			if eof then rc=C.output(dataset:'work.newcountries');
		run;
		proc print data=newcountries;
		run;
		
		* Practice: Level 1;
			data cust;
				if 0 then set orion.customertype(keep=CustomerTypeID CustomerType);
				if _N_=1 then
					do;
						declare hash CustType(dataset:'orion.customertype');
						CustType.definekey('CustomerTypeID');
						CustType.definedata('CustomerType');
						CustType.definedone();
					end;
				set orion.customer(keep=CustomerID CustomerTypeID);
				if CustType.find(key:CustomerTypeID)=0;
			run;
			proc print data=cust(obs=5) noobs;
				var CustomerType CustomerID CustomerTypeID;
				title 'cust Data Set';
			run;
			title;
			* Suggested Solution;
				data cust;
				   length CustomerType $40;
				   keep CustomerID CustomerTypeID CustomerType;
				   if _N_=1 then do;
				      declare hash Customer (dataset:'orion.customertype');
				      Customer.definekey('CustomerTypeID');
				      Customer.definedata('CustomerType');
				      Customer.definedone();
				      call missing(CustomerType);
				   end;
				   set orion.Customer;
				   if Customer.find()=0;
				run;
				proc print data=cust(obs=5) noobs;
				   title 'cust Data Set';
				run;
				title;
				
		* Practice: Level 2;
			data _null_;
				if 0 then 
					do;
						set orion.productlist(keep=ProductID ProductName);
						set orion.customerdim(keep=CustomerID CustomerCountry CustomerName);
						set orion.country(keep=Country CountryName);
					end;
				if _N_=1 then
					do;
						declare hash ProdList(dataset:'orion.productlist');
						ProdList.definekey('ProductID');
						ProdList.definedata('ProductName');
						ProdList.definedone();
						declare hash CustDim(dataset:'orion.customerdim');
						CustDim.definekey('CustomerID');
						CustDim.definedata('CustomerCountry','CustomerName');
						CustDim.definedone();
						declare hash Ctry(dataset:'orion.country');
						Ctry.definekey('Country');
						Ctry.definedata('CountryName');
						Ctry.definedone();
						declare hash D(multidata: 'Yes', ordered: 'ascending');
						D.definekey('CustomerID','ProductID');
						D.definedata('CustomerID','OrderDate','ProductID','Quantity','TotalRetailPrice','CustomerName','CountryName','ProductName','CustomerCountry');
						D.definedone();
					end;
				set orion.orderfact(keep=CustomerID OrderDate ProductID Quantity TotalRetailPrice) 
									end=eof;
				rcPL=ProdList.find(key:ProductID);
				rcCD=CustDim.find(key:CustomerID);
				rcC=Ctry.find(key:CustomerCountry);
				
				rc=D.add();
				if eof then rc=D.output(dataset:'work.billing');
			run;
			proc print data=billing(obs=5);
				var CustomerID CustomerName  CountryName ProductID ProductName OrderDate Quantity TotalRetailPrice;
				title 'Billing Information';
				title1 'Using a HASH Data Step Object';
			run;
			title;
			
			* Suggested Solution;
				data billing;
				   drop rc1 rc2 rc3 Country;
				   if _N_=1 then 
				      do;
				         if 0 then 
				            set orion.productlist(keep=ProductID ProductName);
				         if 0 then 
				            set orion.customerdim(keep=CustomerID CustomerCountry
				                                       CustomerName);
				         if 0 then 
				            set orion.country(keep=Country CountryName);
				         declare hash Prod(dataset:'orion.productlist');
				         Prod.definekey('ProductID');
				         Prod.definedata('ProductName');
				         Prod.definedone();
				         declare hash Customer(dataset:'orion.customerdim');
				         customer.definekey('CustomerID');
				         customer.definedata('CustomerCountry','CustomerName');
				         customer.definedone();
				         declare hash C(dataset:'orion.country');
				         C.definekey('Country');
				         C.definedata('CountryName');
				         C.definedone();
				      end;
				   set orion.orderfact(keep=OrderDate Quantity 
				                            ProductID TotalRetailPrice CustomerID);
				   rc1=Customer.find();
				   if rc1=0;
				   rc2=Prod.find();
				   if rc2=0;
				   rc3=C.find(key:CustomerCountry);
				   if rc3=0;
				run;
				proc sort data=billing;
				   by CustomerID ProductID;
				run;
				proc print data=billing(obs=5) noobs;
				   var CustomerID CustomerName CustomerCountry
				       CountryName ProductID ProductName 
				       OrderDate Quantity TotalRetailPrice;
				   title1 'Billing Information';
				   title2 'Using a HASH Data Step Object';
				run;  
				title;
				
		* Practice: Challenge;
			data manager;
				rename EmployeeName=ManagerName;
				keep EmpName EmployeeName EmployeeID Salary ManagerID;
				format Salary dollar12.2;
				if 0 then 
					do;
						set orion.staff(keep=EmployeeID ManagerID);
						set orion.employeepayroll(keep=EmployeeID Salary);
						set orion.employeeaddresses(keep=EmployeeID EmployeeName);
					end;
				if _N_=1 then
					do;
						declare hash st(dataset:'orion.staff');
						st.definekey('EmployeeID');
						st.definedata('ManagerID');
						st.definedone();
						declare hash emppr(dataset:'orion.employeepayroll');
						emppr.definekey('EmployeeID');
						emppr.definedata('Salary');
						emppr.definedone();
						declare hash empaddr(dataset:'orion.employeeaddresses');
						empaddr.definekey('EmployeeID');
						empaddr.definedata('EmployeeName');
						empaddr.definedone();
					end;
				set orion.employeeaddresses(keep=EmployeeID EmployeeName rename=(EmployeeName=EmpName)) ;
				rcST=st.find(key:EmployeeID);
				rcPR=emppr.find(key:EmployeeID);
				rcEA=empaddr.find(key:ManagerID);
			run;
			proc sort data=manager;
				by EmployeeID;
			run;
			proc print data=manager(obs=5) noobs;
				var EmpName ManagerName EmployeeID Salary ManagerID;
				title "manager Data Set";
			run;
			title;
			* Suggested Solution;
				data manager;
				   length EmployeeName EmpName ManagerName $40;
				   keep EmployeeID EmpName ManagerID ManagerName Salary;
				   if _N_=1 then 
				      do;
				         declare hash M(dataset:'orion.staff');
				         M.definekey('EmployeeID');
				         M.definedata('ManagerID');
				         M.definedone();
				         declare hash N(dataset:'orion.employeeaddresses');
				         N.definekey('EmployeeID');
				         N.definedata('EmployeeName');
				         N.definedone();
				         call missing(EmployeeName); 
				      end;
				   set orion.employeepayroll(keep=EmployeeID Salary);
				   rc1=M.find(key:EmployeeID);
				   rc2=N.find(key:EmployeeID);
				   if rc2=0 then EmpName=EmployeeName;
				   else EmpName=' ';
				   rc3=N.find(key:ManagerID);
				   if rc3=0 then ManagerName=EmployeeName;
				   else ManagerName=' ';
				run;
				proc print data=manager(obs=5) noobs;
				   title "manager Data Set";
				run;
				title;
				
	/* Using the DATA Step Hiter Object */
		data top bottom;
			drop i;
			if _N_=1 then
				do;
					if 0 then set orion.orderfact(keep=CustomerID
													   ProductID
													   TotalRetailPrice);
					declare hash Customer(dataset:'orion.orderfact',
										  ordered:'descending');
					Customer.definekey('TotalRetailPrice','CustomerID');
					Customer.definedata('TotalRetailPrice','CustomerID','ProductID');
					Customer.definedone();
					declare hiter C('Customer');
				end;
			C.first();
			do i=1 to 2;
				output top;
				C.next();
			end;
			C.last();
			do i=1 to 2;
				output bottom;
				C.prev();
			end;
			stop;
		run;
		proc print data=top;
			title 'Top 2 Big Spenders';
		run;
		proc print data=bottom;
			title 'Bottom 2 Frugal Spenders';
		run;
		title;
		
		* Practice: Level 1;
			data expensive leastexpensive;
				drop i;
				if _N_=1 then
					do;
						if 0 then set orion.shoesales(keep=TotalRetailPrice ProductName ProductID);
						declare hash ssales(dataset:'orion.shoesales', ordered:'descending');
						ssales.definekey('TotalRetailPrice');
						ssales.definedata('TotalRetailPrice','ProductName','ProductID');
						ssales.definedone();
						declare hiter C('ssales');
					end;
				C.first();
				do i=1 to 5;
					output expensive;
					C.next();
				end;
				C.last();
				do i=1 to 5;
					output leastexpensive;
					C.prev();
				end;
				stop;
			run;
			proc print data=expensive noobs;
				title 'The Five Most Expensive Shoes';
			run;
			proc print data=leastexpensive noobs;
				title 'The Five Least Expensive Shoes';
			run;
			* Suggested Solution;
				data expensive leastexpensive;
				   drop i;
				   if _N_=1 then 
				      do;
				         if 0 then set orion.shoesales;
				         declare hash Shoes(dataset:'orion.shoesales',ordered:'descending');
				         shoes.definekey('TotalRetailPrice');
				         shoes.definedata('TotalRetailPrice','ProductID','ProductName');
				         shoes.definedone();
				         declare hiter S('Shoes');
				      end;
				   S.first();
				   do i=1 to 5;
				      output expensive;
				      S.next();
				   end;
				   S.last();
				   do i=1 to 5;
				      output leastexpensive;
				      S.prev();
				   end; 
				   stop;
				run;
				proc print data=expensive noobs;
				   title "The Five Most Expensive Shoes";
				run;
				
				proc print data=leastexpensive noobs;
				   title "The Five Least Expensive Shoes";
				run;
				title;

		* Practice: Level 2;
			data group;
				drop i;
				if _N_=1 then
					do;
						if 0 then set orion.shoesales(keep=TotalRetailPrice ProductID ProductName);
						declare hash Shoes(dataset:'orion.shoesales', ordered:'descending');
						Shoes.definekey('TotalRetailPrice');
						Shoes.definedata('TotalRetailPrice','ProductID','ProductName');
						Shoes.definedone();
						declare hiter S('Shoes');
					end;
				S.first();
				do i=1 to 5;
					Rank=catx(' ','Top',i);
					output group;
					S.next();
				end;
				S.last();
				do i=1 to 5;
					Rank=catx(' ','Bottom',i);
					output group;
					S.prev();
				end;
				stop;
			run;
			proc print data=group noobs;
				var Rank ProductID ProductName TotalRetailPrice;
				title 'group Data Set';
			run;
			
			* Suggested Solution;
				data group;
				   drop i;
				   length Rank $ 8;
				   if _N_=1 then 
				      do;
				         if 0 then set orion.shoesales;
				         declare hash Shoes(dataset:'orion.shoesales',ordered:'descending');
				         Shoes.definekey('TotalRetailPrice');
				         Shoes.definedata('TotalRetailPrice','ProductID','ProductName');
				         Shoes.definedone();
				         declare hiter S('Shoes');
				      end;
				   S.first();
				   do i=1 to 5;
				      Rank=catx(' ', 'Top', i);
				      output;
				      S.next();
				   end;
				   S.last();
				   do i=1 to 5;
				      Rank=catx(' ', 'Bottom', i);
				      output;
				      S.prev();
				   end; 
				   stop;
				run;
				proc print data=group noobs;
				   title 'group Data Set';
				run;
				title;
				
		* Practice: Challenge;
			data different;
				keep CustomerID OrderType;
				if _N_=1 then
					do;
						if 0 then set orion.orderfact(keep=CustomerID OrderType);
						declare hash Orders(dataset:'orion.orderfact',
											ordered:'yes');
						Orders.definekey('CustomerID','OrderType');
						Orders.definedata('CustomerID','OrderType');
						Orders.definedone();
						declare hiter S('Orders');
					end;
				rc=S.first();
				do while (rc=0);
					output;
					rc=S.next();
				end;
				stop;
			run;
			proc print data=different(obs=5) noobs;
				title 'No Duplicates';
			run;
			title;
			
			* Suggested Solution;
				data different; 
				   drop rc; 
				   if _N_=1 then 
				      do;
				         if 0 then set orion.orderfact(keep=CustomerID OrderType);
				         declare hash Orders(dataset: 'orion.orderfact', ordered: 'yes');
				         declare hiter OF('Orders');
				         orders.definekey('CustomerID','OrderType');
				         orders.definedata('CustomerID','OrderType');
				         orders.definedone();
				      end;
				   rc=OF.first();
				   do while (rc=0);
				      output;
				      rc=OF.next();
				   end;
				   stop;
				run;
				proc print data=different(obs=5) noobs;
				   title "No Duplicates";
				run;
				title;