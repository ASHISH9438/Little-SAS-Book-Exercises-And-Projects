* Example of the QTR() function.  Returns Quarter = 2;

DATA pts;
  Quarter = QTR(MDY(04,05,2063))
;
RUN;