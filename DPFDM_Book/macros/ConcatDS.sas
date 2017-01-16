%macro ConcatDS(List, ALL);
	data &ALL;
		set &List;
	run;
%mend;