* Show format for displaying 5678 as 5,678.00 ;
* Addition of one comma, one decimal, and precision of 2 ;
* requires that the output should have COMMA8.2 format. ;
DATA random;
	INPUT 	Original 
		 	COMMA6_2 
			COMMA_7_2
			COMMA_7_3
			COMMA8_2
	;
	FORMAT
			COMMA6_2 COMMA6.2
			COMMA_7_2 COMMA7.2
			COMMA_7_3 COMMA7.3
			COMMA8_2 COMMA8.2
	;
	DATALINES;
5678	5678	5678	5678	5678
;
RUN;

*Show how each value displays after formatting ;
PROC PRINT data = random;
	TITLE1 "Display 5678 as 5,678.00";
RUN;
