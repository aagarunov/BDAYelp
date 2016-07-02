	
LIBNAME yelp '/folders/myfolders/YelpTables';

DATA business;
	SET yelp.arizonacentralphonenix248k;
	/* Jan 1st, 2011 - Julian Date	 */
	IF date < DATEJUL(2011001) THEN DELETE;

/* Pizzeria Bianco */
DATA businessClean1;
	SET business; 
 	IF business_id ~= 'VVeogjZya58oiTxK7qUjAQ' THEN DELETE;
 
/* Random Sampling */
PROC SURVEYSELECT DATA = businessClean1 
    METHOD=srs N=50 OUT= businessRandomSam1; 

 	
/* Cibo */
DATA businessClean2;
	SET business;
	IF business_id ~= 'V1nEpIRmEa1768oj_tuxeQ' THEN DELETE;

PROC SURVEYSELECT DATA = businessClean2 
    METHOD=srs N=50 OUT= businessRandomSam2; 


/* Lo-Lo's Chicken & Waffles */
DATA businessClean3;
	SET business;
	IF business_id ~= 'K8pM6qQdYu5h6buRE1-_sw' THEN DELETE;
	
PROC SURVEYSELECT DATA = businessClean3 
    METHOD=srs N=50 OUT= businessRandomSam3; 

	
/* The Arrogant Butcher */
DATA businessClean4;
	SET business;
	IF business_id ~= 'Xq9tkiHhyN_aBFswFeGLvA' THEN DELETE;

PROC SURVEYSELECT DATA = businessClean4 
    METHOD=srs N=50 OUT= businessRandomSam4; 

	
/* Matt's Big Breakfast  */
DATA businessClean5;
	SET business;
	IF business_id ~= '4X_XAOeMw7AFkYhg3NINJA' THEN DELETE;
	
PROC SURVEYSELECT DATA = businessClean5 
    METHOD=srs N=50 OUT= businessRandomSam5; 

	
/* 	Angels Trumpet Ale House */
DATA businessClean6;
	SET business;
	IF business_id ~= '41j3GB7M-Lwq284Pfb9zgw' THEN DELETE;
	
PROC SURVEYSELECT DATA = businessClean6 
    METHOD=srs N=50 OUT= businessRandomSam6; 

	
DATA mergedBusiness;
	MERGE businessRandomSam1 businessRandomSam2 businessRandomSam3 businessRandomSam4 businessRandomSam5 businessRandomSam6;
	by business_id;

PROC SORT DATA = mergedBusiness OUT = businessDate;
	by date;
	
ODS GRAPHICS / RESET IMAGENAME = 'CentralBusinessTOPSAMPLE' IMAGEFMT =PNG
HEIGHT = 10in WIDTH = 15in;
ODS LISTING GPATH = '/folders/myfolders/Graphs' ;

/* Plots for comparison purposes */
PROC SGPANEL DATA= businessDate;
	PANELBY name;
	SCATTER X = date Y = review_stars;
	TITLE "Random Sample Top 6 Business in Central Phoenix";

/* PROC CORR DATA = businessRandomSam1; */
/* 	TITLE "Pizzeria Bianco Correlation Matrix"; */
/* 	VAR date review_stars; */
/* 	 */




RUN;

