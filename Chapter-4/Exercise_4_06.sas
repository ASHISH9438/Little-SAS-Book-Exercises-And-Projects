DATA random;
	INPUT Q1 Q2 Q3 Q4;
	DATALINES;
12	66	58	11
12	88	66	75
16	66	55	84
13	54	37	89
;
RUN;

*PROC PRINT, no options;
PROC PRINT data = random;
	TITLE1 "PROC PRINT with no VAR statement";
RUN;

* Has errors ;
PROC PRINT data = random;
	TITLE1 "Var Q1, Q2, Q3";
	VAR Q1, Q2, Q3;
RUN;

* This one is correct and will run with no errors. ;
PROC PRINT data = random;
	TITLE1 "Var Q1 Q2 Q3";
	VAR Q1 Q2 Q3;
RUN;

* Has errors. ;
PROC PRINT data = random;
	TITLE1 "Var (Q1 to Q3)";
	VAR (Q1 to Q3);
RUN;
