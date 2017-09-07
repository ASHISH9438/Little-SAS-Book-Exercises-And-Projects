* Write an input statement for the following raw data with variables Year, City, Name1, Name2 ;

DATA cities;
	INPUT Year City $ 4-16 Name1 $ Name2 $;
	DATALINES;
18 San Diago        Rebecca  Marian
19 San Fancisco     Kathy    Ginger
20 Long Beach       Scott    Sally
21 Las Vegas        Cynthia  MaryAnne
22 San Jose         Ethan    Frank
;
RUN;