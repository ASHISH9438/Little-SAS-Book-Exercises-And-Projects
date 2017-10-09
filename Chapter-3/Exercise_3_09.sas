* Example of a subsetting IF statement;
* The first IF statement controls whether or not an observation;
* will be read.  If the first IF statement is true then the second;
* if statement is executed;

DATA pts;
 INPUT ID Age Gender $;
 IF Age < 75;
 IF Age < 50 AND Gender = 'female' THEN Guideline = 'Inv4a';
 ELSE IF Age >= 50 AND Gender = 'female' THEN Guideline = 'Inv4b';
 ELSE Guideline = 'n/a';
 DATALINES;
41  25  male
32  79  female
36  52  female
74  63  male
76  70  male
77  65  female
;
RUN;