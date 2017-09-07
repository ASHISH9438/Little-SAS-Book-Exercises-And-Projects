* Crayons.dat contains 133 observations and 7 variables ;
* MISSOVER is used to prevent SAS from reading the next observation when data is missing for year retired ;

* Create LIBREF crayola to save SAS7BDAT file ;
LIBNAME crayola "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/";

DATA crayola.crayons;
	INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/Crayons.dat" MISSOVER;
	INPUT number 1-3 color $ 4-31 hex $ 32-40 rgb $ 41-57 packsize issued retired ;
	FORMAT issued YEAR4. retired YEAR4.;
RUN;
