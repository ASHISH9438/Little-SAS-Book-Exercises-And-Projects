LIBNAME ch4 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter4_data";

* Part A - What is the variable type for Rating? ;
* Numeric ;
PROC CONTENTS data = ch4.pizzaratings varnum;
RUN;

* Part B - Use PROC FORMAT to convert numeric ratings to ;
* text description of each rating ;
PROC FORMAT;
	VALUE rating 
	. = "N/A"
	1 = "Never"
	2 = "Might"
	3 = "At least once"
	4 = "Occasionally"
	5 = "Often"
	;
RUN;

PROC PRINT data = ch4.pizzaratings;
	FORMAT Rating rating.;
	TITLE "Pizza Topping Survey Data";
RUN;

* Part C - Count non-missing observations and calculate average ;
* Rating.  Count should be a whole number, and report average to ;
* three decimal places ;
PROC SORT data = ch4.pizzaratings out = pizzasort;
	BY Topping;
	WHERE Rating <> .;
RUN;

PROC MEANS data = pizzasort maxdec= 3;
	BY Topping;
	VAR Rating;
	TITLE "Mean Pizza Topping Rating Using PROC MEANS";
RUN;


* Part D - Accomplish the same task in Part D using a different ;
* procedure ;
PROC TABULATE data = ch4.pizzaratings FORMAT = 5.3;
	CLASS Topping;
	VAR Rating;
	TABLE Topping, MEAN*Rating;
	TITLE "Mean Pizza Topping Rating Using PROC TABULATE";
RUN;
