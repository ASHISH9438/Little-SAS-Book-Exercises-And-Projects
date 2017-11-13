* Option to PROC SORT to tell SAS to sort the following names in alphabetical order ;
DATA lastnames;
	INPUT lastname $ 1-10;
	DATALINES;
de Bie
De Leon
deVere
DeMesa
Dewey
;
RUN;

* SORTSEQ = LINGUISTIC to ignore upper and lowercase when sorting;
PROC SORT data = lastnames out = answera
SORTSEQ = LINGUISTIC (STRENGTH = PRIMARY);
	BY  lastname;
RUN;

* Change sort order from EBCDIC (blank lowercase uppercase numeral
to ASCII (blank numerical uppercase lowercase);
PROC SORT data = lastnames out = answerb
SORTSEQ = ASCII;
	BY  lastname;
RUN;

PROC SORT data = lastnames out = answerc
NODUPKEY;
	BY  lastname;
RUN;

PROC PRINT data = answera;
	TITLE1 "Data sorted with SORTSEQ = LINGUISTIC";
RUN; 

PROC PRINT data = answerb;
	TITLE1 "Data sorted with SORTSEQ = ASCII";
RUN; 

PROC PRINT data = answerc;
	TITLE1 "Data sorted with NODUPKEY";
RUN; 
