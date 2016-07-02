/* TODO: Get rid of import statements once tables are saved as permanent and use LIBNAME */
LIBNAME yelp '/folders/myfolders/YelpTables';

/* The KEEP statement cleans up columns in YelpBusiness */
DATA YelpBusiness;
	SET yelp.YelpBusinesscleaned;
	KEEP name stars business_id city categories latitude longitude pricerange review_count;

/* Checks that KEEP worked correctly */
PROC CONTENTS DATA = YelpBusiness;

/* The DROP statement cleans up columns in YelpReview */
DATA YelpReview;
	SET yelp.myyelp100kreview;
	DROP type;

/* Checks that DROP worked correctly */
PROC CONTENTS DATA = YelpReview;


/* MERGE BEGINS HERE */
PROC SORT DATA= YelpBusiness ASCII OUT = YelpBusinessSorted;
	BY business_id;


PROC SORT DATA= YelpReview ASCII OUT = YelpReviewSorted;
	BY business_id;


DATA YelpMerge;
	MERGE YelpBusinessSorted YelpReviewSorted;
	BY business_id;


/* Checks Merge correctly */
PROC CONTENTS DATA = YelpMerge;

/* Cleaning up Code */
DATA YelpMergeCleanUp;
	SET YelpMerge;
/* 	Deleting all businesses without business_id */
	IF business_id = '#NAME?' THEN DELETE;
	IF business_id = '#VALUE!' THEN DELETE;

/* 	Delete all businesses that aren't in the city */
	IF city ~= 'Phoenix' THEN DELETE;

/* 	Geofencing roughly Central Phoenix latitude, longitude */
/* 	NW 33.510188, -112.152645;  */
/* 	NE 33.510188, -111.987164;  */
/* 	SW 33.408507, -112.152645;  */
/* 	SE 33.408507, -111.987164   */
	
	IF latitude > 33.510188 THEN DELETE;
	IF latitude < 33.408507 THEN DELETE;
	IF longitude > -111.987164 THEN DELETE;
	IF longitude < -112.152645 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergeCleanUp;
	SCATTER X = longitude Y = latitude;
	TITLE 'Phoenix Business Map';
RUN;

PROC SORT DATA = YelpMergeCleanUp;
	BY Date;

DATA yelp.Mbus_rev_centralphoenix;
	SET YelpMergeCleanUp;

RUN;



