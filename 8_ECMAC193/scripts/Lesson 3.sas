/*
 * 	Lesson 3: Creating Macro Variables at Execution Time
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/8 - ECMAC193/data;
	libname orion "&path";
	
	* Creating a Macro Variable during DATA Step Execution;
		* Sales Report - First Attempt;
		%let month=2;
		%let year=2011;
		 
		data orders1;
		   keep Order_Date Order_Type Quantity Total_Retail_Price;
		   set orion.order_fact end=final;
		   where year(Order_Date)=&year and month(Order_Date)=&month;
		   if Order_Type=3 then Number+1;
		   if final then do;
		      put Number=;
		      if Number=0 then do;
		         %let foot=No Internet Orders;
		      end;
		         else do;
		           %let foot=Some Internet Orders;
		         end;
		     end;
		   run;
		 
		proc print data=orders1;
		   title "Orders for &month-&year";
		   footnote "&foot";
		run;
		
		title;
		footnote;
		
		* Using the CALL SYMPUTX Routine;
		%let month=2;
		%let year=2011;
		 
		data orders1;
		   keep Order_Date Order_Type Quantity Total_Retail_Price;
		   set orion.order_fact end=final;
		   where year(Order_Date)=&year and month(Order_Date)=&month;
		   if Order_Type=3 then Number+1;
		   if final then do;
		      put Number=;
		      if Number=0 then do;
		         call symputx('foot','No Internet Orders');
		      end;
		         else do;
		           call symputx('foot','Some Internet Orders');
		         end;
		     end;
		   run;
		 
		proc print data=orders1;
		   title "Orders for &month-&year";
		   footnote "&foot";
		run;
		
		title;
		footnote;
		
		* Using the CALL SYMPUTX Routine with a DATA Step Variable;
		%let month=1;
		%let year=2011;
		 
		data orders3;
		   keep Order_Date Order_Type Quantity Total_Retail_Price;
		   set orion.order_fact end=final;
		   where year(Order_Date)=&year and month(Order_Date)=&month;
		   if Order_Type=3 then Number+1;
		   if final then call symputx('num',Number);
		   run;
		 
		proc print data=orders3;
		   title "Orders for &month-&year";
		   footnote "&num Internet Orders";
		run;
		
		title;
		footnote;
		
		* Using the CALL SYMPUTX Routine with a DATA Step Expression;
		*%let month=1;
		%let month=2;
		%let year=2011;
		 
		data orders4;
		   keep Order_Date Order_Type Quantity Total_Retail_Price;
		   set orion.order_fact end=final;
		   where year(Order_Date)=&year and month(Order_Date)=&month;
		   if Order_Type=3 then do;
		   		Number+1;
		   		Amount+Total_Retail_Price;
		   		Date=Order_Date;
		   		retain Date;
		   end;
		   if final then do;
		   		if number=0 then do;
		   			call symputx('last_date', 'N/A');
		   			call symputx('average', 'N/A');
		   		end;
		   		else do;
		   			call symputx('last_date', put(date,mmddyy10.));
		   			call symputx('average', put(amount/number,dollar8.));
		   		end;
		   end;
		run;
		 
		proc print data=orders4;
		   title "Orders for &month-&year";
		   footnote1 "Average Internet Order: &average";
		   footnote2 "Last Internet Order: &last_date";
		run;
		
		title;
		footnote;
		
	* Passing Data Between Steps;
		* Analyzing the Data;
			*%let year=2009;
			%let year=2011;
			proc means data=orion.order_fact noprint;
				where year(order_date)=&year;
				var Quantity Total_Retail_Price;
				output out=stats mean=AvgQty AvgPrice;
			run;
		
		* Creating the Macro Variables;
			data _null_;
				set stats;
				call symputx('qty',round(AvgQty,.01));
				call symputx('price',round(AvgPrice,.01));
			run;
			
		* Printing the Results;
			title "Order Exceeding Average in &year";
			footnote "Average Quantity: &qty";
			footnote2 "Average Price: &price";
			
			proc print data=orion.order_fact noobs;
				where year(Order_Date)=&year and Quantity>&qty and Total_Retail_Price>&price;
				var Customer_ID Order_ID Order_Date
					Quantity Total_Retail_Price;
			run;
		
		* Practice: Level 1;
			title; 
			footnote; 
			
			%let idnum=121044;
			data _NULL_;
				set orion.employee_addresses;
				where employee_ID=&idnum;
				call symputx('name',Employee_Name);
			run;
			
			proc print data=orion.orders noobs;
			   var order_ID order_type order_date delivery_date;
			   where employee_ID=&idnum;
			title "Orders Taken by Employee &idnum: &name";
			run;
			title;
			
		* Practice: Level 2;
			title; 
			footnote; 
			
			proc means data=orion.order_fact sum nway noprint; 
			   var total_retail_price;
			   class customer_ID;
			   output out=customer_sum sum=CustTotalPurchase;
			run;
			
			proc sort data=customer_sum ;
			   by descending CustTotalPurchase;
			run;
			
			data _NULL_;
				set customer_sum;
				if _n_=1 then do;
					call symputx("top",customer_ID);
				end;
			run;
			data _null_;
				set orion.customer_dim;
				where customer_id=&top;
				call symputx("name",Customer_Name);
			run;
			proc print data=orion.orders noobs;
				var Order_ID Order_Type Order_Date Delivery_Date;
				where customer_id=&top;
				title "Orders for Customer &name";
			run;
			
	* Creating Indirect References to Macro Variables;
		%let custid=9;
		data _null_;
		   set orion.customer;
		   where Customer_ID=&custid;
		   call symputx('name', Customer_Name);
		run;
		 
		proc print data=orion.order_fact;
		   where Customer_ID=&custid;
		   var Order_Date Order_Type Quantity Total_Retail_Price;
		   title1 "Customer Number: &custid";
		   title2 "Customer Name: &name";
		run;
		
		title;
		
		* Creating a Series of Macro Variables;
		data _null_;
			set orion.customer;
			call symputx(cat('name',Customer_ID),Customer_Name);
		run;
		
		* Creating a Series of Macro Variables Using SYMPUTX;
		data _null_;
		      set orion.customer;
		      call symputx(cats('name',Customer_ID), Customer_Name);
		run;
		
		%let custid=9;
		proc print data=orion.order_fact;
		   where Customer_ID=&custid;
		   var Order_Date Order_Type Quantity Total_Retail_Price;
		   title1 "Customer Number: &custid";
		   title2 "Customer Name: &&name&custid";
		run;
		    
		title;
		
		* Practice;
			title; 
			footnote; 
			
			data _null_;
				set orion.customer_type;
				call symputx(cats('type',Customer_Type_ID),Customer_Type);
			run;
			
			%let id=2030;
			proc print data=orion.customer;
			   var Customer_Name Customer_ID Gender;
			   where customer_type_id=&id;
			title "A list of &&type&id";
			run;
			
	* Creating Macro Variables Using PROC SQL;
		proc sql noprint;
			select sum(Total_Retail_Price) format=dollar8.
				   into: total
			from orion.order_fact
			where year(order_date)=2011 and Order_Type=3;
		quit;
		%let total=&total;
		%put Total 2011 Internet Sales: &total;
		
		* Creating a Series of Macro Variables Using PROC SQL;
		title 'Top 2011 Sales';
		proc sql outobs=3;
			select Total_Retail_Price
				into :price1-:price3
			from orion.order_fact
			where year(order_date)=2011
			order by Total_Retail_Price desc;
		quit;
		
		* Creating an Additional Series of Macro Variables;
		title 'Top 2011 Sales';
		proc sql outobs=3;
			select Total_Retail_Price, Order_Date format=mmddyy10.
				into :price1-:price3, :date1-:date3
			from orion.order_fact
			where year(order_date)=2011
			order by Total_Retail_Price desc;
		quit;
		
		* Creating Macro Variables during PROC SQL Step Execution;
		%let year=2011;
 
		proc sql noprint;
		   select avg(Quantity), avg(Total_Retail_Price)
		      into:qty, :price
		      from orion.order_fact
		      where year(Order_Date)=&year;
		run;
		 
		%let qty=&qty;
		%let price=&price;
		 
		title "Orders Exceeding Average in &year";
		footnote "Average Quantity: &qty";
		footnote2 "Average Price: &price";
		 
		proc print data=orion.order_fact noobs;
		   where year(Order_Date)=&year and Quantity>&qty
		         and Total_Retail_Price>&price;
		   var Customer_ID order_id Order_Date Quantity Total_Retail_Price;
		run;
		
		title;
		footnote;
		
		* Storing a List of Values in a Macro Variable;
		proc sql noprint;
			select distinct country	
				into :countries
				separated by ', '
			from orion.customer;
		quit;
		%put &countries;
		
		* Practice;
			title; 
			footnote; 
			
			%let start=01Jan2011;
			%let stop=31Jan2011;
			
			proc means data=orion.order_fact noprint;
			   where order_date between "&start"d and "&stop"d;
			   var Quantity Total_Retail_Price;
			   output out=stats_q_p mean=Avg_Quant Avg_Price;
			run;
			
			data _null_;
			   set stats_q_p;
			   call symputx('Quant',put(Avg_Quant,4.2));
			   call symputx('Price',put(Avg_Price,dollar7.2));
			run;
			
			proc sql noprint;
				select mean(Quantity) format=4.2, mean(Total_Retail_Price) format=dollar7.2
					into :Quant, :Price
				from orion.order_fact
				where order_date between "&start"d and "&stop"d;
			run;
			
			
			proc print data=orion.order_fact noobs n;
			   where order_date between "&start"d and "&stop"d;
			   var Order_ID Order_Date Quantity Total_Retail_Price;
			   sum Quantity Total_Retail_Price;
			   format Total_Retail_Price dollar6.;
			   title1 "Report from &start to &stop";
			   title3 "Average Quantity: &quant";
			   title4 "Average Price: &price";
			run;
			
			%symdel price quant;
			
		