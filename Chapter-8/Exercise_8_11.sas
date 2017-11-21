/* Generate some random data with group variable*/
DATA random_norm;
	CALL streaminit(585);
	DO x = 1 to 100;
		IF x >= 1 and x <= 25 THEN Group = "Alpha";
		ELSE IF x > 25 and x <= 50 THEN Group = "Beta";
		ELSE IF x > 50 and x <= 75 THEN Group = "Delta";
		ELSE Group = "Gamma";
   		y = rand("Normal");
   		OUTPUT;
	END;
RUN;

/* Default TRANSPARENCY */
PROC SGPLOT data = random_norm;
	VBOX y / CATEGORY = Group;
	TITLE "Default TRANSPARENCY (0)";
RUN;

/* TRANSPARENCY = 0.5 */
PROC SGPLOT data = random_norm;
	VBOX y / CATEGORY = Group TRANSPARENCY = 0.5;
	TITLE "Default TRANSPARENCY = 0.5";
RUN;

/* TRANSPARENCY = 1 */
PROC SGPLOT data = random_norm;
	VBOX y / CATEGORY = Group TRANSPARENCY = 1;
	TITLE "Default TRANSPARENCY = 0";
RUN;
