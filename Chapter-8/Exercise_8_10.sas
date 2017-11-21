/* Generate some random data */
DATA random_norm;
	CALL streaminit(585);
	DO x = 1 to 100;
   		y = rand("Normal");
   		OUTPUT;
	END;
RUN;

/* Random data with label for x */
DATA random_norm_label;
	CALL streaminit(585);
	DO x = 1 to 100;
   		y = rand("Normal");
   		OUTPUT;
	END;

	LABEL x = "Iteration Number";
RUN;

/* Label X-axis by using XAXIS LABEL= option */
PROC SGPLOT data = random_norm;
	SCATTER X=x Y=y;
	XAXIS LABEL="Updated X-axis with XAXIS LABEL=";
	TITLE "Random Normal with Unlabeled Variable";
RUN;

/* Label X-axis using label from DATA step */
PROC SGPLOT data = random_norm_label;
	SCATTER X=x Y=y;
	TITLE "Random Normal with Labeled Variable";
RUN;

/* Label X-axis using LABEL statement in PROC SGPLOT */
PROC SGPLOT data = random_norm_label;
	SCATTER X=x Y=y;
	LABEL x = "PROC SGPLOT LABEL= Statement";
	TITLE "Using LABEL statement in PROC SGPLOT";
RUN;
