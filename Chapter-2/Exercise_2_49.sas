* Step 1: read all observations into dataset allusers ;

DATA allusers;
	INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/CompUsers.dat";
	INPUT userid group $ first $ last $ @"email:" email :$35. @"phone:" phone $ major $ @@ ;
RUN;

* Step 2: read only non-student observations ;
DATA nonstudent;
	INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter2_data/CompUsers.dat";
	INPUT userid group $ first $ last $ @"email:" email :$35. @"phone:" phone $ major $ @@ ;
	IF group = "Student" THEN DELETE ;
RUN;

PROC PRINT data = allusers;
TITLE "All user accounts" ;
RUN;

PROC PRINT data = nonstudent;
TITLE "Non-Student user accounts" ;
RUN;