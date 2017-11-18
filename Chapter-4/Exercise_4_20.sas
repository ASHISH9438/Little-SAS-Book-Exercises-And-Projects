* Show different behaviors of PROC REPORT with no options depending on what ;
* data is used ;

DATA test;
	INPUT Age Weight;
	DATALINES;
33 189
15 145
55 177
29 112
12 110
88 123
46 180
60 199
;
RUN;

DATA test2;
	INPUT Sex $ Age Weight;
	DATALINES;
Male 33 189
Male 15 145
Male 55 177
Female 29 112
Female 12 110
Female 88 123
Female 46 180
Male 60 199
;
RUN;

PROC REPORT data = test;
RUN;

PROC REPORT data = test2;
RUN;