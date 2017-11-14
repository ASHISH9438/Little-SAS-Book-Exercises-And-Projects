* Show that the CLASS statement in PROC MEANS can be used to calculate ;
* summary statistics on an unsorted data set.  If the data is sorted the ;
* BY statement can be used instead.  Arguments for BY and CLASS should be ;
* A categorical variable ;

DATA test;
	INPUT Gender $ Age;
	DATALINES;
Male 33
Female 15
Male 55
Female 29
Male 12
Female 88
Female 46
Male 60
;
RUN;

PROC MEANS data = test;
	CLASS Gender;
	VAR	Age;
	TITLE1 "PROC MEANS using CLASS on unsorted data";
RUN;
	
* Note: this procedure WILL NOT work!  The following error message is generated;
* in the SAS log:  ERROR: Data set WORK.TEST is not sorted in ascending sequence.;
* The current BY group has Gender = Male and the next BY group has  Gender = Female.;
PROC MEANS data = test;
	BY Gender;
	VAR	Age;
	TITLE1 "PROC MEANS using BY on unsorted data";
RUN;