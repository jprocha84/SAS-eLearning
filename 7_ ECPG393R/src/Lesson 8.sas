/*
 * 	Lesson 8: Reading Multiple Raw Data Files
 */
	%let path=/folders/myshortcuts/3_Estudios/3.3 - SAS/7 - ECPG393R/data; 
	libname orion "&path";
	
	* Flexible Programming: Combining Raw Data Files Vertically;
		filename MON("&path/mon1.dat"
					 "&path/mon2.dat"
					 "&path/mon3.dat");
		data quarter;
			infile MON dlm=',';
			input CustomerID OrderID OrderType
				  OrderDate :date9. DeliveryDate :date9.;
		run;
		
		proc print data=quarter;
			title 'quarter';
		run;
		title;
		
		* Using the INFILE Statement to Combine Raw Data Files;
		data rollingqtr;
			drop m;
			do m=11,10,9;
				NextFile = cats("&path/mon",m,".dat");
				infile ORD filevar=NextFile dlm=',';
				input CustomerID
					  OrderID
					  OrderType
					  OrderDate :date9.
					  DeliveryDate :date9.;
				output;
			end;
			stop;
		run;
		proc print data=rollingqtr;
		run;
		
		* Using a Dynamic Program to Combine Raw Data Files - Fixed to read all records;
		data rollingqtr;
			drop m;
			MonNum=month(today());
			MidMon=month(intnx('month', today(), -1));
			LastMon=month(intnx('month', today(), -2));
			do m=MonNum, MidMon, LastMon;
				NextFile=cats("&path/mon",m,".dat");
				infile ORD filevar=NextFile dlm=',' end=LastObs;
				do while(not LastObs);
					input CustomerID
						  OrderID
						  OrderType
						  OrderDate :date9.
						  DeliveryDate :date9.;
					output;
				end;
			end;
			stop;
		run;
		proc print data=rollingqtr;
			title 'rollingqtr';
		run;
		title;
		
		* Practice: Level 1 & 2;
			data alllevels;
			   drop m;
			   length CustomerName $ 40 CustomerAgeGroup $ 12 CustomerType $ 40 
		           	  CustomerGroup $ 40;
			   do m=1, 2, 3;
			   		NextFile=cats("&path/level",m,".dat");
			   		infile ORD filevar=NextFile dlm=',' end=LastObs;
			   		do while(not LastObs);
					    input CustomerName $ CustomerAgeGroup $ CustomerType $ 
					          CustomerGroup $;
					    output;
			   		end;
			   end;
			   stop;
			run;
			proc print data=alllevels;
			run;
