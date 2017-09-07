* Create a data set with variables named Brand, Qty, and Amount ;
DATA salary;
	INPUT Brand $ 1-18 Qty Amount :DOLLAR6.2;
	DATALINES;
Pampers            42 $44.99
Huggies             7 $34.99
Seventh Generation  7 $39.99
Nature Babycare     4 $41.99
;
RUN;