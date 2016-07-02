/*Creates Permanant Data sets for Yelp Business Yelp10kReview, and cleaned merge Business and Review*/
/*Keep in mind that you have to change the LIBNAME PATH*/
LIBNAME yelp 'E:/myfolders/YelpTables';

/*PROC IMPORT OUT = yelp.YelpBusiness*/
/*            DATAFILE = "/folders/myfolders/YelpData/yelp_academic_dataset_business.xlsx" */
/*			DATAFILE = "E:/myfolders/YelpData/yelp_academic_dataset_business.xlsx"*/
/*            DBMS = xlsx REPLACE;*/


/*PROC IMPORT OUT = yelp.Yelp10kReview*/
/*			DATAFILE = "/folders/myfolders/YelpData/SAS_10kReviewSample.csv"*/
/*			DBMS = csv REPLACE;*/
			

/*DATA YelpBusiness;*/
/*	SET yelp.YelpBusiness;*/
/*	KEEP name stars business_id city categories latitude longitude pricerange review_count;*/
/*	IF business_id = " " THEN DELETE;*/

/*Cleans it to 77k business*/
DATA yelp.yelpbusinesscleaned;
	SET yelp.yelpbusiness;
	IF business_id = " " THEN DELETE;

PROC CONTENTS DATA = yelp.yelpbusinesscleaned;
RUN;

