/* Map Analysis of Business, Average Review Count */
/* Four Wards */
/* NW 35.235162, -80.854471 */
/* NE 35.235162, -80.827916 */
/* SW 35.214866, -80.854471 */
/* SE 35.214866, -80.827916 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Charlotte Four Wards */
/* Merged Review and Business GeoFenced */
DATA YelpMergedCharlotteFourWards;
	SET yelp.YelpMergedCharlotte;
	
	IF latitude > 35.235162 THEN DELETE;
	IF latitude < 35.214866 THEN DELETE;
	IF longitude > -80.827916 THEN DELETE;
	IF longitude < -80.854471 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergedCharlotteFourWards;
 	SCATTER X = longitude Y = latitude;
 	TITLE 'Charlotte Four Wards Business Map';
  
/* Exporting as XLSX and SAS TABLE */
DATA yelp.YelpMergedCharlotteFourWards;
 	SET YelpMergedCharlotteFourWards;
 
PROC EXPORT DATA = YelpMergedCharlotteFourWards
   	OUTFILE = '/folders/myfolders/RealAnalysis/Charlotte/FourWards/CharlotteFourWards.xlsx'
    	DBMS = XLSX REPLACE;  
   	

/* Unique Business GeoFenced, How many businesses are in the area?*/
/* DATA UniqueArizonaCentralPhoenix248k; */
/* 	SET yelp.topreviewcount248k; */
/* 	 */
/* 	IF latitude > 33.466097 THEN DELETE; */
/* 	IF latitude < 33.419910 THEN DELETE; */
/* 	IF longitude > -111.995540 THEN DELETE; */
/* 	IF longitude < -112.109761 THEN DELETE; */
/* 	 */
/* Graph resturants on scatter plot */
/* PROC SGPLOT DATA = UniqueArizonaCentralPhoenix248k; */
/* 	SCATTER X = longitude Y = latitude; */
/* 	TITLE 'Central Phoenix Unique Business Map'; */


RUN;
RUN;