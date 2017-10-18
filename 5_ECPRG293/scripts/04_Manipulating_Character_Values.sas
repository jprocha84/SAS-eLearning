/********************************************
	Extracting and Transforming Character Values
	- https://support.sas.com/edu/OLTRN/ECPRG293/m434/m434_5_a_sum.htm
*********************************************/
	data charities(drop=Len);
		length ID $ 5;
		set orion.biz_list;
		Len=length(Acct_Code);
		if substr(Acct_Code,Len,1)='2';
		ID=substr(Acct_Code,1,Len-1);
		Name=propcase(name);
	run;
	* Alternative Way;
	data charities_1(drop=Code_Rt);
		length ID $ 5;
		set orion.biz_list;
		Code_Rt=right(Acct_Code);
		if char(Code_Rt,6)='2';
		ID=left(substr(Code_Rt,1,5));
	run;
	proc print data=charities noobs;
		var ID Name;
	run;

	* Practice 1;
	data code;
		set orion.au_salesforce;
		length FCode1 FCode2 $ 1 LCode $ 4;
		FCode1=lowcase(substr(First_Name,1,1));
		FCode2=lowcase(substr(First_Name,length(First_Name),1));
		LCode=lowcase(substr(Last_Name,1,4));
	run;
	title 'Extracted Letters for User IDs';
	proc print data=code;
		var First_Name FCode1 FCode2 Last_Name LCode;
	run;
	
	* Practice 2;
	data small;
		set orion.newcompetitors;
		Type=char(left(substr(ID,3,length(ID))),1);
		if Type=1;
			City=propcase(City);
	run;
	proc print data=small;
		var City;
	run;
	
/********************************************
	Separating and Concatenating Character Values
*********************************************/
	data labels(keep=FullName Address1 Address2);
		set orion.contacts;
		length FMName LName $ 15
			   FullName $ 50;
		FMName = scan(Name,2,',');
		LName =  scan(Name,1,',');
		FullName = catx(' ',Title,FMName,LName);
	run;
	proc print data=labels noobs;
		var FullName Address1 Address2;
	run;
	
/********************************************
	Finding and Modifying Character Values
*********************************************/
	data correct;
		set orion.clean_up;
		if find(Product,'Mittens','I')>0 then do;
			substr(Product_ID,9,1)='5';
			Product=tranwrd(Product,'Luci','Lucky');
		end;
		Product=propcase(Product);
		Product_ID=compress(Product_ID);
	run;
	proc print data=correct;
	run;
	
	* Practice 1;
	data names(keep=New_Name Name Gender);
		set orion.customers_ex5;
		FMName = propcase(scan(Name,2,','));
		LName =  propcase(scan(Name,1,','));
		if Gender='M' then do;
			New_Name = catx(' ','Mr.',FMName,LName);
		end;
		else do;
			New_Name = catx(' ','Ms.',FMName,LName);
		end;
	run;
	proc print data=names;
	run;
	
	data silver gold platinum;
		set orion.customers_ex5;
		keep Customer_ID Name Country;
		Customer_ID=tranwrd(Customer_ID,'-00-','-15-');
		if find(Customer_ID,'silver','I')>0 then do;
			output silver;
		end;
		else if find(Customer_ID,'gold','I')>0 then do;
			output gold;
		end;
		else if find(Customer_ID,'platinum','I')>0 then do;
			output platinum;
		end;
	run;
	proc print data=silver;
		title 'Silver-Level Customer';
	run;
	proc print data=gold;
		title 'Gold-Level Customer';
	run;
	proc print data=platinum;
		title 'Platinum-Level Customer';
	run;
	
	* Practice 2;
	data split;
		set orion.employee_donations;
		PctLoc=find(Recipients,'%');
		if PctLoc > 1 then do;
			Charity=substr(Recipients,1,PctLoc);
			output;
			Charity=substr(Recipients,PctLoc+3);
			output;
		end;
		else do;
	    	Charity=trim(Recipients)!!' 100%';
	     	output;
	   	end;
	   	drop PctLoc Recipients;
	run;
	title 'Charity Contributions for each Employee';
	proc print data=work.split noobs;
	   var Employee_ID Charity;
	run;
	title;