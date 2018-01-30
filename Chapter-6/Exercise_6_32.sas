libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* part a - join visist and txgroup data sets 
*part b - address duplicate entries in txgroup before merge */

/* Examine txgroup data to find which subjects contain duplicate
entries */

proc freq data = ch6.txgroup noprint;
	by id;
	tables id tx / out = subject_duplicates;
run;

proc print data = subject_duplicates;
	title "Duplicate subjects in txgroup data set";
	where count > 1;
run;

/* Use proc sort nodup option to remove duplicate subjects
upon sorting */

proc sort data = ch6.visits out = visits_sort nodup;
	by id;
run;

proc sort data = ch6.txgroup out = txgroup_sort nodup;
	by id;
run;

/* Merge sorted data sets with duplicate subjects removed */
data complete;
	merge visits_sort txgroup_sort;
	by id;
run;

/* part c - calculate the median baseline cholesterol and group
patients into groups either above or below median baseline cholesterol */
proc means data = ch6.visits median noprint;
	var b_cholesterol;
	output out = median_cholesterol median(b_cholesterol) = chol_median;
run;

/* use call symput to get median baseline cholesterol */
data _null_;
	set median_cholesterol;
	call symput("med", chol_median);
run;

%put Median baseline cholesterol value is &med;

data complete_groups;
	set complete;
	length Group $40;
	if b_cholesterol <= &med then group = "Less than or equal to median";
	else if b_cholesterol > &med then group = "Greater than median";
	else group = "Unknown"; 
run;

/* part d - schedule new visits every 30 days from baseline 
SAS arrays do not work with index beginning at 0. */
data schedule(rename=(visitdt=visitnumber0));
	set complete_groups;

	array visitday (3) visitnumber1-visitnumber3;
	do i = 1 to 3 by 1;
		visitday(i) =  visitdt + (i * 30);
	end;
	
	drop visit i;
	format visitdt mmddyy10. visitnumber1-visitnumber3 mmddyy10.;
run;
