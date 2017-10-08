* Small program to show that adding variables together with the SUM() function ;
* does not result in a missing numeric value if 1+ value is missing ;
* Sum for observation 2 is 205 even though Vldl is missing. ;

DATA cholesterol;
 INPUT ID Ldl Hdl Vldl;
 Total1 = SUM(Ldl, Hdl, Vldl);
 DATALINES;
1  160 50  20
2  150 55  .
3  120 40  30
4  140 50  25
;
RUN;