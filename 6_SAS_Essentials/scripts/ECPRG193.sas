	/* This code is the first of the training*/
proc contents data=orion._ALL_ /*nods*/;
run;

data work.newsalesemps;
	set orion.sales;
	where Country = 'AU';
run;
* this is another kind of comments;
proc print data=work.newsalesemps;
run;

proc print data=orion.sales;
	var Last_Name First_Name Salary;
	sum Salary;
run;

proc means data=work.newsalesemps;
	class Job_Title;
	var Salary;
run;

proc print data=orion.sales noobs;
	var Last_Name First_Name Salary Country;
	where Country='AU' and Salary<25500;
run;

proc print data=orion.sales noobs;
	var Last_Name First_Name Country Job_Title;
	where Country='AU' and Job_Title contains 'Rep';
run;

proc print data=orion.customer_dim;
	where Customer_Age=21;
	id Customer_ID;
run;

proc print data=orion.order_fact noobs;
	sum Total_Retail_Price;
	where Total_Retail_Price >= 500;
	id Customer_ID;
	var order_id Order_Type Quantity Total_Retail_Price;
run;

proc sort data=orion.sales out=work.sales_sort;
	by Country descending Salary;
run;

proc print data=work.sales_sort;
	by Country;
run;


proc sort data=orion.sales
          out=work.sorted;
   by Gender Country;
run;

title1 'The Orion testing Title';
title2 'Salary Report';
footnote1 'Confidential';

proc print data=work.sorted; 
   by Gender;
run;

proc print data=orion.sales label split='*';
	var Employee_ID Last_Name Salary;
	label Employee_ID='Sales ID';
	label Last_Name='Last Name';
	label Salary='Annual*Salary';
run;

title;
footnote;


title1 'The First Line';
title2 'The Second Line';
proc print data=orion.sales;
run;

title2 'The Next Line';
proc print data=orion.sales;
run;

title 'The Top Line';
proc print data=orion.sales;
run;

proc print data=orion.sales noobs label;
	where Country='AU' and Job_Title contains 'Rep';
	label Job_Title='Sales Title'
		Hire_Date='Date Hired';
	format Salary dollar8. Hire_Date mmddyy10.;
	var Last_Name First_Name Country Job_Title Salary Hire_Date;
run;

proc print data=orion.sales noobs;
   var Employee_ID First_Name Last_Name 
       Job_Title;
   format First_Name Last_Name $upcase. 
          Job_Title $quote.;
run;

proc format;
	value $ctryfmt  'AU'='Australia'
					'US'='United States'
					other='Miscoded';
run;

proc print data=orion.sales noobs label;
	/*where Country='AU' and Job_Title contains 'Rep';*/
	label Job_Title='Sales Title'
		Hire_Date='Date Hired';
	format Country $ctryfmt.;
	var Last_Name First_Name Country Job_Title Salary Hire_Date;
run;

proc format;
	value tiers low-<50000='Tier1'
				50000-<100000='Tier2'
				100000<-high='Tier3';
run;

proc print data=orion.sales;
	var Employee_ID Job_Title Salary
		Country Birth_Date Hire_Date;
	format Birth_Date Hire_Date monyy7.
		Salary tiers.;
run;

data work.subset1;
	set orion.sales;
	where Country='AU' and Job_Title contains 'Rep';
run;
proc print data=work.subset1;
run;

data work.subset1;
	set orion.sales;
	where Country='AU' and 
		Job_Title contains 'Rep' and
		Hire_Date<'01jan1982'd;
	bonus=salary*.10;
run;

proc print data=work.subset1 noobs;
	var First_Name Last_Name Salary
	Job_Title Bonus Hire_Date;
	format Hire_Date date9. Salary dollar9.;
run;

proc contents data=orion.customer_dim nods;
run;
data work.youngadult;
	set orion.customer_dim;
	where customer_age between 18 and 36
		and customer_gender='F';
	where same and customer_group contains 'Gold';
	discount=.25;
run;

proc print data=work.youngadult noobs;
	id customer_id;
run;

proc contents data=orion.staff;
run;
data work.assistant;
	set orion.staff;
	where job_title contains 'Assistant' and
		salary < 26000;
	Increase=salary*.10;
	New_Salary=Salary+Increase;
run;

proc print data=work.assistant noobs;
	id Employee_ID;
	var Job_Title Salary Increase New_Salary;
	format Salary Increase New_Salary dollar12.2;
run;

proc contents data=orion.customer_dim;
run;
data work.tony;
	set orion.customer_dim;
	where Customer_FirstName=*'Tony';
run;
proc print data=work.tony;
	var Customer_FirstName Customer_LastName;
run;

data work.subset1;
   set orion.sales;
   Bonus=Salary*.10;
   where Country='AU';
   if Bonus > 3000;
run;

proc print data=work.subset1;
run;

data work.auemps;
   set orion.sales;
   Bonus=Salary*.10;
   if Country='AU' and Bonus>=3000;
run;

proc print data=work.auemps;
run;

data work.us;
   set orion.sales;
   where Country='US'; 
   Bonus=Salary*.10;
   label Job_Title='Sales Title';
   drop Employee_ID Gender Country Birth_Date;
run;
proc print data=work.us label;
run;
proc contents data=work.us;
run;

title1 'Work Increase';
title2 'Table with data';
data work.increase;
	set orion.staff;
	Increase=Salary*0.10;
   	NewSalary=Salary+Increase;
	where Emp_Hire_Date>='01jul2010'd;
	if Increase>3000;
	keep Employee_ID Emp_Hire_Date Salary Increase NewSalary;
	label  Employee_ID='Employee Id' 
		Emp_Hire_Date='Employee Hire Date'
		NewSalary='New Salary';
	format Salary NewSalary dollar12.2
		Increase comma10.;
run;
proc contents data=work.increase;
run;
proc print data=work.increase label;
run;
title;

data work.bigdonations;
   set orion.employee_donations;
   Total=sum(Qtr1,Qtr2,Qtr3,Qtr4);
   NumQtrs=n(Qtr1,Qtr2,Qtr3,Qtr4);
   if Total<50 or NumQtrs<4 then delete;
   label Qtr1='First Quarter'
         Qtr2='Second Quarter'
         Qtr3='Third Quarter'
         Qtr4='Fourth Quarter';
   drop Recipients Paid_By;
run;

proc contents data=work.bigdonations;
run;

proc print data=work.bigdonations label noobs;
run;

libname testxls excel path="g:\Estudios\MDM_TPFinal\docs\Pre-Analisis\CMVIN Tables.xlsx";
proc print data=testxls.'CMVIN DM$'n;
run;

data work.sales2;
	length First_Name $ 12 Last_Name $18 
		Gender $ 1 Job_Title $ 25 Country $2;
	*infile "\\VBOXSVR\Dev\Libros\SAS Essentials\scripts\sales.csv" dlm=",";
	infile "/home/ptz72dl/sas_e1/sales.csv" dlm=",";
	input Employee_ID $ First_Name $ Last_Name $
		Gender $ Salary Job_Title $ Country $;
run;

proc print data=work.sales2;
run;


data work.newemployees;
	length First $ 12 Last $ 18 Title $ 25
		   Salary 8;
	infile "/home/ptz72dl/sas_e1/newemps.csv" dlm=",";
	input First $ Last $ Title $ Salary $;
run;

proc print data=work.newemployees;
run;

data work.qtrdonation;
	length IDNum $ 6
		   Qtr1 8 Qtr2 8 Qtr3 8 Qtr4 8;
	infile "/home/ptz72dl/sas_e1/donation.dat" dlm=" ";
	input IDNum $ Qtr1 $ Qtr2 $ Qtr3 $ Qtr4;
run;
proc print data=work.qtrdonation;
run;

data work.sales2;
	infile "/home/ptz72dl/sas_e1/sales.csv" dlm=",";
	input Employee_ID First_Name :$12. Last_Name :$18.
		  Gender :$1. Salary Job_Title :$25. Country :$2.
		  Birth_Date :date. Hire_Date :mmddyy.;
	if Country='AU';
	keep First_Name Last_Name Salary
		 Job_Title Hire_Date;
	label Job_Title='Sales Title'
		  Hire_Date='Date Hired';
	format Salary dollar12. Hire_Date monyy7.;
run;
proc print data=work.sales2 label;
	format Birth_Data date9.;
run;

data work.newemps;
	input First_Name $ Last_Name $
 	   Job_Title $ Salary :dollar8.;
	datalines;
Steven Worton Auditor $40,450
Merle Hieds Trainee $24,025
Marta Bamberger Manager $32,000
;
run;

proc print data=work.newemps;
run;

data work.newemps2;
	infile datalines dlm=',';
	input First_Name $ Last_Name $
 	   Job_Title $ Salary :dollar8.;
	datalines;
Steven,Worton,Auditor,$40,450
Merle,Hieds,Trainee,$24,025
Marta,Bamberger,Manager,$32,000
;
run;


data work.canada_customers;
	infile "/home/ptz72dl/sas_e1/custca.csv" dlm=',';
	input First :$20. Last :$20. ID :$8. 
		  Gender :$1. BirthDate :ddmmyy. Age :$8. AgeGroup :$12.;
	format BirthDate monyy7.;
	drop ID Age;
run;
proc print data=work.canada_customers;
run;

data work.managers;
   infile datalines dlm='/';
   input ID First :$12. Last :$12. Gender $ Salary :comma. 
            Title :$25. HireDate :date.;
   datalines;
120102/Tom/Zhou/M/108,255/Sales Manager/01Jun1993
120103/Wilson/Dawes/M/87,975/Sales Manager/01Jan1978
120261/Harry/Highpoint/M/243,190/Chief Sales Officer/01Aug1991
121143/Louis/Favaron/M/95,090/Senior Sales Manager/01Jul2001
121144/Renee/Capachietti/F/83,505/Sales Manager/01Nov1995
121145/Dennis/Lansberry/M/84,260/Sales Manager/01Apr1980
;
run;
title 'Orion Star Management Team';
proc print data=work.managers noobs;
   format HireDate mmddyy10.;
run;
title;

data work.contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile "/home/ptz72dl/sas_e1/phone2.csv" dlm=',' dsd;
   input Name $ Phone $ Mobile $;
run;

proc print data=work.contacts noobs;
run;

data work.donations;
   infile "&path/donation.csv" dsd missover;
   input EmpID Q1 Q2 Q3 Q4;
run;
proc print data=work.donations;
run;


data work.prices;
   infile "&path/prices.dat" dlm='*' missover;
   input ProductID StartDate :date. 
         EndDate :date. UnitCostPrice :dollar. 
         UnitSalesPrice :dollar.;
   label ProductID='Product ID'
         StartDate='Start of Date Range'
         EndDate='End of Date Range'
         UnitCostPrice='Cost Price per Unit'
         UnitSalesPrice='Sales Price per Unit';
   format StartDate EndDate mmddyy10.
          UnitCostPrice UnitSalesPrice 8.2; 
run;
title '2007 Prices';
proc print data=work.prices label;
run;
title;

data work.comp;
   set orion.sales;
   Bonus=500;
   Compensation=sum(Salary,Bonus);
   BonusMonth=month(Hire_Date);
run;

proc print data=work.comp;
   var Employee_ID First_Name Last_Name 
       Salary Bonus Compensation BonusMonth;
run;

data work.increase;
   set orion.staff;
   keep Employee_ID Salary Birth_Date Increase NewSalary BdayQrt;
   format Salary Increase NewSalary comma8.;
   Increase=Salary*0.10;
   NewSalary=Sum(Salary,Increase);
   BdayQtr=QTR(Birth_Date);
run;

proc print data=work.increase;
run;

data work.birthday;
   set orion.customer;
   Bday2012=mdy(month(Birth_Date),
      day(Birth_Date),2012);
   BdayDOW2012=weekday(Bday2012);
   Age2012=(Bday2012-Birth_Date)/365.25;
   keep Customer_Name Birth_Date Bday2012 
        BdayDOW2012 Age2012;
   format Bday2012 date9. Age2012 3.;
run;

proc print data=work.birthday;
run;

data work.employees;
   set orion.sales;
   FullName=catx(' ',First_Name,Last_Name);
   Yrs2012=intck('year',Hire_Date,'01JAN2012'd);
   format Hire_Date ddmmyy10.;
   label Yrs2012='Years of Employment in 2012';
run; 

proc print data=work.employees label;
   var FullName Hire_Date Yrs2012;
run;

data work.comp;
   set orion.sales;
   if Job_Title='Sales Rep. III' or
      Job_Title='Sales Rep. IV' then
      Bonus=1000;
   else if Job_Title='Sales Manager' then
     Bonus=1500;
   else if Job_Title='Senior Sales Manager'
     then Bonus=2000;
   else if Job_Title='Chief Sales Officer'
     then Bonus=2500;
   else Bonus=500;
run;
 
proc print data=work.comp;
   var Last_Name Job_Title Bonus;
run;

data work.bonus;
   set orion.nonsales;
   Country=UPCASE(Country);
   if Country='US' then Bonus=500;
   else Bonus=300;
run;


data work.bonus;
	set orion.sales;
	length Freq $ 12;
	if country='US' then
		do;
			Bonus=500;
			Freq='Once a Year';
		end;
	else if country='AU' then
		do;
			Bonus=300;
			Freq='Twice a Year';
		end;
run;
proc print data=work.bonus;
	var First_Name Last_Name Country
		Bonus Freq;
run;

data work.region;
	set orion.supplier;
	length Region $ 17;
	keep Supplier_Name Country Discount Discount_Type Region;
	if Country in ('US','CA') then
		do;
			Discount=0.10;
			Discount_Type='Required';
			Region='North America';
		end;
	else do;
			Discount=0.05;
			Discount_Type='Optional';
			Region='Not North America';
		end;
run;
proc print data=work.region;
run;

data work.gifts;
   set orion.nonsales;
   length Gift1 $ 6 Gift2 $ 10;
   select(Gender);
      when('F') do;
         Gift1='Scarf';
         Gift2='Pedometer';
      end;
      when('M') do;
         Gift1='Gloves';
         Gift2='Money Clip';
      end;
      otherwise do;
         Gift1='Coffee';
         Gift2='Calendar';
      end;
   end;
   keep Employee_ID First Last 
           Gender Gift1 Gift2;
run;
proc print data=work.gifts;
run;

/** Lesson 10 - Combining Datasets **/
data work.thirdqtr;
	set orion.mnth7_2011 orion.mnth8_2011 orion.mnth9_2011;
run;
proc print data=work.thirdqtr;
run;


proc contents data=orion.sales nodetails;
run;
proc contents data=orion.nonsales nodetails;
run;
data work.allemployees;
   set orion.sales 
       orion.nonsales
       (44=(First=First_Name Last=Last_Name));
   keep Employee_ID First_Name Last_Name 
        Job_Title Salary;
run;
proc print data=work.allemployees;
run; 


proc contents data=orion.charities;
run;

proc contents data=orion.us_suppliers;
run;

proc contents data=orion.consultants;
run;

data work.contacts;
   set orion.charities orion.us_suppliers;
run;
proc contents data=work.contacts;
run;

data work.contacts2;
   set orion.us_suppliers orion.charities;
run;
proc contents data=work.contacts2;
run;

/* MERGE - One to One */
proc sort data=orion.employee_payroll
          out=work.payroll; 
   by Employee_ID;
run;

proc sort data=orion.employee_addresses
          out=work.addresses;
   by Employee_ID;
run;

proc contents data=work.payroll;
run;
proc contents data=work.addresses;
run;


data work.payadd;
	merge work.payroll 
      	  work.addresses;
	by Employee_ID;
run;

proc print data=work.payadd;
   var Employee_ID Employee_Name
       Birth_Date Salary;
   format Birth_Date weekdate.;
run;

********** Create Data **********;
data empsau;
   input First $ Gender $ EmpID;
   datalines;
Togar   M   121150
Kylie   F   121151
Birin   M   121152
;

data phones;
   input EmpID Type $ Phone $15.;
   datalines;
121150 Home +61(2)5555-1793
121150 Work +61(2)5555-1794
121151 Home +61(2)5555-1849
121152 Work +61(2)5555-1850
121152 Home +61(2)5555-1665
121152 Cell +61(2)5555-1666
;

********** One-to-Many Merge **********;
data empphones;
   merge  phones empsau;
   by EmpID;
run;

proc print data=empphones;
run;

proc contents data=orion.orders;
run;

proc contents data=orion.order_item;
run;

data work.allorders;
	merge orion.orders orion.order_item;
	by order_id;
	keep  Order_ID Order_Item_Num Order_Type 
		  Order_Date Quantity Total_Retail_Price;
run;
proc print data=work.allorders;
	where QTR(Order_Date)=4 
		and year(Order_Date)=2011;
run;

proc contents data=orion.product_list;
run;
proc sort data=orion.product_list out=work.product_list_sort;
	by product_level;
run;
data work.listlevel;
	merge orion.product_level work.product_list_sort;
	by product_level;
	keep Product_ID Product_Name Product_Level Product_Level_Name;
run;
proc print data=work.listlevel;
	where product_level=3;
run;

proc sort data=orion.product_list
          out=work.product;
   by Supplier_ID;
run;
data work.prodsup;
	merge work.product(in=prod) 
		  orion.supplier(in=sup);
	by Supplier_ID;
	if prod and not sup;
run;
proc print data=work.prodsup;
   var Product_ID Product_Name Supplier_ID 
       Supplier_Name;
run;

proc sort data=orion.customer
          out=work.customer_sort;
   by Country;
run;
data work.allcustomer;
   merge work.customer_sort(in=Cust) 
         orion.lookup_country
         (rename=(Start=Country
         Label=Country_Name) in=Ctry);
   by Country;
   keep Customer_ID Country Customer_Name 
        Country_Name;
   if Cust=1 and Ctry=1;
run;
proc print data=work.allcustomer;
run;

proc sort data=orion.orders out=work.orders_sort;
	by Employee_ID;
run;
data work.allorders;
	merge orion.staff
		  work.orders_sort(in=O);
	By employee_id;
	if O;
	keep Employee_ID Job_Title Gender Order_ID Order_Type Order_Date;
run;
data work.noorders;
	merge orion.staff(in=S)
		  work.orders_sort(in=O);
	By employee_id;
	if S and not O;
	keep Employee_ID Job_Title Gender Order_ID Order_Type Order_Date;
run;

data work.allorders work.noorders;
   merge orion.staff(in=Staff) 
         work.orders_sort(in=Ord);
   by Employee_ID;
   if Ord=1 then output work.allorders;
   else if Staff=1 and Ord=0 
      then output work.noorders;
  /* alternate statement */
  /* else output work.noorders; */
   keep Employee_ID Job_Title Gender 
        Order_ID Order_Type Order_Date;
run;
proc print data=work.allorders;
run;
proc print data=work.noorders;
run;

/** Lesson 11 - Summary Reports **/
proc freq data=orion.sales;
	tables Gender;
	where Country='AU';
run;
proc freq data=orion.sales;
   tables Country / nocum nopercent;
run;
proc format;
	value tiers low-25000 = 'Tier1'
				25000<-50000 = 'Tier2'
				50000<-100000 = 'Tier3'
				100000<-high = 'Tier4';
run;
proc freq data=orion.sales;
	tables Salary;
	format Salary tiers.;
run;

proc sort data=orion.sales out=work.sorted;
	by Country;
run;
proc freq data=work.sorted;
	tables Gender;
	 by Country;
run;

proc freq data=orion.sales;
	tables Gender*Country;
run;

proc format;
   value ordertypes
         1='Retail'
         2='Catalog'
         3='Internet';
run;

title 'Order Summary by Year and Type';
proc freq data=orion.orders ;
   tables Order_Date;
   tables Order_Type/nocum;
   tables Order_Date*Order_Type/nopercent 
          norow nocol;
   format Order_Date year4. Order_Type ordertypes.;
run;
title;

proc print data=orion.nonsales2 (obs=20);
run;

proc freq data=orion.nonsales2;
	tables Gender Country / nocum nopercent;
run;

proc freq data=orion.nonsales2 order=freq;
	tables employee_id / nocum nopercent;
run;

proc freq data=orion.nonsales2 nlevels;
   tables Gender Country Employee_ID/nocum nopercent noprint;
run;

proc freq data=orion.nonsales2 nlevels
          order=freq;
   tables Job_Title/nocum nopercent;
run;

proc print data=orion.nonsales2;
    where Gender not in ('F','M') or
          Job_Title is null or
          Country not in ('AU','US') or
          Salary not between 24000 and 500000 or
          Employee_ID is missing or
          Employee_ID=120108; 
run;

proc contents data=orion.orders;
run;
title 'Unique Customers and Salespersons for Retail Sales.';
proc freq data=orion.orders nlevels;
   tables Customer_ID Employee_ID / nofreq nocum noprint;
   where order_type=1;
run;
title;

title 'Catalog and Internet Customers.';
proc freq data=orion.orders order=freq;
   tables Customer_ID / nofreq nocum;
   where order_type<>1;
run;
title;


proc contents data=orion.qtr2_2011;
run;
proc freq data=orion.qtr2_2011 nlevels;
	tables order_id order_type;
run;

proc freq data=orion.order_fact noprint;
   tables Product_ID/out=product_orders;
run;
data product_names;
   merge product_orders orion.product_list;
   by Product_ID;
   keep Product_ID Product_Name Count;
run;

proc sort data=product_names;
   by descending Count;
run;

title 'Top Five Products by Number of Orders';
proc print data=product_names(obs=5) label 
           noobs;
   var Count Product_ID Product_Name;
   label Product_ID='Product Number'
         Product_Name='Product'
         Count='Orders';
run;
title;

proc means data=orion.sales;
	var Salary;
run;
proc means data=orion.sales;
	var Salary;
	class gender country;
run;
proc means data=orion.sales min max sum;
	var Salary;
	class gender country;
run;

proc means data=orion.nonsales2 nmiss n min max;
	var Salary;
run;

proc univariate data=orion.nonsales2 nextrobs=3;
   var Salary;
   id employee_id;
run; 

proc format;
   value ordertypes
         1='Retail'
         2='Catalog'
         3='Internet';
run;

title 'Revenue from All Orders';

proc means data=orion.order_fact sum;
	var Total_Retail_Price;
	class Order_Date Order_Type;
	format order_type ORDERTYPES. Order_date year4.;
run;

title;


title 'Number of Missing and Nonmissing 
      Date Values';
proc means data=orion.staff nmiss n nonobs;
   var Birth_Date Emp_Hire_Date Emp_Term_Date;
   class gender;
run;
title;


proc means data=orion.order_fact noprint nway;
   class Product_ID;
   var Total_Retail_Price;
   output out=product_orders 
          sum=Product_Revenue;
run;
data product_names;
   merge product_orders orion.product_list;
   by Product_ID;
   keep Product_ID Product_Name 
        Product_Revenue;
run;
proc sort data=product_names;
   by descending Product_Revenue;
run;
title 'Top Five Products by Revenue';
proc print data=product_names(obs=5) label;
   var Product_Revenue Product_ID Product_Name;
   label Product_ID='Product Number'
         Product_Name='Product'
         Product_Revenue='Revenue';
   format Product_Revenue eurox12.2;
run;
title;


proc univariate data=orion.price_current;
	var Unit_Sales_Price;
	var Factor;
run;

ods trace on;
ods select ExtremeObs;
proc univariate data=orion.shoes_tracker;
   var Product_ID;
run;
ods trace off;