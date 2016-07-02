LIBNAME yelp '/folders/myfolders/YelpTables';

/* Find businesses with the most reviews first */
/* Removes all duplicates */
PROC SORT DATA = yelp.yelpmergedcharlottebarclaydowns nodupkey out=review;
	by business_id;

/* Sorts by review_count */
PROC SORT DATA = review OUT = sortedReviewCount;
 	by DESCENDING review_count; 

/* Cleans up data set */
DATA yelp.Charlotte_BarclayDowns_TopReview;
	set sortedReviewCount (KEEP=business_id categories name city stars_y latitude longitude attributes_Price_Range review_count);
	
 PROC EXPORT DATA = yelp.Charlotte_BarclayDowns_TopReview
 	OUTFILE = '/folders/myfolders/RealAnalysis/Charlotte/BarclayDowns/Charlotte_BarclayDowns_TopReviewCount.xlsx'
  	DBMS = XLSX REPLACE; 
 RUN;