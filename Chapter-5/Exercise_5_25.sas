LIBNAME ch5 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter5_data";

* Part A - Create a table of counts by year of issue.  Create a second report with
color hex and year of issue for each crayon.  Send reports to default destination;
PROC FREQ data = ch5.crayons;
	TABLE Issued;
	TITLE "Number of Crayon Colors Issued by Year";
RUN;

PROC PRINT data = ch5.crayons;
	VAR Color Hex Issued;
	TITLE "Listing of Crayons with Hexidecimal Color Codes";
RUN;

* Part B - Save Part A as text.;
ODS LISTING FILE = "U:\crayons.txt";
ODS NOPROCTITLE;
PROC FREQ data = ch5.crayons;
	TABLE Issued;
	TITLE "Number of Crayon Colors Issued by Year";
RUN;

PROC PRINT data = ch5.crayons;
	VAR Color Hex Issued;
	TITLE "Listing of Crayons with Hexidecimal Color Codes";
RUN;
ODS LISTING CLOSE;

* Part C - Save Part A as HTML.;
ODS HTML FILE = "U:\crayons.html";
ODS NOPROCTITLE;
PROC FREQ data = ch5.crayons;
	TABLE Issued;
	TITLE "Number of Crayon Colors Issued by Year";
RUN;

PROC PRINT data = ch5.crayons;
	VAR Color Hex Issued;
	TITLE "Listing of Crayons with Hexidecimal Color Codes";
RUN;
ODS HTML CLOSE;

* Part D - Save Part A as RTF.;
ODS RTF FILE = "U:\crayons.rtf";
ODS NOPROCTITLE;
PROC FREQ data = ch5.crayons;
	TABLE Issued;
	TITLE "Number of Crayon Colors Issued by Year";
RUN;

PROC PRINT data = ch5.crayons;
	VAR Color Hex Issued;
	TITLE "Listing of Crayons with Hexidecimal Color Codes";
RUN;
ODS RTF CLOSE;

* Part E - Save Part A as PDF.;
ODS PDF FILE = "U:\crayons.pdf";
ODS NOPROCTITLE;
PROC FREQ data = ch5.crayons;
	TABLE Issued;
	TITLE "Number of Crayon Colors Issued by Year";
RUN;

PROC PRINT data = ch5.crayons;
	VAR Color Hex Issued;
	TITLE "Listing of Crayons with Hexidecimal Color Codes";
RUN;
ODS PDF CLOSE;
