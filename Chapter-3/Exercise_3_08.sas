* Simple SAS program to demonstrate IF/ELSE IF use.  Because we are using;
* a logical statement to check for Group C condition, we must use an;
* ELSE IF statement.  Substituting an ELSE statement for the last ELSE IF;
* statement will result in an error;

DATA age;
 INPUT ID Age;
 IF 0 <= Age <= 50 THEN Group = 'A';
 ELSE IF 50 <= Age <= 70 THEN Group = 'B';
 ELSE IF Age > 70 THEN Group = 'C';
 DATALINES;
1  18
2  50
3  65
4  70
5  71
;
RUN;