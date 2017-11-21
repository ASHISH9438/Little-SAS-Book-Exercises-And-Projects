/* Generate some random data with group variable*/
DATA random_norm;
	CALL streaminit(585);
	DO x = 1 to 100;
   		y = rand("Normal");
   		OUTPUT;
	END;
RUN;

/* Modify points of scatterplot with MARKERATTRS= */
PROC SGPLOT data = random_norm;
	SCATTER X=x Y=y / MARKERATTRS = (SYMBOL = STAR SIZE = 4MM);
	TITLE "MARKERATTRS options";
RUN;
