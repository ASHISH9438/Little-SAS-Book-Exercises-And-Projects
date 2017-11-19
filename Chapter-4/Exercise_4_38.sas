* Read data from DAT file ;
DATA donations;
	INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter4_data/Donations.dat" TRUNCOVER;
	INPUT id 1-4 first $ 6-19 last $ 20-33 address $ 34-58 city $ 59-88 zip $ 94-98 amount 101-105 month 106-107 ;
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

PROC MEANS data = donations_fill NOPRINT; 
	VAR amount ;
	BY id first last address city zip month;
	OUTPUT OUT = donations_summary
				sum(amount)=;
RUN;

DATA _NULL_;
	SET donations_summary;
	BY id;
	
	IF month = 1 THEN monthtext = "Jan";
	ELSE IF month = 2 THEN monthtext = "Feb";
	ELSE IF month = 3 THEN monthtext = "Mar";
	ELSE IF month = 4 THEN monthtext = "Apr";
	ELSE IF month = 5 THEN monthtext = "May";
	ELSE IF month = 6 THEN monthtext = "Jun";
	ELSE IF month = 7 THEN monthtext = "Jul";
	ELSE IF month = 8 THEN monthtext = "Aug";
	ELSE IF month = 9 THEN monthtext = "Sep";
	ELSE IF month = 10 THEN monthtext = "Oct";
	ELSE IF month = 11 THEN monthtext = "Nov";
	ELSE IF month = 12 THEN monthtext = "Dec";
	ELSE monthtext = "Unknown";
	
	FORMAT amount DOLLAR8.2;
	
	FILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter4_data/Donations.txt" PRINT;
	TITLE;
	IF first.id THEN DO;
	PUT _PAGE_ ;
	PUT	@1 "To: " first " " last /
	    @5 address /
	    @5 city " " zip //

	    @5 "Thank you for your support!  Your donations help us save hundreds of cats and dogs each year" /
		@5 "Donations to Coastal Humane Society" /
		@5 "(Tax ID: 99-5551212)" ;
	end;
	/* Forward slash not needed, as a new line will print on each iteration */
	PUT	@5 monthtext " " amount;
	
RUN;



