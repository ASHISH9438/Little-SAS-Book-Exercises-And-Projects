libname ch7 'U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter7_data';

DATA study;
	SET ch7.Studytime;
	StudyRate = Time / Units;
	FORMAT StudyRate 4.2;

PROC SORT data = study;
	BY Section;
RUN;

PROC MEANS data = study MAXDEC=2 NOPRINT;
	BY Section;
	VAR StudyRate;
	OUTPUT OUT = study_summary(DROP = _FREQ_ _TYPE_)
		MEAN(StudyRate) = AvgTimePerUnit
	;
RUN;

OPTIONS SYMBOLGEN;

%MACRO printAvgPerClass(Section=);
DATA _NULL_;
	SET study_summary;
	AvgTimePerUnit = ROUND(AvgTimePerUnit, 0.01);
	CALL SYMPUT("avgstudy", AvgTimePerUnit);
	WHERE Section = &Section;
RUN;

%IF &avgstudy > 2 %THEN %DO;
PROC PRINT data = study;
	TITLE "Average Study Time Per Student of Section &Section";
	FOOTNOTE "Note: Section &Section study time meets 2 hour minimum with an average time of &avgstudy";
	WHERE Section = &Section;
RUN;
%END;

%ELSE %IF &avgstudy <= 2 %THEN %DO;
PROC PRINT data = study;
	TITLE "Average Study Time Per Student of Section &Section";
	FOOTNOTE "Note: Section &Section study time does not meet 2 hour minimum with an average time of &avgstudy";
	WHERE Section = &Section;
RUN;
%END;

%MEND printAvgPerClass;

%printAvgPerClass(Section='01');
%printAvgPerClass(Section='02');
