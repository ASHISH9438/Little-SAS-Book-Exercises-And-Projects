LIBNAME ch4 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter4_data";

* Part A - Compute the overall mean, minimum, and maximum of Score1 and Score2;
PROC MEANS data = ch4.diving MAXDEC=2 MEAN MIN MAX;
	VAR Score1 Score2;
	TITLE "Overall Mean, Minimum, and Maximum of Scoring Methods";
RUN;

* Part B - Sum the 6 new scoring method scores per driver, output the results to
a new data set, and add a comment for the top three scores ;
PROC MEANS data = ch4.diving MAXDEC=2 SUM NOPRINT;
	BY Name;
	VAR Score2;
	OUTPUT OUT = divingsum(drop=_FREQ_ _TYPE_) SUM(Score2) = Score2Sum;
RUN;

* Qin Kai = Gold
He Chong = Silver
Hausdin Patrick = Bronze ;
PROC REPORT data = divingsum;
	COLUMN Name Score2Sum;
	DEFINE Score2Sum /
		DESCENDING ORDER 'Overall Score';
	TITLE "Overall Score Per Diver";
RUN;

* Part C - Count scores per diver after recoding scores;
PROC FORMAT;
	VALUE scorerecode
	LOW - 0.5 = "Completely Failed"
	0.5 -< 2.5 = "Unsatisfactory"
	2.5 -< 5.0 = "Deficient"
	5.0 -< 7.0 = "Satisfactory"
	7.0 -< 8.5 = "Good"
	8.5 -< 9.5 = "Very Good"
	9.5 - HIGH = "Excellent"
	;
RUN;


PROC FREQ data = ch4.diving;
	TABLES Name * J1-J7;
	FORMAT J1-J7 scorerecode.;
	TITLE "Scores Given By Judge";
RUN;

* Part D - Calculate the minimum and maximum score per dive for each diver.
Present results by diver and in dive number order;
PROC REPORT data = ch4.diving;
	COLUMN Name Dive J1-J7 MinVal MaxVal;
	DEFINE Name / GROUP;
	DEFINE Dive / GROUP;
	DEFINE J1-J7 / NOPRINT;
	DEFINE MinVal /	COMPUTED;
		COMPUTE MinVal;
			MinVal = MIN(J1.SUM, J2.SUM, J3.SUM, J4.SUM, J5.SUM, J6.SUM, J7.SUM);
		ENDCOMP;
	DEFINE MaxVal / COMPUTED;
		COMPUTE MaxVal;
			MaxVal = MAX(J1.SUM, J2.SUM, J3.SUM, J4.SUM, J5.SUM, J6.SUM, J7.SUM);
		ENDCOMP;
	TITLE "Minimum and Maximum Scores Per Dive";
RUN;
