DATA rose_input;
INFILE "U:/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/RoseBowl.dat";
INPUT 
	game_date MMDDYY10.
	winning_team $ 12-37
	winning_score
	losing_team $ 41-66
	losing_score	
;
	score_diff = winning_score - losing_score;

FORMAT
	game_date WEEKDATE29.
;
RUN;

* There has to be a better way to do this instead of using so many proc sort statements;
PROC SORT DATA = rose_input OUT = date_sort;
	BY game_date winning_team;
RUN;

* Get cumulative sum of games ordered by date;
DATA number_games;
SET date_sort;
	total_games + 1;
RUN;

* Sort by team to calculate cumulative wins per team;
PROC SORT DATA = number_games OUT = team_sort;
	BY winning_team game_date;
RUN;

* Cumulative sum by winning_team;
DATA cumulative_team_wins;
SET team_sort;
BY winning_team;
IF first.winning_team THEN total_wins = 0;
total_wins + 1;
IF last.winning_team THEN total_wins = total_wins;
RUN;


PROC PRINT data = cumulative_team_wins;
RUN;

