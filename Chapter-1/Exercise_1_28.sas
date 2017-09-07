OPTIONS NOCENTER;

PROC OPTIONS;

* MISSING=.         Specifies the character to print for missing numeric values. ;
* OBS=9223372036854775807
                    Specifies the observation that is used to determine the last observation to process, or specifies the last 
                    record to process. ;
* PAPERSIZE=LETTER  Specifies the paper size to use for printing. ;
*   YEARCUTOFF=1926   Specifies the first year of a 100-year span that is used by date informats and functions to read a two-digit 
                    year. ;
* NOCENTER          Left-align SAS procedure output. ;