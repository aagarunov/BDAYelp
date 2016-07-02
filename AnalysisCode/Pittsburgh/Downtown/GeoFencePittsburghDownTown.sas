/* Map Analysis of Business, Average Review Count */
/* Downtown */
/* NW 40.438882, -79.996312 */
/* NE 40.438882, -79.971808 */
/* SW 40.433395, -79.996312 */
/* SE 40.433395, -79.971808 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Pittsburgh Downtown */
/* Merged Review and Business GeoFenced */
DATA YelpMergedPittsburghDowntown;
	SET yelp.YelpMergedPittsburgh;
	
	IF latitude > 40.438882 THEN DELETE;
	IF latitude < 40.433395 THEN DELETE;
	IF longitude > -79.971808 THEN DELETE;
	IF longitude < -79.996312 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergedPittsburghDowntown;
	SCATTER X = longitude Y = latitude;
	TITLE 'Pittsburgh Downtown Business Map';


/* Exporting as XLSX and SAS TABLE */
DATA yelp.YelpMergedPittsburghDowntown;
	SET YelpMergedPittsburghDowntown;


PROC EXPORT DATA = YelpMergedPittsburghDowntown 
  	OUTFILE = '/folders/myfolders/RealAnalysis/Pittsburgh/PittsburghDowntown.xlsx'
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