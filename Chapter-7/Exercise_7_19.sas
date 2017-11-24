libname ch7 'U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter7_data';
OPTIONS SYMBOLGEN;

/* Macro using %LET statements */

/* Part A */
%LET tableVar=Origin;
%LET dataVal=Thailand;

PROC FREQ data = ch7.cats;
	TABLES &tableVar;
	TITLE "Cat Breeds by Origin";
RUN;

PROC PRINT DATA = ch7.cats;
	WHERE &tableVar = "&dataVal";
	TITLE "Cat Breeds with &tableVar = &dataVal";
RUN;

/* Part B */
%LET tableVar=Derivation;
%LET dataVal=Mutation;

PROC FREQ data = ch7.cats;
	TABLES &tableVar;
	TITLE "Cat Breeds by &tableVar";
RUN;

PROC PRINT DATA = ch7.cats;
	WHERE &tableVar = "&dataVal";
	TITLE "Cat Breeds with &tableVar = &dataVal";
RUN;

/* Part C */
%MACRO catanalysis(tableVar=, dataVal=);
	ODS PDF FILE = "CatRpt_&tableVar..pdf";
	PROC FREQ data = ch7.cats;
		TABLES &tableVar;
		TITLE "Cat Breeds by &tableVar";
	RUN;
	
	PROC PRINT DATA = ch7.cats;
		WHERE &tableVar = "&dataVal";
		TITLE "Cat Breeds with &tableVar = &dataVal";
	RUN;
	ODS PDF CLOSE;
%MEND catanalysis;

%catanalysis(tableVar=Origin, dataVal=Thailand)
%catanalysis(tableVar=Derivation, dataVal=Mutation)