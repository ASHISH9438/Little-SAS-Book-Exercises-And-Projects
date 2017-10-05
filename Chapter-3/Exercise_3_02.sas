* Create a small dataset of cholesterol values to show that addition of variables ;
* containing missing data will result in a missing numeric result ;

DATA cholesterol;
	INPUT ID Ldl Hdl Vldl;
	Total1 = Ldl + Hdl + Vldl;
	DATALINES;
1  160 50  20
2  150 55  .
3  120 40  30
4  140 50  25
;
RUN;