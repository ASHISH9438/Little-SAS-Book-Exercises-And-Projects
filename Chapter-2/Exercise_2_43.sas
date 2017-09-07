* Note: CancerRates.dat contains a total of 10 observations and 3 variables. ;

DATA cancer;
	INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/CancerRates.dat";
	INPUT ranking cancersite $ rate :3.1 ;
RUN;
	
PROC PRINT data = cancer;
RUN;