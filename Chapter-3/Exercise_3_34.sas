DATA newyear;
INFILE '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/NewYears.dat' DSD TRUNCOVER;
INPUT id (in1-in119 out1-out119) (:time8.) ;
FORMAT in1-in119 out1-out119 time8.;
RUN;

data visitlengh (keep = id gym_visit1-gym_visit119);
SET newyear;
ARRAY in {119} in1-in119;
ARRAY out {119} out1-out119;
ARRAY diff {119} gym_visit1-gym_visit119;
DO n=1 TO 119;
	IF out{n} > . THEN diff{n} = out{n} - in{n};
END;

FORMAT gym_visit1-gym_visit119 time.;
run;

proc print data = visitlengh;
run;