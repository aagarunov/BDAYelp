LIBNAME yelp '/folders/myfolders/YelpTables';

/* Find businesses with the most reviews first */
/* Removes all duplicates */
PROC SORT DATA = yelp.yelpreview248k nodupkey out=review;
	by business_id;

/* Sorts by review_count */
PROC SORT DATA = review OUT = sortedReviewCount;
 	by DESCENDING review_count; 

/* Freq counts only Unique business_id, but leaves out the business name */
/* PROC FREQ DATA= yelp.yelpreview248k nlevels; */
/*    tables business_id; */
/* title 'Number of distinct values for each variable';  */

/* Cleans up data set */
DATA yelp.topreviewcount248k;
	set sortedReviewCount (KEEP=business_id categories name city average_business_stars latitude longitude price_range review_count);
/*  */
/* PROC EXPORT DATA = yelp.topreviewcount248k  */
/* 	OUTFILE = '/folders/myfolders/RealAnalysis/Top_Review_Count_248k.xlsx' */
/*  	DBMS = XLSX REPLACE; */
 RUN;