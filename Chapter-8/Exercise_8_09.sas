/* Generate some random data */
DATA random_norm;
	CALL streaminit(585);
	DO x = 1 to 100;
   		y = rand("Normal");
   		OUTPUT;
	END;
RUN;

/* Basic scatter plot showing the use of GRID option
GRID option will create lines at each tick mark on axis*/
PROC SGPLOT data = random_norm;
	SCATTER X=x Y=y;
	XAXIS GRID;
	YAXIS GRID;
	TITLE "Scatterplot X-axis and Y-axis Grid";
RUN;
