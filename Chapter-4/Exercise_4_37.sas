libname ch4 'U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter4_data';

/* Variable attributes can be viewed with either PROT CONTENTS or
by looking at the proporties of the data set in Explorer pane 

Label for Color is "Crayon name" and the format is $26.*/
PROC CONTENTS data = ch4.crayons;
RUN;

/* 1949 issued the highest number of new colors at 40 */
PROC FREQ data = ch4.crayons;
	TABLES Issued;
RUN;

PROC SORT data = ch4.crayons out = crayons_sort SORTSEQ = LINGUISTIC (NUMERIC_COLLATION = ON);
	BY RGB;
RUN;

PROC PRINT data = crayons_sort NOOBS;
	VAR Color RGB;
RUN;
