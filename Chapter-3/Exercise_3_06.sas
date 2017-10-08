* Fun with functions.  x will be equal to 1;
* SUM(1,2,3) is equal to 6;
* 56/6 = 9.333;
* N(8) equals 1.  N() is used to count number of non-missing values;
DATA answer;
	x = MIN(SUM(1,2,3), 56/8, N(8));
RUN;

PROC PRINT data=answer;
RUN;