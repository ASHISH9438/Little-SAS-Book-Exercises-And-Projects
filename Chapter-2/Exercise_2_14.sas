* Create a test dataset of names, salaries, and ages.  Select the best input statement ;
DATA salary;
	* List input truncates salary for Oprah and does not import a value for age ;
	* INPUT Name $ Salary DOLLAR11. Age;
	
	* Input modifier (:) needed to correctly import observation for Oprah;
	INPUT Name $ Salary :DOLLAR11. Age;
	
	* SAS goes to a new line after INPUT statement reaches past end of line and skips Marian observation;
	* INPUT Name $ @10 Salary DOLLAR11. Age;

	* Note that invalid salary for all observations ;
	* INPUT Name $ @'$' Salary Age;
	DATALINES;
Sally     $64,350 41
Marian    $55,550 38
Oprah     $75,000,000 59
;
RUN;