/* Generate some random data */
DATA random_norm;
	CALL streaminit(585);
	DO x = 1 to 100;
   		y = rand("Normal");
   		OUTPUT;
	END;
RUN;

/* Basic scatter plot */
PROC SGPLOT data = random_norm;
	SCATTER X=x Y=y;
	TITLE "Scatterplot with no options set";
RUN;

/* Puts the numeric value on each ponit */
PROC SGPLOT data = random_norm;
	SCATTER X=x Y=y / DATALABEL = y;
	TITLE "Scatterplot with DATALABEL=y";
RUN;

/* Produces an error in SAS Log: ERROR: Variable YAXIS not found */
PROC SGPLOT data = random_norm;
	SCATTER X=x Y=y / DATALABEL = YAXIS;
	TITLE "Scatterplot with invalid DATALABEL parameter";
RUN;
