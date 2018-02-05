libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* part b - join users and projects data sets.  Data is already sorted
by UserID */

proc sort data = ch6.users out = users_sort nodup;
	by userid;
run;

proc sort data = ch6.projects out = projects_sort nodup;
	by userid;
run;

/* part c - create datasets for users with no projects, projects with
no end date, and projects with an end date.  Do this in the same step
as merging the two data sets */

/* part d - add a cumulative count of projects finished for each user
id.  Only completed projects to be included*/

data users_projects complete incomplete no_project;
	merge users_sort projects_sort;
	by userid;

	if first.userid then total = 0;
	if enddate <> . then total + 1;

	if enddate <> . then output complete;
	if enddate = . then output incomplete;
	if projectid = . then output no_project;
	output users_projects;
run;

