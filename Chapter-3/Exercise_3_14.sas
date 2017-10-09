* Simple example of a sum statement;
* A sum statement takes the form of variable + expression;
* Use a sum statement to get cumulative sum in a dummy data;
* set;

DATA sumexample;
 INPUT Number;
 CUMSUM + Number;
 DATALINES;
1
6
10
11.1
18
5.6
1.1
;
RUN;