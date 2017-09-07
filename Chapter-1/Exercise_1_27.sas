* Compute the body mass index using pounds and inches;
DATA bodymass;
	Weight = 150;
	Height = 68;
	BMI = (Weight / Height ** 2) * 703;
RUN;

PROC PRINT data = bodymass;

* 2) BMI calculates to 22.804930796;
* 3) Weight, Height, and BMI are all numeric variables of length 8;
