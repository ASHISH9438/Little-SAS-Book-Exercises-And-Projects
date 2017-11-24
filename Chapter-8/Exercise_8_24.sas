libname ch8 'U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter8_data';

/* Create format for different responses */
PROC FORMAT;
	VALUE Response	0 = "Answer 0"
					1 = "Answer 1"
					2 = "Answer 2"
					3 = "Answer 3"
					. = "Missing Response"
	;
RUN;

/* Create barplot of responses at Visit 1 (Q1) */
PROC SGPLOT data = ch8.wls;
	VBAR Q1 / MISSING;
	FORMAT Q1 Response.;
	XAXIS LABEL="Response";
	TITLE "Frequency of Survey Responses at Visit 1 for Question 1";
RUN;

/* Create barplot of mean BMI per response.  No need for 
PROC MEANS first, SGPLOT can calculate when plotting */
PROC SGPLOT data = ch8.wls;
	VBAR Q1 / MISSING
	STAT = MEAN
	RESPONSE = BMI;
	TITLE "Mean BMI Per Response at Visit 1 for Question 1";
	XAXIS LABEL="Response";	
	FORMAT Q1 Response.;
RUN;

/* Same as above, but include standard error limit lines */
PROC SGPLOT data = ch8.wls;
	VBAR Q1 / MISSING
	STAT = MEAN
	RESPONSE = BMI
	LIMITSTAT = STDERR;
	TITLE "Mean BMI Per Response at Visit 1 for Question 1";
	XAXIS LABEL="Response";	
	FORMAT Q1 Response.;
RUN;

/* Same as above, but change Y-axis limits */
PROC SGPLOT data = ch8.wls;
	VBAR Q1 / MISSING
	STAT = MEAN
	RESPONSE = BMI
	LIMITSTAT = STDERR;
	TITLE "Mean BMI Per Response at Visit 1 for Question 1";
	XAXIS LABEL="Response";	
	YAXIS VALUES = (15 to 30 by 1);
	FORMAT Q1 Response.;
RUN;

/* Kind of tedious, maybe a better way to do this. */
PROC TRANSPOSE  data = ch8.wls out = trans(RENAME=(COL1=Response _NAME_ = Question));
	BY ID BMI;
	VAR Q1-Q30;
RUN;

DATA trans_visits;
	SET trans;
		
	IF Question IN ("Q1", "Q2", "Q3", "Q4", "Q5", "Q6") THEN Visit = 1;
	ELSE IF Question IN ("Q7", "Q8", "Q9", "Q10", "Q11", "Q12") THEN Visit = 2;
	ELSE IF Question IN ("Q13", "Q14", "Q15", "Q16", "Q17", "Q18") THEN Visit = 3;
	ELSE IF Question IN ("Q19", "Q20", "Q21", "Q22", "Q23", "Q24") THEN Visit = 4;
	ELSE IF Question IN ("Q25", "Q26", "Q27", "Q28", "Q29", "Q30") THEN Visit = 5;	
	ELSE Visit = .;
	
	IF Question IN ("Q1", "Q7", "Q13", "Q19", "Q25") THEN QuestionNumber = 1;
	ELSE IF Question IN ("Q2", "Q8", "Q14", "Q20", "Q26") THEN QuestionNumber = 2;
	ELSE IF Question IN ("Q3", "Q9", "Q15", "Q21", "Q27") THEN QuestionNumber = 3;
	ELSE IF Question IN ("Q4", "Q10", "Q16", "Q22", "Q28") THEN QuestionNumber = 4;
	ELSE IF Question IN ("Q5", "Q11", "Q17", "Q23", "Q29") THEN QuestionNumber = 5;	
	ELSE IF Question IN ("Q6", "Q12", "Q18", "Q24", "Q30") THEN QuestionNumber = 6;		
	ELSE QuestionNumber = .;
RUN;
	
/* Panel by visit */
PROC SGPANEL data = work.trans_visits;
	PANELBY Visit / COLUMNS=1;
	VBAR QuestionNumber / MISSING GROUPDISPLAY  = CLUSTER GROUP=Response
	STAT = MEAN
	RESPONSE = BMI
	LIMITSTAT = STDERR;
	ROWAXIS VALUES = (20 to 30 by 1);
	FORMAT Response Response.;
RUN;	
	
	
	
