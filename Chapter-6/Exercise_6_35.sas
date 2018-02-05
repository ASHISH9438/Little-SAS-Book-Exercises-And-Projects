libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* part a - the data set is sorted by student_id.  This is a bit more
obvious if we re-sort the dataframe by family_id instead. */

proc sort data = ch6.schoolsurvey out = schoolsurvey_sort;
	by family_id;
run;

/* part b - create a dataset that has one observation for every
6th grader.  Use data sorted by family id for merge in part c 
and drop/rename variables as needed so they appear correctly in merge*/

data grade6(drop = school grade student_id rename=(dob = grade6dob));
	set schoolsurvey_sort;
	if grade = '6th';
run;

/* part c - recombine the data from part b with the original data
and calculate the age difference between 6th graders and their siblings */
data grade6_merge;
	merge schoolsurvey_sort grade6;
	by family_id;

	agediff = dob - grade6dob;
run;

/* part d - calculate number of younger and older siblings of each 6th grader */
proc freq data = grade6_merge noprint;
	by family_id;
	where agediff > 0;
	tables family_id / out = older_freq(drop = percent rename = (COUNT = NumOlderSiblings));
run;

proc freq data = grade6_merge noprint;
	by family_id;
	where agediff < 0;
	tables family_id / out = younger_freq(drop = percent rename = (COUNT = NumYoungerSiblings));
run;
