libname ch8 '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter8_data';

/* Create format for different responses */
PROC FORMAT;
	VALUE Response	0 = "Answer 0"
					1 = "Answer 1"
					2 = "Answer 2"
					3 = "Answer 3"
					. = "Missing Response"
	;
RUN;

/* Create barplot */
PROC SGPLOT data = ch8.wls;
	VBAR Q1 / MISSING;
	FORMAT Q1 Response.;
	TITLE "Survey Response at Visit 1 for Question 1";
RUN;