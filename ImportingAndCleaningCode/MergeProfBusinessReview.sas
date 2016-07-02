LIBNAME Yelp '/folders/myfolders/YelpTables/';

DATA YelpBusiness;
	SET Yelp.business1000;
	KEEP name stars business_id city categories latitude longitude pricerange review_count;
RUN;

/* Character Data problem */
PROC PRINT DATA = Yelp.review1000;
RUN;

DATA YelpReview;
	SET Yelp.review1000;
	DROP Type;
RUN;

PROC CONTENTS DATA = Yelp.review1000;
RUN;
/*  */
/* DATA YelpMerge; */
/* 	MERGE YelpBusiness YelpReview; */
/* 	BY business_id; */
/* RUN; */
