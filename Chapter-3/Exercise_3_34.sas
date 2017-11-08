DATA newyear;
INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/NewYears.dat" DSD TRUNCOVER;
* INFILE '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/NewYears.dat'  DSD TRUNCOVER; 
INPUT id (in1-in119 out1-out119) (:time8.) ;
FORMAT in1-in119 out1-out119 time8.;
RUN;

data visitlength (keep = id gym_visit1-gym_visit119);
SET newyear;
ARRAY in {119} in1-in119;
ARRAY out {119} out1-out119;
ARRAY diff {119} gym_visit1-gym_visit119;
DO n=1 TO 119;
	IF out{n} > . THEN diff{n} = out{n} - in{n};
END;

FORMAT gym_visit1-gym_visit119 time.;
run;

PROC TRANSPOSE data = visitlength out = visit_transpose(rename=(COL1=Visit_Length)) name=Visit_Number;
	by id;
RUN;

proc print data = visit_transpose;
run;
