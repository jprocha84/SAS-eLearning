/********************************************
		Outputting Multiple Observations
*********************************************/

/********************************************
		Writing to Multiple SAS Data Sets
*********************************************/

/********************************************
		Controlling Variable Input and Output
*********************************************/
	data usa australia(drop=State) other;
	   drop Country;
	   set orion.employee_addresses(drop=Employee_ID);
	   if Country='US' then output usa;
	   else if Country='AU' then output australia;
	   else output other;
	run;
	
	data usa(drop=Country) 
	     australia(drop=State Country) 
	     other;
	   set orion.employee_addresses
	       (keep=Employee_Name City State Country);
	   if Country='US' then output usa;
	   else if Country='AU' then output australia;
	   else output other;
	run;
	proc print data=usa;
	run;
	 
	proc print data=australia;
	run;
	 
	proc print data=other;
	run;
	
/********************************************
		Controlling which Observations are Read
*********************************************/
	* Practice Nro 1;
	data salesinfo(keep=Employee_ID Job_Title Manager_ID)
		 execinfo(keep=Employee_ID Job_Title);
		set orion.employee_organization;
		if Department='Sales' then output salesinfo;
		else if Department='Executives' then output execinfo;
	run;
	proc print data=salesinfo(obs=6);
		title 'Sales Information - First 6 values';
	run;
	proc print data=execinfo(firstobs=2 obs=3);
		title 'Executives Information - 2nd and 3rd Observation';
	run;
	title;
	* Practice Nro 2;
	data instore(keep=Order_ID Customer_ID Order_Date)
		 delivery(keep=Order_ID Customer_ID Order_Date ShipDays);
		set orion.orders;
		where order_type=1;
		ShipDays=Delivery_Date-Order_Date;
		if ShipDays=0 then output instore;
		else if ShipDays>0 then output delivery;
	run;
	
	proc print data=delivery;
		title 'Orders that were delivere.';
	run;

	proc freq data=instore;
		title 'Number of Orders per Year';
		tables Order_Date;
		format Order_Date YEAR.;
	run;