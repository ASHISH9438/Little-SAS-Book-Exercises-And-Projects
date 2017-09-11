* Note: BigCompanies.dat contains a total of 100 observations and 6 variables. ;
* Had to find a solution to convertingbecause COMPRESS() is not covered in chapter 2 of TLSB5 ;


DATA companies;
	INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/BigCompanies.dat";
	INPUT ranking company_name $ 6-34 country $ 34-52 _sales $ _profits $ _assets $	_market $ ;
	
 	sales = input(compress(_sales,'B'),dollar32.);
 	profits = input(compress(_profits ,'B'),dollar32.);
 	assets = input(compress(_assets ,'B'),dollar32.);
 	market = input(compress(_market ,'B'),dollar32.);
	DROP _:;
RUN;

PROC PRINT data = companies;
RUN;
