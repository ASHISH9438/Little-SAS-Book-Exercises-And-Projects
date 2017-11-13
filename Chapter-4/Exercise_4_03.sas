/* Create a temporary data set with subject ages, sex, and weight to demonstrate
sorting using PROC SORT 

The DESCENDING keyword in the PROC SORT BY statement must come BEFORE the variable
to sort */

DATA weights;
	INPUT age sex $ weight ;
	DATALINES;
18	Male	201
18	Female	188
18	Male	183
18	Female	121
18	Female	150
16	Female	109
23	Male	210
33	Female	198
12	Female	78
14	Male	98
;
RUN;

PROC SORT data = weights out = weights_sort;
	BY age descending sex descending weight;
RUN;

PROC PRINT data = weights_sort;
RUN;
