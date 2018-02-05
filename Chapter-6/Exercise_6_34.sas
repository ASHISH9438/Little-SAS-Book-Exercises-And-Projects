libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* part a - get cumulative count of songs pers band  */
proc sort data = ch6.iluvthe80s out = bands_sort;
	by band;
run;

data songs_by_band;
	set bands_sort;
	by band;
	if first.band then total = 0;
	total + 1;
run;

/* part b - calculate the median length per genre */
proc sort data = ch6.iluvthe80s out = genre_sort;
	by genre;
run;

proc means data = genre_sort median noprint;
	by genre;
	var length;
	output out = median_song_length(drop=_type_ _freq_) median(length) = MedianLength;
run;

/* part c - combine with the data set created in 
part a.  Exclude any automatic variables */
proc sort data = songs_by_band;
	by genre;
run;

data counts_with_median;
	merge songs_by_band median_song_length;
	by genre;
run;
