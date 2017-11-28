libname ch7 'U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter7_data';

%LET yearVal=2008;

DATA boston;
	SET ch7.airtraffic(KEEP = Year Airline Quarter BOS:);
	WHERE Year = &yearVal;
RUN;

PROC TABULATE data = boston;
	CLASS Airline;
	VAR BOSFlights BOSPassengers;
	TABLE Airline, SUM*(BOSFlights BOSPassengers);
	TITLE "Boston Flights and Passengers per Airline in &yearVal";
RUN;
