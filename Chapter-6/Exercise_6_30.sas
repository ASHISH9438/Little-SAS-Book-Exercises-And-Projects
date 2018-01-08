libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* Sort TEACHERS.  DISTRICT is already sorted */
proc sort data = ch6.teachers out = work.teachers_sort;
	by TeacherScore CurriculumGrd;
run;

/* Merge the DISTRICT and TEACHERS SAS data sets and remove observations that do not
correspond to a teacher */
data teachers_join;
	merge ch6.district (rename=(TS=TeacherScore CG=CurriculumGrd)) work.teachers_sort;
	by TeacherScore CurriculumGrd;
	if Teacher ^= "";
run;

/* Sort joined data set, overwrite original data */
proc sort data = teachers_join;
	by Teacher;
run;
