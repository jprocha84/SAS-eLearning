%macro VarMode(TransDS, XVar, IDVar, OutDS);
	proc sql noprint;
		create table &OutDS as
			select &IDVar, Min(&XVar) as mode
			from (
				select &IDVar, &Xvar
				from &TransDS p1
				group by &IDVar, &Xvar
				having count(*)=
					(select max(cnt)
					 from (select count(*) as cnt
					 	   from &TransDS p2
					 	   where p2.&IDVar=p1.&IDVar
					 	   group by p2.&Xvar
					 	   ) as p3
					 )
				) as p
			group by p.&IDVar;
	quit;
%mend;