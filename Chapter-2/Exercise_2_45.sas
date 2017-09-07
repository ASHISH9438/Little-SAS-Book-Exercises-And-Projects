* Note, Vaccines.dat contains 17 variables and 21 observations. ;
* List input used due to embedded spaces in vaccine and transmission variables, and blanks for missing date per country; 

DATA vaccines;
	INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/Vaccines.dat";
	INPUT vaccine_name $ 1-31 disease_transmission $ 32-50 ww_incidence 51-60 ww_deaths 61-70 Chile $ 71-73 Cuba $ 77-79
	United_States $ 83-85 United_Kingdom $ 89-91 Finland $ 94-97 Germany $ 100-103 Saudi_Arabia $ 106-109 Ethiopia $ 112-115 
	Botswana $ 118-121 India $ 124-127 Australia $ 130-133 China $ 136-139 Japan $ 142-145;
RUN;

PROC PRINT data = vaccines;
RUN;