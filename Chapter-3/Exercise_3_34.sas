* Read data file;
DATA newyear;
* 	INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/NewYears.dat" DSD TRUNCOVER;
	INFILE '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/NewYears.dat'  DSD TRUNCOVER; 
	INPUT id (in1-in119 out1-out119) (:TIME8.) ;
	FORMAT in1-in119 TIME8. out1-out119 TIME8.;
RUN;

* Calculate the length of each visit;
DATA visitlength (KEEP = id gym_visit1-gym_visit119);
	SET newyear;
	ARRAY in {119} in1-in119;
	ARRAY out {119} out1-out119;
	ARRAY diff {119} gym_visit1-gym_visit119;
	DO n=1 TO 119;
		IF out{n} > . THEN diff{n} = (out{n} - in{n}) / 60;
	END;
RUN;

* Set flag for disount to 1 (yes) for all members.  If one visit is;
* less than 30 minutes in length set flag to 0 (no) and leave DO loop;
* Calculate mean time of each user in minutes;
DATA discount (KEEP = id Has_Discount Visits_Over_30_Min Mean_Duration);
	SET visitlength;
	Visits_Over_30_Min = 0;
	Mean_Duration = MEAN(of gym_visit1-gym_visit119);
	ARRAY disc {119} gym_visit1-gym_visit119;
	DO i=1 to 119;
		IF disc{i} > 30 THEN Visits_Over_30_Min + 1;
	END;
	
	IF Visits_Over_30_Min = 119 THEN Has_Discount = 1;
	ELSE Has_Discount = 0;
RUN;
