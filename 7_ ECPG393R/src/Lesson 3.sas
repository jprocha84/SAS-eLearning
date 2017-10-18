/*
	Lesson 3: Accessing Observations Directly
*/
	/* Accessing Observations Directly by Observation Number */
		proc contents data=orion.orderfact;
		run;
		proc print data=orion.orderfact;run;
		data subset;
			do PickIt=1 to TotObs by 50;
				ObsPicked = PickIt;
				set orion.orderfact(keep=CustomerID EmployeeID StreetID OrderID) 
					point=PickIt 
					nobs=TotObs;
				output; 
				putlog PickIt TotObs;
			end;
			putlog PickIt;
			stop; * To avoid Looping;
		run;
		* Using Random functions;
			data _null_;
				a=10;
				b=ranuni(0)*5;
				c=ceil(b);
				putlog _all_;
			run;
			data subset(drop=i SampSize);
				SampSize=10;
				do i=1 to SampSize;
					PickIt = ceil(ranuni(0)*TotObs);
					ObsPicked=PickIt;
					set orion.orderfact point=PickIt nobs=TotObs;
					output;
				end;
				stop;
			run;
			
			data subset(drop=ObsLeft SampSize);
				SampSize=10;
				ObsLeft=TotObs;
				do while (SampSize>0 and ObsLeft>0);
					PickIt+1;
					if ranuni(0)<SampSize/ObsLeft then do;
						ObsPicked=Pickit;
						set orion.orderfact point=PickIt nobs=TotObs;
						output;
						SampSize=SampSize-1;
					end;
				end;
				stop;
			run;
			proc print data=subset;	
				title 'A Ramdom Sample wihtout replacement';
				var ObsPicked CustomerID Orderdate DeliveryDate OrderID;
			run;
			title;
			run;
			
			data _null_;
				a=23.6;
				b=ceil(a);
				c=int(a);
				putlog _all_;
			run;
	/* Using the DATA Step to Directly Access the First and Last Observations */
		proc sort data=orion.orderfact out=sortedorderfact;
			by Descending TotalRetailPrice ;
		run;
		data top bottom;
			set sortedorderfact(obs=2) end=OnLastRow ;
			output top;
			if OnLastRow then
				do ReadObs=TotObs to TotObs -1 by -1;
					set sortedorderfact nobs=TotObs point=ReadObs;
					output bottom;
				end;
		run;
		
		* Practice: Level 1;
			proc print data=orion.productdim;
			run;
			data productsample;	
				do i=10 to TotObs by 10;
					*ObsPicked = i;
					set orion.productdim (keep=ProductLine ProductID ProductName SupplierName) 
						point=i
						nobs=TotObs;
					output;
				end;
				stop;
			run;
			proc print data=productsample (obs=5) noobs;	
			run;
			
		* Practice: Level 2;
			proc print data=orion.totalsalaries;run;
			proc sort data=orion.totalsalaries out=totSalaries_sort;
				by descending DeptSal;
			run;
			data highest lowest; 
				set totSalaries_sort(obs=5) end=OnLastRow;
				output highest;
				if OnLastRow then
					do i=TotObs to TotObs-4 by -1;
						set totSalaries_sort nobs=TotObs point=i;
						output lowest;
					end;
			run;
			proc print data=highest noobs;
			run;
			proc print data=lowest noobs;
			run;
		
		* Practice: Challenge;
			data sample (drop=i SampSize ObsPicked);
				SampSize=20;
				do i=1 to SampSize by 1;
					PickIt = ceil(ranuni(0)*TotObs);
					ObsPicked= PickIt;
					set orion.customerdim point=PickIt nobs=TotObs;
					output;
				end;
				stop;
			run;
			proc print data=sample noobs;
			run;
			
	/* Accessing Observations Directly by Key Value */
		data customer14958;
			set orion.saleshistory;
			where customerID=14958;
		run;
		proc contents data=orion.saleshistory;
		run;
		
	/* Creating Indexes */
		options msglevel=i;
		data work.history(index=(CustomerID 
								 ProductGroup 
								 SaleID=(OrderID ProductID)));
			set orion.history;
			ValueCost=CostPricePerUnit*Quantity;
			YearMonth=mdy(MonthNum, 15, input(YearID,4.));
			format ValueCost dollar12.
				   YearMonth monyy7.;
			label ValueCost="Value Cost"
				  YearMonth="Month/Year";
		run;
		
		data work.history(index=(CustomerID 
								 ProductGroup 
								 SaleID=(OrderID ProductID)/unique/nomiss ));
			set orion.history;
			ValueCost=CostPricePerUnit*Quantity;
			YearMonth=mdy(MonthNum, 15, input(YearID,4.));
			format ValueCost dollar12.
				   YearMonth monyy7.;
			label ValueCost="Value Cost"
				  YearMonth="Month/Year";
		run;
		
		proc contents data=orion.saleshistory;
		run;
		proc datasets lib=orion nolist;
			contents data=saleshistory;
		quit;
		
		* Practice: Level 1;
			options msglevel=i;
			data customerorders (index=(CustomerID OrderID/unique));
			   set orion.orders;
			   DaysToDelivery=DeliveryDate-OrderDate;
			run;
			
			proc sql;
				drop index OrderID
					from customerorders;
			quit;
			
			proc datasets lib=work;
				modify customerorders;
				index create OrDate=(OrderID OrderDate);
			run;
			proc datasets lib=work;
				contents data=customerorders;
			run;
			options msglevel=n;
			
		* Practice: Level 2;
			proc contents data=orion.pricelist;
			run;
			options msglevel=i;
			data pricelistupdate (index=(ProductID/unique));
				set orion.pricelist;
				UnitProfit = UnitSalesPrice - UnitCostPrice;
			run;
			
			proc sql;
			   insert into pricelistupdate(ProductID, 
			                               StartDate,
			                               EndDate, 
			                               UnitCostPrice,
			                               UnitSalesPrice,
			                               Factor,
			                               UnitProfit)
			      values (210200100009, '15FEB2011'd, '31DEC9999'd, 15.50, 34.70, 1.00, 19.20);
			quit;
		
		* Practice: Level Challenge;
			proc datasets lib=orion;
				contents data=sales;
				contents data=nonsales;
			run;
			data allstaff(index=(AgeHired));
				set orion.sales orion.nonsales(rename=(Last=LastName First=FirstName));
				AgeHired=intck('year',BirthDate,HireDate,'c' );
			run;
			proc print data=allstaff;
				var EmployeeID BirthDate HireDate AgeHired;
				where AgeHired > 30;
			run;
	/* Using Indexes */
		* Practice: Level 1;
			options msglevel=I;
		
			*** Example 1;
			data rdu;
			   set orion.saleshistory;
			   *if OrderID=1230166613;
			   where OrderID=1230166613;
			run;
			
			*** Example 2;
			proc print data=orion.saleshistory;
			   *where OrderID=1230166613 or ProductID=220200100100;
			   where OrderID=1230166613 and ProductID=220200100100;
			run;
			
			*** Example 3;
			proc print data=orion.saleshistory;
			   *where ProductGroup ne 'Shoes';
			   where ProductGroup eq 'Shoes';
			run;
			
			*** Example 4;
			proc print data=orion.saleshistory;
			   where CustomerID=12727;
			run;
			proc print data=orion.saleshistory(idxwhere=no);
			   where CustomerID=12727;
			run;
			
			**** Example 5;
			data saleshistorycopy;
			   set orion.saleshistory;
			run;
			
			options msglevel=n;    
		
		* Practice: Level 2;
			options msglevel=i;    
			proc print data=orion.supplier(idxwhere=no) noobs;
				where SupplierID > 1000;
			run;
			options msglevel=n;    