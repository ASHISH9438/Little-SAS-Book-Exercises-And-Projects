LIBNAME ch4 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter4_data";

* Part A - count the total guests by registration type ;
PROC TABULATE data = ch4.conference;
	CLASS RegType;
	TABLES RegType;
RUN;

* Part B - create a format that will display VegMeal variable 
as either Yes or No and apply to data. ;
PROC FORMAT;
	VALUE needsveg
	0 = "No"
	1 = "Yes"
	;
RUN;

PROC PRINT data = ch4.conference;
	VAR FirstName LastName VegMeal;
	FORMAT VegMeal needsveg.;
	TITLE "Meal Requirements for Conference Participants";
RUN;

* Part C - create a table that shows total fees paid per area code and 
registration type within the area code.  Report using dollar format
to two decimal places ;
PROC TABULATE data = ch4.conference FORMAT = DOLLAR9.2;
	CLASS AreaCode RegType;
	VAR Rate;
	TABLE AreaCode, SUM=''*Rate=''*RegType="Registration Type";
	TITLE "Total Fees Collected Per Area Code and Registration Type";
RUN;

* Part D - create a table of total number of attendees and overall
percentage per area code and registration type, as well as total and percent
for each area code. Present only these statistics and report percentage to 
two decimal places;
PROC FREQ data = ch4.conference;
	TABLES AreaCode * RegType /
		LIST NOCUM;
	TITLE "Total and Percent Attendees by Area Code and Registration Type with PROC FREQ";
RUN;

* Part E - repeat part D using a different method. ;
PROC TABULATE data = ch4.conference;
	CLASS AreaCode RegType;
	TABLE AreaCode, N='Total Count'*RegType='Registration Type' PCTN='Overall Percentage'*RegType='Registration Type';
	TITLE "Total and Percent Attendees by Area Code and Registration Type with PROC TABULATE";
RUN;
