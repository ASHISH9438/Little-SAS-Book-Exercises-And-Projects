* Create a small dataset with dates and test using DATEw or MMDDYYw date input and output formats ;

DATA datetest;
	INPUT date1: DATE10. date2: MMDDYY10.;
	* Note: DATE10 will produce an error since the dates are not in ddmmmyyyy format ;
	FORMAT date1-date2 MMDDYY10.;
	DATALINES;
09/01/2015 09/01/2015
10/01/2015 10/01/2015
11/01/2015 11/01/2015
12/01/2015 12/01/2015
07/04/1776 07/04/1776
;
RUN;