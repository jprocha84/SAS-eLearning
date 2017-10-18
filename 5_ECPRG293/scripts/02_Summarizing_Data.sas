/********************************************
	Creating an Accumulating Variable
*********************************************/
	data mnthtot;
		set orion.aprsales;
		retain Mth2Dte 0;
		Mth2Dte=Mth2Dte+SaleAmt;
	run;
	
	data mnthtot2;
		set orion.aprsales2;
		Mth2Dte+SaleAmt;
	run;
	
	* Practice Nro 1;
	data mid_q4;
		set orion.order_fact;
		Sales2Dte+Total_Retail_Price;
		Num_Orders+1;
		where Order_date between '01Nov2008'd and '14Dec2008'd;
	run;
	proc print data=mid_q4;
		var Order_ID Order_Date Total_Retail_Price Sales2Dte Num_Orders;
		format Sales2Dte dollar10.2;
		title 'Orders from 01Nov2008 through 14Dec2008';
	run;
	
	* Practice Nro 2;
	data typetotals;
		set orion.order_fact;
		if Order_Type=1 then TotalRetail+Quantity;
		else if Order_Type=2 then TotalCatalog+Quantity;
		else if Order_Type=3 then TotalInternet+Quantity;
		where Order_Date between '01Jan2009'd and '31Dec2009'd;
		keep Order_ID Order_Type Order_Date Quantity TotalRetail TotalCatalog TotalInternet;
	run;
	proc print data=typetotals;
		var Order_ID Order_Type Order_Date Quantity TotalRetail TotalCatalog TotalInternet;
	run;
/********************************************
	Accumulating Totals for a Group of Data
*********************************************/
	proc sort data=orion.specialsals
			  out=salsort;
		by Dept;
	run;
	data deptsals (keep=Dept DeptSal);
		set salsort;
		by Dept;
		if First.Dept then DeptSal=0;
		DeptSal+Salary;
		if Last.Dept;
	run;
	proc print data=deptsals;
		title 'Employee Salaries by Department';
		format DeptSal 7.;
	run;
	
	proc sort data=orion.projsals out=projsort;
		by Proj Dept;
	run;
	data pdsals(keep=Proj Dept DeptSal NumEmps);
		set projsort;
		by Proj Dept;
		if First.Dept then
			do;
				DeptSal=0;
				NumEmps=0;
			end;
		DeptSal+Salary;
		NumEmps+1;
		if Last.Dept;
	run;
	proc print data=pdsals noobs;
	run;
	
	* Practice Nro 1;
	proc sort data=orion.order_qtrsum out=qtrsumsort;
		by Customer_ID Order_Qtr;
	run;
	data qtrcustomers;
		set qtrsumsort;
		by Customer_ID Order_Qtr;
		if First.Order_Qtr then
			do;
				Total_Sales=0;
				Num_Months=0;
			end;
		Total_Sales+Sale_Amt;
		Num_Months+1;
		if Last.Order_Qtr;
		keep Customer_ID Order_Qtr Total_Sales Num_Months;
	run;
	proc print data=qtrcustomers;
		format Total_Sales Dollar11.2;
		title 'Summary of Sales based on Customer ID and Quarter';
	run;
	
	* Practice Nro 2;
	proc sort data=orion.usorders04 out=usorders04sort;
		by Customer_ID Order_Type;
	run;
	data Discount1 Discount2 Discount3; 
		set usorders04sort;
		by Customer_ID Order_Type;
		if First.Order_Type then TotSales=0;
		TotSales+(Total_Retail_Price*Quantity);
		if Last.Order_Type and TotSales>=100 then
			do;
				if Order_Type=1 then output Discount1;
				else if Order_Type=2 then output Discount2;
				else if Order_Type=3 then output Discount3;
			end;
		keep Customer_ID Customer_Name TotSales;
		format TotSales Dollar11.2;
	run;
	proc print data=Discount1;
		title 'Discount Retail';
	run;
	proc print data=Discount2;
		title 'Discount Catalog';
	run;
	proc print data=Discount3;
		title 'Discount Internet';
	run;