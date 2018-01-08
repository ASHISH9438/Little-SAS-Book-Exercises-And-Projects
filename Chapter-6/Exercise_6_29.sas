libname ch6 "U:\Little-SAS-Book-Exercises-And-Projects\data\EPLSB5data\Chapter6_data";

/* Create new variable for name popularity for each input data set. 
Variable names between data sets are not the same, only labels.  Girl is
Menina in Brazil data, Devushka in Russian data set, etc.  Rename columns
by column position, first column contains girl names, second column boy names,
and observation number is the ranking. */

%macro addrank(data=,);
*Set input data set and create variables for popularity equal to obs number;
data &data._rankings;
	set ch6.&data.(obs=10);
	PopularGirl = _n_ ;
	PopularBoy = _n_ ; 
	Country = "&data.";
run;

*Transpose data such that each obseravtion is a variable name;
proc transpose data=&data._rankings(obs=0) out=vars;
   var _all_;
run;

*Create new temporary file;
filename FT76F001 temp;

*Write instructions for proc datasets to rename variables into temp text file;
data _null_;
	file FT76F001;
	set vars;
	put 'Rename ' _name_ '=Col' _n_ ';';
run;

*Use proc datasets and temp text file instructions to rename variables;
proc datasets nolist;
	modify &data._rankings;
	%inc FT76F001;
run;
quit;

%mend addrank;

/* Call macro on each data set */
%addrank(data=unitedstates);
%addrank(data=russia);
%addrank(data=india);
%addrank(data=france);
%addrank(data=brazil);
%addrank(data=australia);

/* Combine data set and sort by popularity. */
data merged_ranks(rename=(Col1=Girls Col2=Boys Col5=Country) drop=Col3 Col4);
	set unitedstates_rankings russia_rankings india_rankings
		france_rankings brazil_rankings australia_rankings;
	by  col3 col4;
run;

