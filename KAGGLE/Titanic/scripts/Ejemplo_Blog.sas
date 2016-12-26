proc import dbms=csv out=train replace 
			datafile="/folders/myshortcuts/SAS_Entrenamiento/KAGGLE/Titanic/in_data/train.csv";
	getnames=yes;
run;

proc import dbms=csv out=test replace 
			datafile="/folders/myshortcuts/SAS_Entrenamiento/KAGGLE/Titanic/in_data/test.csv";
	getnames=yes;
run;


proc freq data=work.train;
	tables survived*sex / norow nopercent;
run;

DATA gender_submit(KEEP=survived passengerid );
	SET test;
	IF sex = "female" THEN survived = 1;
	ELSE survived = 0;
RUN;


PROC FREQ DATA = train;
  TABLES survived;
RUN;

PROC FREQ DATA = train;
  TABLES sex*survived;
RUN;

PROC FREQ DATA = train;
  TABLES pclass*sex*survived /NOCOL NOPERCENT ;
RUN;

PROC FREQ DATA = train;
  TABLES pclass*sex*survived /out = train_freq ;
RUN;

* PROC FREQ no es bueno para variables con muchos registros;
PROC FREQ DATA = train_bin;
  TABLES age *survived   ;
RUN;

DATA train_bin;
  LENGTH age_grp $20;
  SET train;
  IF .< age <= 10    THEN age_grp = "0-le10";
  ELSE IF 10<age<=20 THEN age_grp = "gt10-le20";
  ELSE IF 20<age<=30 THEN age_grp = "gt20-le30";
  ELSE IF 30<age<=40 THEN age_grp = "gt30-le40";
  ELSE IF 40<age<=50 THEN age_grp = "gt40-le50";
  ELSE IF 50<age     THEN age_grp = "gt50-le20";
RUN;

PROC FREQ DATA = train_bin;
  TABLES age_grp *survived /nocol nopercent ;
RUN;

PROC FREQ DATA = train;
  TABLES embarked*survived /NOCOL NOPERCENT PLOTS = FREQPLOT  ;
RUN;