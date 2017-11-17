* Read data from DAT file ;
DATA donations;
	INFILE "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter4_data\Donations.dat" TRUNCOVER;
	INPUT id 1-4 first $ 6-19 last $ 20-33 address $ 34-58 city $ 59-88 zip $ 94-98 amount 101-105 month 106-107;
RUN;

* Use RETAIN to fill in missing data down columns ;
DATA donations_fill;
	SET donations;

	RETAIN _first _last _address _city _zip;
	IF NOT MISSING(first) THEN _first = first;
	IF NOT MISSING(last) THEN _last = last;
	IF NOT MISSING(address) THEN _address = address;
	IF NOT MISSING(city) THEN _city = city;
	IF NOT MISSING(zip) THEN _zip = zip;

	first = _first;
	last = _last;
	address = _address;
	city = _city;
	zip = _zip;

	DROP _:;
RUN;
