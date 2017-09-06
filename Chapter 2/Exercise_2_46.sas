* Note: BigCompanies.dat contains a total of 100 observations and 6 variables. ;

DATA companies;
	INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/BigCompanies.dat";
	INPUT ranking company_name $ 6-34 country $ 34-52 sales_billions :DOLLAR8.2 ;
RUN;

PROC PRINT data = companies;
RUN;