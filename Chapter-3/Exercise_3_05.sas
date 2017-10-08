* Small program to demonstrate use of MEAN() function. ;
DATA ints;
 INPUT ID X1 X2 X3;
 mu = MEAN(X1, X2, X3);
 DATALINES;
1 22 23 24
2 20 90 29
3 39 12 12
4 93 10 91
;
RUN;