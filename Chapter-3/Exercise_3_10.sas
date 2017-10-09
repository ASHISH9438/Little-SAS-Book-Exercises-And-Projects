* Little SAS Book Exercises and Projects example to show;
* How setting YEARCUTOFF to a date after a date in the raw;
* data will effect the output when using MMDDYY10. format;

* YEARCUTOFF specifies the first 100 year span for SAS to use;
* and the output in MMDDYY10. format for 01/01/1920 read in using;
* MMDDYY8. format with YEARCUTOFF=1950 will be 01/01/2019;

OPTIONS YEARCUTOFF=1950;

DATA datetest;
 INPUT date MMDDYY8.;
 DATALINES;
01/01/1920
;
 RUN;
 
PROC PRINT data = datetest;
  FORMAT date MMDDYY10.;
RUN;