/* Case Study - Fitness Data */
proc contents data=statdata.fitness;
run;

proc print data=statdata.fitness (obs=10) ;
run;

