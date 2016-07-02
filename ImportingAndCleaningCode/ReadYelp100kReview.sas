
LIBNAME yelp '/folders/myfolders/YelpTables';

PROC IMPORT DATAFILE = '/folders/myfolders/YelpData/SAS_100kReviewSample.csv' OUT = YelpReview100k
	DBMS = CSV REPLACE;




/* The DROP statement cleans up columns in YelpReview */
DATA YelpReview100k;
	SET YelpREview;
	DROP type;
RUN;

/* checks that DROP worked correctly*/
PROC CONTENTS DATA = YelpReview100k;

DATA yelp.MyYelp100kReview;
	SET YelpReview100k;
RUN;




