libname ch7 'U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter7_data';
OPTIONS SYMBOLGEN;

%MACRO loan_summary(Property=, LoanAmount=);

DATA subset;
	SET ch7.loanapp;
	WHERE LoanApproved = 1 AND Price >= &LoanAmount and PropType = &Property;
PROC SORT data = subset;
	BY Branch;
RUN;

%IF &Property=1 %THEN %DO;
PROC MEANS data = subset MAXDEC=2 NOPRINT;
	BY Branch;
	VAR CreditScore Interest PercentDown;
	OUTPUT OUT = property_&Property._summary(DROP = _FREQ_ _TYPE_)
	MEAN(CreditScore Interest PercentDown) = MeanCreditScore MeanInterest MeanPercentDown
	;
RUN;

DATA property_&Property._summary;
	SET property_&Property._summary;
	LENGTH HomeType $200;

	HomeType = "Primary Residence";
	Cutoff = &LoanAmount;
RUN;
%END;

%ELSE %DO;
PROC MEANS data = subset MAXDEC=2 NOPRINT;
	VAR CreditScore Interest PercentDown;
	OUTPUT OUT = property_&Property._summary(DROP = _FREQ_ _TYPE_)
	MEAN(CreditScore Interest PercentDown) = MeanCreditScore MeanInterest MeanPercentDown
	;
RUN;

DATA property_&Property._summary;
	SET property_&Property._summary;
	LENGTH HomeType $200;

	IF &Property = 2 THEN HomeType = "Secondary Residence";
	ELSE IF &Property = 3 THEN HomeType = "Investment or Rental";
	ELSE IF &Property = 4 THEN HomeType = "Commercial Property";
	ELSE HomeType = "Unknown";
	Cutoff = &LoanAmount;
RUN;
%END;

%MEND loan_summary;

%loan_summary(Property=1, LoanAmount=800000);
%loan_summary(Property=2, LoanAmount=800000);
%loan_summary(Property=3, LoanAmount=1000000);
%loan_summary(Property=4, LoanAmount=1200000);

DATA output;
	SET
		work.property_1_summary
		work.property_2_summary
		work.property_3_summary
		work.property_4_summary
	;
RUN;

PROC PRINT data = output;
	TITLE "Summary of Approved Mortgages by Property Type";
	FORMAT 
		Cutoff DOLLAR8.
		MeanInterest 4.2
		MeanCreditScore 6.2
		MeanPercentDown 5.3
	;
RUN;
