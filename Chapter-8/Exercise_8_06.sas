
DATA test;
	INPUT Group $ Measurement;
	DATALINES;
Alpha 121
Beta  120
Delta 133
Gamma 130
Alpha 113
Beta  132
Delta 101
Gamma 139
Alpha 129
Beta  127
Delta 139
Gamma 137
Alpha 121
Beta  138
Delta 135
Gamma 122
;
RUN;

PROC SORT data = test out = test_sort;
	BY Group;
RUN;

/* Standard boxplot, four groups on same graph */
PROC SGPLOT data = test;
	VBOX Measurement / CATEGORY = Group;
RUN;

/* Standard boxplot, four groups on same graph but groups are colored by GROUP variable */
PROC SGPLOT data = test;
	VBOX Measurement / GROUP = Group;
RUN;

/* Assuming that data is sorted in ascending order, a BY statement can be added such that a new plot is created for
each group on a separate page */
PROC SGPLOT data = test_sort;
	VBOX Measurement;
	 BY Group;
RUN;
