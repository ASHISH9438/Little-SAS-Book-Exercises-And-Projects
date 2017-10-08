* Small program to demonstrate use of TRANWRD() function. ;
DATA phrase;
 INPUT ID original_phrase $ 2-50;
 better_phrase = TRANWRD(original_phrase, 'cat', 'dog');
 DATALINES;
1  A cat is the best pet ever, I love my cat.
;
RUN;