/*
	Lesson 4: Using DATA Step Arrays for Table Lookups
*/
	%let path=/folders/myshortcuts/2-Proyectos/3 - Estudios/3.3 - SAS/7 - ECPG393R/data; 
	libname orion "&path";
	/* Using the Array as an In-Memory Lookup Technique */
		data countryinfo;
			array ContName{91:96} $30 _temporary_ 
				('North America',
				 ' ',
				 'Europe',
				 'Africa',
				 'Asia',
				 'Australia/Pacific');
			set orion.country;
			continent=ContName{ContinentID};
		run;
		
		proc print data=countryinfo;
		run;

	/* Using a One-Dimensional Array to Look Up Data */
		data compare;
			keep EmployeeID YearHired Salary Average SalaryDif;
			format Salary Average SalaryDif dollar12.2;
			array yr{1978:2011} Yr1978-Yr2011;
			if _n_=1 then set orion.salarystats(where=(Statistic='AvgSalary'));
			set orion.employeepayroll(keep=EmployeeID
										   EmployeeHireDate
										   Salary);
			YearHired=year(EmployeeHireDate);
			Average=yr{YearHired};
			SalaryDif=sum(Salary,-Average);
		run;
		
		proc print data=compare(obs=8);
			var EmployeeID YearHired Salary Average SalaryDif;
			title 'Using One Dimensional Arrays';
		run;
		title;
		
		* Practice: Level 1;
			data compare;
				keep CustomerID EmployeeID StreetID OrderDate DeliveryDate OrderID 
					 ProductID Quantity TotalRetailPrice CostPricePerUnit Discount
					 Month MedianRetailPrice;
				format TotalRetailPrice TotalRetailPrice MedianRetailPrice dollar12.2;
				array mn{1:12} Month1-Month12;
				if _n_=1 then set orion.retailinformation(where=(Statistic='MedianRetailPrice'));
				set orion.retail;
				Month=month(OrderDate);
				MedianRetailPrice=mn{Month};
			run;
			proc print data=compare(obs=5);
				var CustomerID EmployeeID StreetID OrderDate DeliveryDate OrderID 
					 ProductID Quantity TotalRetailPrice CostPricePerUnit Discount
					 Month MedianRetailPrice;
				title 'Partial Compare Data Set';
			run;
			title;
			
		* Practice: Level 2;
			data trans;
				keep Stat ProductLine Value;
				set orion.shoestats;
	
				array prod{21:24} Product21-Product24 ;
				do i=21 to 24;
					ProductLine=i;
					Value=prod{i};
					output;
				end;
			run;
			proc print data=trans (obs=5);
			   title 'The TRANS Data Set';
			run;
			title;
		
		* Practice: Challenge;
			proc sort data=orion.orderfact 
			          out=neworderfact (keep=CustomerID OrderType OrderDate
			                                 DeliveryDate Quantity);
			   where CustomerID in (89, 2550) and 
			         year(OrderDate)=2011; 
			   by OrderType;
			run;
			proc sql;
			   title 'Count by Order Type';
			   select OrderType, 
			          count(*) as count
			      from neworderfact
			         group by OrderType;
			quit;		
			
			data all;
				drop i j;
				set neworderfact;
				by OrderType;
				array ordDates{4} OrderDate1-OrderDate4;
				array delDates{4} DeliveryDate1-DeliveryDate4;
				array quant{4} Quantity1-Quantity4;
				
				retain ordDates;
				retain delDates;
				retain quant;
				 
				retain i;
				if first.OrderType then do;
					i=1;
				end;
				ordDates{i}=OrderDate;
				delDates{i}=DeliveryDate;
				quant{i}=Quantity;
				i+1;
				if last.OrderType then do;
					output;
					do j=1 to 4;
						ordDates{j}=.;
						delDates{j}=.;
						quant{j}=.;
					end;
				end;
			run;
			
			proc print data=all;
				var OrderDate1-OrderDate4 
					DeliveryDate1-DeliveryDate4 
					Quantity1-Quantity4
					CustomerID
					OrderDate
					DeliveryDate
					OrderType
					Quantity;
				format DeliveryDate1-DeliveryDate4 OrderDate1-OrderDate4 date9.;
			run;
			* Suggested solution in Training;
				data all;
				   array ordt{*} OrderedDate1-OrderedDate4;
				   array deldt{*} DeliveryDate1-DeliveryDate4;
				   array q{*} Quantity1 - Quantity4;
				   format OrderedDate1-OrderedDate4 
				          DeliveryDate1-DeliveryDate4 date9.;
				   N=0;  
				   do until (last.OrderType);
				      set neworderfact;
				      by OrderType;
				      N+1;
				      ordt{N}=OrderDate;
				      deldt{N}=DeliveryDate;
				      q{N}=Quantity;
				   end;
				run; 
				proc print data=all;
				   title 'The ALL Data Set';
				run;
				title;
				
	/* Using Multidimensional Arrays to Look Up Data */
		data budgetamt;
			drop Y M;
			array B(2,2007:2011) _temporary_
				(1590000,1880000,2300000,1960000,1970000,
				 1290000,1550000,1830000,1480000,1640000);
			set orion.profit(where=(Sales ne .)obs=2);
			Y=year(YYMM);
			M=month(YYMM);
			BudgetAmt=B{M,Y};
		run;
		
		* Practice;
			data pct;
				array disc{3,6} _temporary_
					(10, 10, 15, 20, 20, 25,
					 10, 15, 20, 25, 25, 30,
					 10, 15, 15, 20, 25, 25);
				set orion.orderfact;
				keep CustomerID OrderType Quantity CouponValue;
				CouponValue=disc{OrderType,Quantity};				
			run;
			
			proc print data=pct(obs=5);
				title 'The Coupon Value';
			run;
			title;
			* Proposed solution;
				data customercoupons;
				   array pct{3,6} _temporary_ 
				         (10, 10, 15, 20, 20, 25,
				          10, 15, 20, 25, 25, 30,
				          10, 15, 15, 20, 25, 25);
				   set orion.orderfact(keep=CustomerID OrderType Quantity);
				   CouponValue=pct{OrderType,Quantity};
				run;
				
				proc print data=customercoupons(obs=5);
				   title 'The Coupon Value';
				run;
				title;
				
	/* Loading a Multidimensional Array from a SAS Data Set */
		data budgetamt;
			drop Yr2007-Yr2011 Month I J Y M;
			array B{12,2007:2011} _temporary_;
			if _n_=1 then
				do I=1 to 12;
					set orion.budget;
					array tmp{2007:2011} Yr2007-Yr2011;
					do J=2007 to 2011;
						B{I,J}=tmp{J};
					end;
				end;
			set orion.profit(where=(Sales ne .));
			Y=year(YYMM);
			M=month(YYMM);
			BudgetAmt=B{M,Y};
		run;
		
		* Practice: Level 1;
			
			
		* Practice: Level 2;
			data combine;
				keep ProductID ProductName TotalRetailPrice ManufacturerSuggestedPrice;
				array tmpMSP{21:24,2} _temporary_;
				*retain tmpMSP;
				if _n_=1 then
					do I=1 to 8;
						set orion.msp;
						CatID=substr(put(ProdCatID,4.),3,2);
						tmpMSP{ProdLine,CatID}=AvgSuggestedRetailPrice;
					end;
				set orion.shoesales;
				ProductLine=substr(ProductID,1,2);
				ProductCat=substr(ProductID,3,2);
				ManufacturerSuggestedPrice=tmpMSP{ProductLine,ProductCat};
			run;
			
			proc print data=combine(obs=5) noobs;
				var ManufacturerSuggestedPrice ProductID ProductName TotalRetailPrice;
				format ManufacturerSuggestedPrice dollar8.2;
				title 'The Coupon Percentage Value';
			run;
			title;
			
			* Suggested Solution;
				data combine;
				   array msp{21:24,2} _temporary_ ;
				   keep ProductID ProductName TotalRetailPrice 
				        ManufacturerSuggestedPrice; 
				   format ManufacturerSuggestedPrice dollar8.2;
				   if _N_= 1 then do i=1 to All;
				      set orion.msp nobs=All;      
				         msp{ProdLine,input(substr(put(ProdCatID,4.),3,2),2.)}
				             =AvgSuggestedRetailPrice;
				   end;
				   set orion.shoesales;
				   ProdID=put(ProductID,12.);
				   ProductLine=input(substr(ProdID,1,2),2.);
				   ProductCatID=input(substr(ProdID,3,2),2.);
				   ManufacturerSuggestedPrice=
				      msp{ProductLine, ProductCatID};
				run;
				proc print data=combine(obs=5) noobs;
				   title 'The Coupon Percentage Value';
				run;
				title;
			
		* Practice: Challenge;
			options fullstimer; 
			data threedim;
				keep ProductID ProductName Warehouse;
				array arrWarehouse{21:24,0:8,0:9} $ _temporary_;
				if _N_=1 then do i=1 to All;
					set orion.warehouses nobs=All;
					arrWarehouse{ProductLine,ProductCatID,ProductLocID}=Warehouse;
					*putlog arrWarehouse{ProductLine,ProductCatID,ProductLocID};
				end;
				set orion.productList;
				prodID=put(ProductID,12.);
				prodLine=input(substr(prodID,1,2),2.);
				prodCatID=input(substr(prodID,3,2),2.);
				prodLocID=input(substr(prodID,12,1),1.);
				Warehouse=arrWarehouse{prodLine,prodCatID,prodLocID};
				where ProductLevel = 1;
			run;
			proc print data=threedim(obs=5) noobs;
				title 'warehouses';
			run;
			title;
			options nofullstimer; 
			* Suggested Solution;
				options fullstimer; 
				data threedim;
				   keep ProductID ProductName Warehouse;
				   array w{21:24,0:8,0:9} $ 5  _temporary_ ;
				   if _n_=1 then do i=1 to all;
				      set orion.warehouses nobs=all;
				      W{ProductLine,ProductCatID,ProductLocID}=Warehouse;
				   end;
				   set orion.productlist(keep=ProductID ProductName 
				                              ProductLevel where=(ProductLevel=1)); 
				   ProdID=put(ProductID,12.);
				   ProductLine=input(substr(ProdID,1,2),2.);
				   ProductCatID=input(substr(ProdID,3,2),2.);
				   ProductLocID=input(substr(ProdID,12,1),1.);
				   Warehouse=w{ProductLine, ProductCatID, ProductLocID};
				run;
				proc print data=threedim(obs=5) noobs;
				   title 'warehouses';
				run;
				title;
				options nofullstimer; 