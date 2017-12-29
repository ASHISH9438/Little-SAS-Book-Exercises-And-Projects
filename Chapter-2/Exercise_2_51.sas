* To be fair this is just a copy/paste of how I solved the data input for a chapter 3 programming
exercise ;

* Part A - Read data ;
DATA icecream;
	INFILE 'U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter2_data\BenAndJerrys.dat'  
	DSD DLM = "," 
	TRUNCOVER
	ENCODING=WLATIN1; 
	INPUT flavor :$200. portion_size_g calories calories_fat fat_g saturated_fat_g trans_fat_g cholesterol_mg sodium_mg
		  carbs_g fiber_g $ sugar_g protein_g introduced_year retired_year description :$200. notes :$200.;
RUN;

* Part B - print data ;
PROC PRINT data = icecream;
RUN;
