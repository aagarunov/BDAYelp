LIBNAME yelp '/folders/myfolders/YelpTables';

/* Find businesses with the most reviews first */
/* Removes all duplicates */
PROC SORT DATA = yelp.yelpmergedpittsburghdowntown nodupkey out=review;
	by business_id;

/* Sorts by review_count */
PROC SORT DATA = review OUT = sortedReviewCount;
 	by DESCENDING review_count; 

/* Cleans up data set */
DATA yelp.Pittsburgh_DownTown_TopReview;
	set sortedReviewCount (KEEP=business_id categories name city stars_y latitude longitude attributes_Price_Range review_count);
	
 PROC EXPORT DATA = yelp.Pittsburgh_DownTown_TopReview
 	OUTFILE = '/folders/myfolders/RealAnalysis/Pittsburgh/Bloomfield/Pittsburgh_Downtown_TopReviewCount.xlsx'
  	DBMS = XLSX REPLACE; 
 RUN;