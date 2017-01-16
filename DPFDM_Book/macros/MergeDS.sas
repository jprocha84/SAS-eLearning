%macro MergeDS(List, IDVar, ALL);
	/* 5.7.1 Merging */
	data &ALL;
		merge &List;
		by &IDVar;
	run;
%mend;