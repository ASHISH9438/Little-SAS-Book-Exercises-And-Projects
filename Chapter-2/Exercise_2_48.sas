* Note: Mountains.dat contains a total of 177 observations and 5 variables. ;

DATA mountains;
	INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/Mountains.dat";
	INFORMAT name $39. height_m COMMA8. height_ft COMMA8. year_first_ascent $9. prominence_m COMMA8.;
	INPUT name $ 1-39 height_m height_ft year_first_ascent $ prominence_m;
	IF year_first_ascent = "unclimbed" THEN year_first_ascent = "" ;
	as_year = input(year_first_ascent, YEAR4.) ;
	DROP year_first_ascent ;
	RENAME as_year = year_first_ascent ;
RUN;
