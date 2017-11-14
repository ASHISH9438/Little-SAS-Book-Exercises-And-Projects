* Example of an output statistic list.  Mean age of males and females ;
* is calculated and output to new variables FemaleAge and MaleAge ;

* Number of variables input into the statistic must match the number of ;
* variables in the output list ;
DATA test;
	INPUT Males Females;
	DATALINES;
12 56
15 88
79 56
14 67
46 55
37 46
12 7
44 65
;
RUN;

PROC MEANS data = test;
	OUTPUT OUT = test_means
	MEAN(Females Males) = FemaleAge MaleAge;
RUN;
	
PROC PRINT data = test_means;
	TITLE1 "PROC MEANS data with output statistic list";
RUN;