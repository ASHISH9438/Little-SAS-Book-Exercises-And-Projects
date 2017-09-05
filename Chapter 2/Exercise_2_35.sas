* Create a data set with variables named ID and Group ;
* Keep only subjects that belong to Groups A and C. ;
DATA testids;
	INPUT ID $ Group $ @@;
	IF Group = 'B' THEN DELETE ;
	DATALINES;
4165 A 2255 B 3312 C 5689 C
1287 A 5454 A 6672 C 8521 B
8936 C 5764 B
;
RUN;