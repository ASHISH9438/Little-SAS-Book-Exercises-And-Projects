* Classify risk group of smokers by breaking original elseif statements into;
* one block for smokers and one block for non-smokers.  Test with dummy data;
* from DATALINES;

DATA smokers;
	INPUT Smoke Sbp Dbp ;
	LENGTH Risk $ 8;
	FORMAT Risk $8.;
	
	* Risk groups for smokers;
	IF Smoke > 0 THEN DO;
		IF Sbp >= 140 OR Dbp >= 90 THEN Risk = "Severe";
		ELSE IF (Sbp >= 120 AND Sbp < 140) OR (Dbp >= 80 AND Dbp < 90 ) THEN Risk = "High";
		ELSE IF (Sbp > 0 AND Sbp < 120) OR (Dbp > 0 AND Dbp < 80) THEN Risk = "Medium";
		ELSE Risk = "Unknown";
	END;
	
	* Risk groups for non-smokers;
	ELSE IF Smoke = 0 THEN DO;
		IF Sbp >= 140 OR Dbp >= 90 THEN Risk = "High";
		ELSE IF (Sbp >= 120 AND Sbp < 140) OR (Dbp >= 80 AND Dbp < 90 ) THEN Risk = "Medium";
		ELSE IF (Sbp > 0 AND Sbp < 120) OR (Dbp > 0 AND Dbp < 80) THEN Risk = "Low";
		ELSE Risk = "Unknown";
	END;
	
	ELSE Risk = "Unknown";
	
* Test with some dummy data;
DATALINES;
1 140 80
1 130 90
1 120 100
1 110 85
1 100 75
1 75 75
0 140 80
0 130 90
0 120 100
0 110 85
0 100 75
0 75 75
1 0 0
0 0 0
;

RUN;
