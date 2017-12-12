libname ch7 'U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter7_data';

/* Create a macro that takes a 4-digit year and 3-character airport abbreviation as an input
and outputs a dataset with 1 observation containing the airline with the greatest number of
passengers for a given airport and year */
%MACRO mostPassengersPerYear(yearVal, airportAbbr);

/* Generate sum of passengers for all airlines at an airport for given year and sort by highest
to lowest number of passengers at airport */
PROC MEANS data = ch7.airtraffic(KEEP = Year Airline Quarter &airportAbbr.:) MAXDEC=2 NOPRINT;
	BY Airline Year;
	VAR &airportAbbr.Flights &airportAbbr.Passengers;
	OUTPUT OUT = &airportAbbr._summary(DROP = _FREQ_ _TYPE_)
		SUM(&airportAbbr.Flights &airportAbbr.Passengers) = FlightsSum PassengerSum
	;
	WHERE Year = &yearVal;

PROC SORT data = &airportAbbr._summary;
	BY DESCENDING PassengerSum;
RUN;

/* Use CALL SYMPUT to set macro variable mostpassengers equal to the airline with the most
passengers */
DATA _NULL_;
	SET &airportAbbr._summary;
	IF _N_ = 1 THEN	CALL SYMPUT("mostpassengers", Airline);
	ELSE STOP;
RUN;

/* Create the output data set where airline is equal to macro variable mostpassengers */
DATA &airportAbbr._&yearVal._summary;
	SET &airportAbbr._summary;
	AirportCode = "&airportAbbr";
	WHERE Airline = "&mostpassengers";
RUN;
%MEND mostPassengersPerYear;

/* Call macro for each of the 12 airlines for a given year and save as new data set.  Check
if there is a way to call macro directly in DATA step to minimize redundant code. */
%LET yearVal = 2010;
%mostPassengersPerYear(&yearVal, ATL)
%mostPassengersPerYear(&yearVal, BOS)
%mostPassengersPerYear(&yearVal, DEN)
%mostPassengersPerYear(&yearVal, DFW)
%mostPassengersPerYear(&yearVal, EWR)
%mostPassengersPerYear(&yearVal, HNL)
%mostPassengersPerYear(&yearVal, LAX)
%mostPassengersPerYear(&yearVal, MIA)
%mostPassengersPerYear(&yearVal, ORD)
%mostPassengersPerYear(&yearVal, SAN)
%mostPassengersPerYear(&yearVal, SEA)
%mostPassengersPerYear(&yearVal, SFO)

DATA airport_summary;
	SET 
		atl_&yearVal._summary
		bos_&yearVal._summary
		den_&yearVal._summary
		dfw_&yearVal._summary
		ewr_&yearVal._summary
		hnl_&yearVal._summary
		lax_&yearVal._summary
		mia_&yearVal._summary
		ord_&yearVal._summary
		san_&yearVal._summary
		sea_&yearVal._summary
		sfo_&yearVal._summary
	;
RUN;
