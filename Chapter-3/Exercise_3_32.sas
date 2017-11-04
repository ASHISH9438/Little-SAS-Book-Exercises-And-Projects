DATA conference;

INFILE "/folders/myfolders/Little-SAS-Book-Exercises-And-Projects/data/EPLSB5data/Chapter3_data/Conference.dat" TRUNCOVER;

INPUT 
	first_name $
	last_name $
	attendee_id
	business_phone $ 47-59 
	home_phone $ 61-73
	mobile_phone $ 75-87
	ok_business $
	ok_home $
	ok_mobile $
	registration_rate
	wednesday_mixer $
	thursday_lunch $
	will_volunteer $
	dietary_restrictions $ 117-150;

/* Phone numbers have very consistent format */
IF length(business_phone) = 13 THEN area_code = substr(business_phone, 2, 3);
ELSE IF length(home_phone) = 13 THEN area_code = substr(home_phone, 2, 3);
ELSE IF length(mobile_phone) = 13 THEN area_code = substr(mobile_phone, 2, 3);
ELSE area_code = "None";

IF findw(upcase(dietary_restrictions), "VEGAN") THEN vegan_veg_meal = 1;
ELSE IF findw(upcase(dietary_restrictions), "VEGETARIAN") THEN vegan_veg_meal = 1;
ELSE vegan_veg_meal = 0;

	
* Seems kind of silly in retrospect to do an array for recoding one variable, ;
* but wanted some practice with SAS arrays ;	
ARRAY type registration_rate;
DO OVER type;
	IF registration_rate = 350 THEN attendee_type = "Academic Regular";
	ELSE IF registration_rate = 200 THEN attendee_type = "Student Regular";
	ELSE IF registration_rate = 450 THEN attendee_type = "Regular";	
	ELSE IF registration_rate = 295 THEN attendee_type = "Academic Early";	
	ELSE IF registration_rate = 150 THEN attendee_type = "Student Early";	
	ELSE IF registration_rate = 395 THEN attendee_type = "Early";
	ELSE IF registration_rate = 550 THEN attendee_type = "On-Site";	
	ELSE attendee_type = "Unknown";
END;	
RUN;	

PROC PRINT data = conference;
WHERE attendee_id IN (1082, 1083);
RUN;
