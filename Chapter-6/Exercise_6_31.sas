libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* sort data by year and commodity for use in proc means and proc transpose */
proc sort data = ch6.aveprices out = work.prices_sort;
	by year commodity;
run;

/* part a - yearly mean of each commodity */
proc means data = work.prices_sort noprint;
	by year commodity;
	output out = price_means(drop = _type_ _freq_) mean(price) = YearMeanPrice;
run;

/* part b - transpose monthly price to new variaible */
proc transpose data = work.prices_sort prefix = Month out = work.prices_transpose(drop = _label_ _name_);
	by year commodity;
	var price;
run;

/* part c - merge data from parts a and b */
data price_merged;
	merge prices_transpose price_means;
	by year commodity;
run;

/* part d - write outputs depending on commodity using one data step */
data eggs gas milk;
	set price_merged;
	if commodity = "Egg" then output eggs;
	else if commodity = "Gas" then output gas;
	else if commodity = "Milk" then output milk;
run;

/* part e - modify part d to give better names to month variables.  This was already
done in part b using the prefix option of proc transpose */

/* part f - comment on data sets created
data sets containing monthly average price and yearly average price for eggs, gas, and
milk created. Each data set contains a variable for year, commodity, month1-month12, and
the yearly mean commodity price */


