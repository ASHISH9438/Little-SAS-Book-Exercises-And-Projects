libname ch8 '/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter8_data';

/* Part a, histogram of latest year (2013) */
PROC SGPLOT data = ch8.population;
	HISTOGRAM Y1;
RUN;

/* Part b, histogram of latest year by continent */
PROC SGPANEL data = ch8.population;
	PANELBY Continent / NOVARNAME;
	HISTOGRAM Y1; 
RUN;

/* Part c, boxplot by continent */
PROC SGPLOT data = ch8.population;
	VBOX Y1 / CATEGORY = Continent; 
RUN;

/* Overall, it is easier to see the rough distribution of the population data
using the histograms, but it is easier to visualize the mean/median of each
continent's population in the boxplot */