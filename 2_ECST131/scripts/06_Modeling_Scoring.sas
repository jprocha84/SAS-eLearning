/********************************************
	Introduction to Predictive Modeling
*********************************************/
	%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
              Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
	%let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
                 Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
                 Masonry_Veneer Lot_Shape_2 Central_Air;

	ods graphics;
	
	proc glmselect data=statdata.ameshousing3
	               plots=all 
	               seed=8675309;
	   class &categorical / param=reference ref=first;
	   model SalePrice=&categorical &interval / 
	                  selection=stepwise
	                  select=aic
	                  choose=validate;
	   partition fraction(validate=0.3333);
	title "Selecting the Best Model using Honest Assessment";
	run;
	title;
	
	/* If you started a new SAS session after running the code for the 
	previous demonstration, you must rerun that code before the
	current demonstration code. To do this, remove the comment codes
	around this code block and run the entire program.
	*/
	%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
	              Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;
	%let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
	                 Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
	                 Masonry_Veneer Lot_Shape_2 Central_Air;
	
	ods graphics;
	
	proc glmselect data=statdata.ameshousing3
	               plots=all 
	               valdata=statdata.ameshousing4;
	   class &categorical / param=glm ref=first;
	   model SalePrice=&categorical &interval / 
	                   selection=backward
	                   select=sbc 
	                   choose=validate;
	   store out=work.amesstore;
	title "Selecting the Best Model using Honest Assessment";
	run;
	title;

	
	proc plm restore=work.amesstore;
	   score data=statdata.ameshousing4 out=scored;
	   code file="/folders/myshortcuts/SAS_Entrenamiento/ECST131/scripts/scoring.sas";
	run;
	
	data scored2;
	   set statdata.ameshousing4;
	   %include "/folders/myshortcuts/SAS_Entrenamiento/ECST131/scripts/scoring.sas";
	run;
	
	proc compare base=scored compare=scored2 criterion=0.0001;
	   var Predicted;
	   with P_SalePrice;
	run;
	
	****** Practice *******;
	proc glmselect data=statdata.ameshousing3
	               seed=8675309
	               noprint;
	   class &categorical / param=glm ref=first;
	   model SalePrice=&categorical &interval / 
	               selection=stepwise
	               select=aic 
	               choose=validate;
	   partition fraction(validate=0.3333);
	   score data=statdata.ameshousing4 out=score1;
	   store out=store1;
	   title "Selecting the Best Model using Honest Assessment";
	run;
	
	proc plm restore=store1;
	   score data=statdata.ameshousing4 out=score2;
	run;
	
	proc compare base=score1 compare=score2 criterion=0.0001;
	   var P_SalePrice;
	   with Predicted;
	run;