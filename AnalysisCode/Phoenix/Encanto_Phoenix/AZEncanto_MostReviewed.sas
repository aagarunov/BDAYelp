LIBNAME yelp '/folders/myfolders/YelpTables';

/* Find businesses with the most reviews first */
/* Removes all duplicates */
PROC SORT DATA = yelp.ArizonaEncantoPhoenix248k nodupkey out=review;
	by business_id;

/* Sorts by review_count */
PROC SORT DATA = review OUT = sortedReviewCount;
 	by DESCENDING review_count; 

/* Cleans up data set */
DATA yelp.AZEncantoTopReviewCount;
	set sortedReviewCount (KEEP=business_id categories name city average_business_stars latitude longitude price_range review_count);
	
 PROC EXPORT DATA = yelp.AZEncantoTopReviewCount
 	OUTFILE = '/folders/myfolders/RealAnalysis/AZEncantoTopReviewCount.xlsx'
  	DBMS = XLSX REPLACE; 
 RUN;