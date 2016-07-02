/* LIBNAME yelp '/folders/folders/' */

PROC IMPORT DATAFILE = '/folders/myfolders/YelpData/SAS_10kReviewSample.csv' OUT =YelpReview
	DBMS = CSV REPLACE;
RUN;

PROC CONTENTS DATA = YelpReview;
RUN;

/* Strange characters prevent preventing */
/* Don't need to work on this right now */
/* PROC PRINT DATA = YelpReview; */
/* 	TITLE 'Yelp Review 10k Data'; */
/* RUN; */