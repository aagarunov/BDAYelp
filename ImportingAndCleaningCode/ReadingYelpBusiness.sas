PROC IMPORT DATAFILE = '/folders/myfolders/YelpData/yelpacadembusv3.csv' OUT = YelpBusiness
	DBMS = CSV REPLACE;
RUN;

PROC IMPORT DATAFILE = '/folders/myfolders/YelpData/SAS_10kReviewSample.csv' OUT = YelpReview
	DBMS = CSV REPLACE;

/* The KEEP statement cleans up columns in YelpBusiness */
DATA YelpBusiness;
	SET YelpBusiness;
	KEEP name stars business_id city categories latitude longitude pricerange review_count;
/* 	KEEP name stars business_id user_id review_id text date city categories latitude longitude neighborhoods; */
RUN;

/* Checks that KEEP worked correctly */
PROC CONTENTS DATA = YelpBusiness;
RUN;

/* The DROP statement cleans up columns in YelpReview */
DATA YelpReview;
	SET YelpREview;
	DROP type;
RUN;

/* checks that DROP worked correctly*/
PROC CONTENTS DATA = YelpReview;
RUN;


