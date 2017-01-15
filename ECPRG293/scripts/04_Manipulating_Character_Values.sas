/********************************************
	Extracting and Transforming Character Values
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
	