/* Generate some random data with group variable*/
DATA random_norm;
	CALL streaminit(585);
	DO x = 1 to 10000;
   		y = rand("Normal");
   		OUTPUT;
	END;
RUN;

/* Example with histogram first.  The density plot is overlaid on top
of the histogram, making it easier to see */
PROC SGPLOT data = random_norm;
	HISTOGRAM y;
	DENSITY y;
	TITLE "Histogram and Density of Normal, Histogram First";
RUN;

/* Example with the density plot first.  The density plot will be behind
the histogram, which obscures it */
PROC SGPLOT data = random_norm;
	DENSITY y;
	HISTOGRAM y;
	TITLE "Histogram and Density of Normal, Density First";
RUN;