*Sample SAS Program �� J. Peters � BDA 501 � Summer 2016 � The City University of New York; 

LIBNAME yelp '/folders/myfolders/YelpTables/';
LIBNAME ZCT 'C:\ROADS\';


data firms; set yelp.business1000;
   bstars =stars;
   btype = type;
   drop stars;

DATA STATIONS; SET firms;

data temp4;  set stations;
    tweetup = upcase(CATEGORIES);

    FFOOD   = index(tweetup, "FAST FOOD");
    RESTAUR  = index(tweetup, "RESTAURANTS");
    NIGHTLIFE  = index(tweetup, "NIGHTLIFE");
    CHINESE  = index(tweetup, "CHINESE");

    AUTO   = index(tweetup, "AUTO");
    GOLF  = index(tweetup, "GOLF");
    BURGERS  = index(tweetup, "BURGER");
    FASHION  = index(tweetup, "FASHION");

    weekend   = index(tweetup, "WEEKEND");
    BARS      = index(tweetup, "BARS");
    AMERICAN  = index(tweetup, "AMERICAN");
    DATE      = index(tweetup, "DATE");
    HATE      = INDEX(TWEETUP, "HATE");
    MTA       = INDEX(TWEETUP, "MTA");


	if FFOOD  ne 0 then  FFOOD1 = 1; else FFOOD1 =0;
    if RESTAUR ne 0 then RESTAUR1 = 1; else RESTAUR1=0;
    if NIGHTLIFE  ne 0 then  NIGHTLIFE1  =1; else NIGHTLIFE1 = 0;
    if CHINESE ne 0 then CHINESE1 = 1; else CHINESE1=0;

	if AUTO  ne 0 then  AUTO1 = 1; else AUTO1 =0;
    if GOLF ne 0 then GOLF1 = 1; else GOLF1=0;
    if BURGERS  ne 0 then  BURGERS1  =1; else BURGERS1 = 0;
    if FASHION ne 0 then FASHION1 = 1; else FASHION1=0;

	if WEEKEND  ne 0 then WEEKEND1 = 1; else WEEKEND1 =0;
    if BARS ne 0 then BARS1 = 1; else BARS1=0;
    if AMERICAN ne 0 then AMERICAN1  =1; else AMERICAN1 = 0;
    if DATE ne 0 then DATE1 = 1; else DATE1=0;
	IF MTA   NE 0 THEN MTA1=1; ELSE MTA1=0;

	count  = 1;

proc sort; by type;

PROC SUMMARY DATA=temp4 MISSING NWAY;
   class type ;
   var count FFOOD1 RESTAUR1 NIGHTLIFE1 CHINESE1 AUTO1 GOLF1 BURGERS1
            FASHION1 WEEKEND1 BARS1 AMERICAN1 DATE1 MTA1 ;
   OUTPUT OUT=y sum=;

Proc print;
by type ;
 var count FFOOD1 RESTAUR1 NIGHTLIFE1 CHINESE1 AUTO1 GOLF1 BURGERS1 FASHION1 
           WEEKEND1 BARS1 AMERICAN1 DATE1 MTA1;
 sum count FFOOD1 RESTAUR1 NIGHTLIFE1 CHINESE1 AUTO1 GOLF1 BURGERS1 FASHION1 
           WEEKEND1 BARS1 AMERICAN1 DATE1 MTA1; 
 
run;
run;
