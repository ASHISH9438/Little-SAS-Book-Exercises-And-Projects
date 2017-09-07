OPTIONS NONUMBER;

DATA info;
	City = "Sao Paulo";
	* Semicolon missing for exercise ;
	* Omitting smicolon produces 1 error, 2 warnings, and 3 notes;
	Country = "Brazil";
	CountryCode = 55;
	CityCode = 11;
RUN;

* Once corrected, the DATA step produces a data set with 1 observation and 4 variables;