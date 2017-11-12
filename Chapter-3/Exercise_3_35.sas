* Exercise was done with SAS University Edition, which by default uses UTF-8 encoding ;
* Encoding must be set to WLATIN1 in DATA step for data to import correctly ;
DATA icecream;
	INFILE '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/BenAndJerrys.dat'  
	DSD DLM = "," 
	TRUNCOVER
	ENCODING=WLATIN1; 
	INPUT flavor :$200. portion_size_g calories calories_fat fat_g saturated_fat_g trans_fat_g cholesterol_mg sodium_mg
		  carbs_g fiber_g $ sugar_g protein_g introduced_year retired_year description :$200. notes :$200.;
RUN;

* Create a subset of non-retired icecreams that were not "Scoop Shop" ;
* exclusives. ;
DATA icecream_current;
	SET icecream;
	IF (retired_year > .) THEN DELETE;
	IF (INDEX(notes, "Scoop Shop") > 0) THEN DELETE;
RUN;

* Calculate calories per tablespoon. ;
DATA calories_tbs;
	SET icecream_current;
	Tbs_Per_Serving = portion_size_g / 15;
	calories_tbs = calories / Tbs_Per_Serving;
	
	IF calories_tbs = . THEN DELETE;
RUN;

* Calculate running total of calories consumed if one were to eat one ;
* tablespoon of each icecream ;
DATA cumulative_sampling;
	SET calories_tbs;
	cumulative_calories + calories_tbs;
RUN;

* Create a new variable that retains the highest calorie icecream ;
* from one observation to the next. ;
DATA highest_calories;
	SET cumulative_sampling;
	RETAIN MaxCalories;
	MaxCalories = MAX(MaxCalories, calories);
RUN;

* The total number of calories consumed for eating a tablespoon of each ;
* icecream is 2135.9939433 and the most caloric icecream is 340 calories ;
* per serving. ;