%let path=/folders/myshortcuts/SAS_Entrenamiento/ECPRG293/in_data; 

/********************************************
	Using Formatted Input
*********************************************/
	data discounts;
		infile "&path/offers.dat";
		input @1 Cust_type 4.
			  @5 Offer_dt mmddyy8.
			  @14 Item_gp $8
			  @22 Discount percent3.;
	run;
	proc print data=discounts;
		format Offer_dt date9.;
	run;
	
	* Practice Nr 1;
	data salesstaff;
		infile "&path/sales1.dat";
		input @1 Employee_ID 6.
			  @21 Last_Name $18.
			  @43 Job_Title $20.
			  @64 Salary Dollar8.
			  @87 Hire_Date mmddyy10.;
	run;
	title 'Australian and US Sales Staff';
	proc print data=salesstaff;
	run;
	title;
	
	* Practice Nr 2;
	data us_trainees au_trainees;
		infile "&path/sales1.dat";
		input @1 Employee_ID 6.
			  @21 Last_Name $18.
			  @43 Job_Title $20.
			  @64 Salary Dollar8.
			  @73 Country $2.
			  @87 Hire_Date mmddyy10.;
		if Job_Title='Sales Rep. I';
		if Country='AU' then output au_trainees;
		else if Country='US' then output us_trainees;
		keep Employee_ID Last_Name Job_Title Salary Hire_Date;
	run;
	
	proc print data=us_trainees;
		title 'Trainees based in US';
	run;
	proc print data=au_trainees;
		title 'Trainees based in Australia';
	run;

/********************************************************
	Creating a Single Observation from Multiple Records
*********************************************************/	
	data mycontacts;
		infile "&path/address.dat";
		input FullName $30.;
		input;
		input Address2 $25.;
		input Phone $8.;
	run;
	data mycontacts;
		infile "&path/address.dat";
		input FullName $30.// 
			  Address2 $25./
			  Phone $8.;
	run;
	proc print data=mycontacts;
	run;
	
	* Practice Nm 1;
	data sales_staff2;
		infile "&path/sales2.dat";
		input @1 Employee_ID $6. 
			  @21 Last_Name $60. /
			  @1 Job_Title $21. 
			  @22 Hire_Date mmddyy10. 
			  @33 Salary dollar8./;
	run;
	title 'Australian and US Sales Staff';
	proc print data=sales_staff2;
	run;
	
	data sales_staff2;
	   infile "&path/sales2.dat";
	   input @1 Employee_ID 6.
	         @21 Last_Name $18. 
	      #2 @1 Job_Title $20.
	         @22 Hire_Date mmddyy10.
	         @33 Salary dollar8.
	      #3;
	run;
	
	title 'Australian and US Sales Staff';
	proc print data=sales_staff2;
	run;
	title;

/********************************************************
	Controlling When a Record Loads
*********************************************************/	
