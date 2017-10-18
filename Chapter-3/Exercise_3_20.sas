DATA runners;
 INPUT Age Gender $;
 IF 4 <= Age AND Age < 9 THEN Group = 1;
 ELSE IF 9 <= Age AND Age < 13 THEN Group = 2;
 ELSE IF Age >= 13 THEN Group = 3;
 ELSE Group = 4;
 DATALINES;
4   male
1   female
2   male
3   female
8   female
9   male
12  male
70  male
65  female
;
RUN;