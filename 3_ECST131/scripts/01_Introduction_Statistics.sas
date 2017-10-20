/*Program A*/
proc contents data=statdata.cars;
run;
proc surveyselect data=Statdata.cars    /* sample from data table */
                  seed=31475            /* recommended that you use this option */
                  method=srs            /* simple random sample */
                  sampsize=12           /* sample size */
                  out=work.CarSample12; /* sample stored in this data set */
run; 

proc print data=work.CarSample12; 
run;
/*Program B*/
proc surveyselect data=Statdata.cars    /* sample from data table */
                  seed=13094425         /* recommended that you use this option */
                  method=srs            /* simple random sample */
                  samprate=0.05         /* 0 < sampling rate < 1 */
                  out=work.cars12pc;    /* sample stored in this data set */
run;  

proc print data=work.cars12pc; 
run;

/* The means procedure */
proc means data=statdata.testscores
           maxdec=2 fw=10 printalltypes;
   class Gender;
   var SATScore;
   title 'Descriptive Statistics Using PROC MEANS';
run;
/* Practice */
proc means data=statdata.normtemp
          maxdec=2 fw=10 printalltypes
          n mean std q1 q3;
  var BodyTemp;
  class Gender;
  title 'Selected Descriptive Statistics for Body Temp';
run;
title;

/*******************************\
| 	Picturing Your Data 				|
\*******************************/
proc univariate data=statdata.testscores;
   var SATScore;
   id IDNumber;
   histogram SATScore / normal(mu=est sigma=est);
   inset skewness kurtosis / position=ne;
   probplot SATScore / normal (mu=est sigma=est);
   inset skewness kurtosis;
   title 'Descriptive Statistics Using PROC UNIVARIATE';
run;


ods graphics on/width=600;
proc univariate data=statdata.testscores;
   var SATScore;
   id idnumber;
   histogram SATScore / normal(mu=est sigma=est);
   inset skewness kurtosis / position=ne;
   probplot SATScore / normal(mu=est sigma=est);
   inset skewness kurtosis;
   title 'Descriptive Statistics Using PROC UNIVARIATE';
run;
title;
proc sgplot data=statdata.testscores;
   refline 1200 / axis=y lineattrs=(color=blue); 
   vbox SATScore / datalabel=IDNumber; 
   format IDNumber 8.;
   title "Box Plots of SAT Scores";
run;
title;

proc means data=statdata.testscores maxdec=4 
           n mean stderr clm;
   var SATScore;
   title '95% Confidence Interval for SAT';
run;
proc means data=statdata.testscores maxdec=4 
           n mean stderr clm alpha=.01;
   var SATScore;
   title '95% Confidence Interval for SAT';
run;


ods select testsforlocation;
proc univariate data=statdata.testscores mu0=1200;
   var SATScore;
   title 'Testing Whether the Mean of SAT Scores = 1200';
run;
