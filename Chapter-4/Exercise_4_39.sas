libname ch4 '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter4_data';

/* GasPrice :U.S. average price of unleaded regular gasoline (per gallon) 
Numeric variable length 8. */
PROC CONTENTS data = ch4.gas;
RUN;

/* Calculate min, max, mean, and std with default PROC MEANS */
PROC MEANS data = ch4.gas
	MAXDEC=2;
	BY Year;
	VAR GasPrice;
RUN;

/* Create a new dataset with quarter */
DATA gas_qtr;
	SET ch4.gas;
	DummyDate = MDY(Month, 01, Year);
	Qtr = QTR(DummyDate);
	DROP DummyDate;
RUN;

/* Re-run PROC MEANS by Year and Qtr and create new dataset
Drop _FREQ_ and _TYPE_ when creating new dataset */
PROC MEANS data = gas_qtr
	MAXDEC=2;
	BY Year Qtr;
	VAR GasPrice;
	OUTPUT OUT = gas_summary(DROP = _FREQ_ _TYPE_)
		MEAN(GasPrice) = AveragePrice 
		STD(GasPrice) = StdDev
	;
	FORMAT AveragePrice DOLLAR6.2
		   StdDev DOLLAR6.2;
RUN;
	