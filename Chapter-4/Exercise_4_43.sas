LIBNAME ch4 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter4_data";

* Part A - Calculate the mean shipping cost per state, excluding California ;
PROC TABULATE data = ch4.elliptical;
	CLASS State;
	VAR Shipping;
	TABLE State, MEAN='Average Shipping Cost'*Shipping='';
	WHERE State <> "California";
	TITLE "Mean Shipping Rates by State";
	FOOTNOTE "Note: table does not include shipping rates to California";
RUN;

* Part B - Use a procedure to calcuate the total cost including tax and shipping
and present this total cost for each purchase organized by state;
PROC REPORT data = ch4.elliptical NOWINDOWS;
	COLUMN Machine State Cost Tax Shipping TotalCost;
	DEFINE TotalCost / COMPUTED 'Total Cost';
	COMPUTE TotalCost;
	TotalCost = SUM(Cost.SUM, Tax.SUM, Shipping.SUM);
	ENDCOMP;
	TITLE "Total Cost Per Order using PROC REPORT";
RUN;

* Part C - Modify code from Part B to calculate total cost for heart rate monitors only
and display grand total for heart rate monitors by region.  Also show number of purchases
per region by type of heart rate machine ;
PROC FORMAT;
	VALUE $coast
	"California" = "West Coast"
	"Oregon" = "West Coast"
	"Washington" = "West Coast"
	other = "East Coast"
	;
RUN;
	
PROC REPORT data = ch4.elliptical MISSING NOWINDOWS;
	COLUMN State Machine Cost Tax Shipping TotalCost;
	DEFINE State /
		GROUP 'Region';
	DEFINE TotalCost / COMPUTED 'Total Cost' FORMAT=DOLLAR10.2;
		COMPUTE TotalCost;
		TotalCost = SUM(Cost.SUM, Tax.SUM, Shipping.SUM);
		ENDCOMP;
	DEFINE Machine /
		ACROSS;
	TITLE "Total Units Sold Per Region with Overall Total Cost";
	FORMAT	State $coast.
			Cost DOLLAR10.2
			Tax DOLLAR10.2
			Shipping DOLLAR10.2
	;
	WHERE Machine CONTAINS "HRT";
RUN;
