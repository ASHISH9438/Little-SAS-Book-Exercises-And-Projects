DATA employees;

* Read the raw data file.  TRUNCOVER option is needed because each line is of different length due to ;
* the varying lengths of job title. ;

* William Stone will make $89,648.68 after a 2.5% pay increase which includes a $1000.00 bonus.;
* Mark Harrison will reach salary cap of $85,000.00 after a 2.5% pay increase and will not received a bonus.;

INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/Employees.dat" TRUNCOVER;

INPUT 
	SSN $11.
	Name $ 16-46
	DOB DATE9.
	Grade $ 
	Salary_Month DOLLAR10.2 
	Title $ 73-99 ;	
	Age_At_Revew = INT(YRDIF(DOB, TODAY(), "AGE"));
	
* Create minimum and maximum salary bands per paygrade;	
IF Grade = "GR20" THEN DO;
	MinSalary = 50000.00;
	MaxSalary = 70000.00;
END;

ELSE IF Grade = "GR21" THEN DO;
	MinSalary = 55000.00;
	MaxSalary = 75000.00;
END;
	
ELSE IF Grade = "GR22" THEN DO;
	MinSalary = 60000.00;
	MaxSalary = 85000.00;
END;
	
ELSE IF Grade = "GR23" THEN DO;
	MinSalary = 70000.00;
	MaxSalary = 100000.00;
END;	

ELSE IF Grade = "GR24" THEN DO;
	MinSalary = 80000.00;
	MaxSalary = 120000.00;
END;	

ELSE IF Grade = "GR25" THEN DO;
	MinSalary = 100000.00;
	MaxSalary = 150000.00;
END;	

ELSE IF Grade = "GR26" THEN DO;
	MinSalary = 120000.00;
	MaxSalary = 200000.00;
END;	
	
ELSE DO
	MinSalary = .;
	MaxSalary = .;
END;
	
* Calculate expected annual salary after 2.5% raise, capping;
* salary at MaxSalary if the raise puts them at the top of a payband;

IF (Salary_Month * 12 * 1.025) > MaxSalary THEN 
	Expected_Salary = MaxSalary;
ELSE 
	Expected_Salary = (Salary_Month * 12 * 1.025);

* Give a $1000.00 bonus to leads, directors, and managers.;
IF FINDW(Title, "Lead") THEN DO;
	Expected_Salary = Expected_Salary + 1000.00;
	Bonus = "Yes";
END;

ELSE IF FINDW(Title, "Manager") THEN DO;
	Expected_Salary = Expected_Salary + 1000.00;
	Bonus = "Yes";
END;

ELSE IF FINDW(Title, "Director") THEN DO;
	Expected_Salary = Expected_Salary + 1000.00;
	Bonus = "Yes";
END;
	
ELSE DO;
	Expected_Salary = Expected_Salary;
	Bonus = "No";
END;
	
FORMAT 
	DOB DATE9.
	Salary_Month DOLLAR10.2
	MinSalary DOLLAR10.2
	MaxSalary DOLLAR10.2
	Expected_Salary DOLLAR10.2
;

RUN;

PROC PRINT data = employees;
WHERE Name IN ("William Stone", "Mark Harrison");
RUN;