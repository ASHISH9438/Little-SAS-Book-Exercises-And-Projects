* Note, AKCbreeds.dat contains 5 variables and 173 observations. ;

DATA dogbreeds;
	INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/AKCbreeds.dat";
	INPUT breed $ 1-39 rank1 40-43 rank2 45-47 rank3 50-52 rank4 55-57 ;
RUN;

PROC PRINT data = dogbreeds;
RUN;