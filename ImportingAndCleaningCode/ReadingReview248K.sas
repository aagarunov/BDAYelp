LIBNAME yelp '/folders/myfolders/YelpTables';

/* PROC IMPORT DATAFILE = '/folders/myfolders/YelpData/finalmerge248ktail.csv' OUT = YelpReview248k */
/* 	DBMS = CSV REPLACE; */

PROC IMPORT OUT = yelp.YelpReview248k 
             DATAFILE = "/folders/myfolders/YelpData/PhoenixBusinessReviews248k.xlsx"
             DBMS = xlsx REPLACE; 


PROC CONTENTS DATA = yelp.YelpReview248k;

RUN;
