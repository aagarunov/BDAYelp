/* Map Analysis of Business, Average Review Count */
/* Wilmore */
/* NW 35.222247, -80.875890 */
/* NE 35.222247, -80.859325 */
/* SW 35.210606, -80.875890 */
/* SE 35.210606, -80.859325 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Charlotte Wilmore */
/* Merged Review and Business GeoFenced */
DATA YelpMergedCharlotteWilmore;
	SET yelp.YelpMergedCharlotte;
	
	IF latitude > 35.222247 THEN DELETE;
	IF latitude < 35.210606 THEN DELETE;
	IF longitude > -80.859325 THEN DELETE;
	IF longitude < -80.875890 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergedCharlotteWilmore;
 	SCATTER X = longitude Y = latitude;
 	TITLE 'Charlotte Wilmore Business Map';
  
/* Exporting as XLSX and SAS TABLE */
DATA yelp.YelpMergedCharlotteWilmore;
 	SET YelpMergedCharlotteWilmore;
 
PROC EXPORT DATA = YelpMergedCharlotteWilmore
   	OUTFILE = '/folders/myfolders/RealAnalysis/Charlotte/Wilmore/CharlotteWilmore.xlsx'
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