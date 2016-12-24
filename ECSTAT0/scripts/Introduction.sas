/* 
	Summary of the Lesson
	https://support.sas.com/edu/OLTRN/ECSTAT0R/m474/m474_6_a_sum.htm 
*/
proc contents data=statdata._ALL_  /*nods*/ ;
run;

proc print data=statdata.testscores (obs=10);
	title 'Listing of the SAT Data Set';
run;

proc means data=statdata.testscores maxdec=2 fw=10 printalltypes
	n mean median std var q1 q3;
	class Gender;
	var SATScore;
	title 'Descriptive Statistics Using PROC MEANS';
run;

proc print data=statdata.normtemp;
run;
proc means data=statdata.normtemp maxdec=2 fw=10 printalltypes
	n mean median std var q1 q3 max min qrange;
	class Gender;
	var BodyTemp;
run;

ods graphics on/width=600;
proc univariate data=statdata.testscores;
	var SATScore;
	id IDNumber;
	histogram SATScore / normal(mu=est sigma=est);
	inset skewness kurtosis / position=ne;
	probplot SATScore / normal(mu=est sigma=est);
	inset skewness kurtosis ;
	title 'Descriptive Statistics Using PROC UNIVARIATE';
run;

proc sgplot data=statdata.testscores;
	refline 1200 / axis=y lineattrs=(color=blue);
	vbox SATScore / datalabel=IDNumber;
	format IDNumber 8.;
	title 'Box Plots of SAT Scores';
run;

* Practice in the Lesson;
ods graphics on/width=800;
proc univariate data=statdata.normtemp;
	var BodyTemp HeartRate;
	id ID;
	histogram BodyTemp HeartRate / normal(mu=est sigma=est);
	inset skewness kurtosis / position=ne;
	probplot BodyTemp HeartRate / normal(mu=est sigma=est);
	inset skewness kurtosis;
	title 'Descriptive Statistics For NormTemp';
run;
proc sgplot data=statdata.Normtemp;
	refline 98.6 / axis=y lineattrs=(color=blue);
	vbox BodyTemp / datalabel=ID;
	format ID 8.;
	title 'Box Plot of Body Temperature';
run;
proc sgplot data=statdata.Normtemp;
	refline 79 / axis=y lineattrs=(color=blue);
	vbox HeartRate / datalabel=ID;
	format ID 8.;
	title 'Box Plot of Heart Rate';
run;

proc means data=statdata.testscores maxdec=4
	n mean stderr clm /*alpha=.01*/;
	var SATScore;
	title '95% Confidence Interval for SAT';
run;

proc means data=statdata.normtemp maxdec=4
	n mean stderr clm;
	var BodyTemp;
	title '95% Confidence Interval for Body Temperature';
run;
/* Hypothesis Testing */

ods select testsforlocation;
proc univariate data=statdata.testscores mu0=1200;
	var SATScore;
	title 'Testing Wheter the Mean of SAT Scores = 1200';
run;

/* Practice */
ods select testsforlocation;
proc univariate data=statdata.normtemp mu0=98.6;
	var BodyTemp;
	title 'Hypothesis Test for BodyTemp variable';
run;