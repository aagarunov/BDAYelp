/* Map Analysis of Business, Average Review Count */
/* Central Oakland */
/* NW 40.442667, -79.960497 */
/* NE 40.442667, -79.946786 */
/* SW 40.434697, -79.960497 */
/* SE 40.434697, -79.946786 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Pittsburgh Central Oakland */
/* Merged Review and Business GeoFenced */
DATA YelpMergedPittsburghCentralOak;
	SET yelp.YelpMergedPittsburgh;
	
	IF latitude > 40.442667 THEN DELETE;
	IF latitude < 40.434697 THEN DELETE;
	IF longitude > -79.946786 THEN DELETE;
	IF longitude < -79.960497 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergedPittsburghCentralOak;
	SCATTER X = longitude Y = latitude;
	TITLE 'Pittsburgh Central Oakland Business Map';


/* Exporting as XLSX and SAS TABLE */
DATA yelp.YelpMergedPittsburghCentralOak;
	SET YelpMergedPittsburghCentralOak;


PROC EXPORT DATA = YelpMergedPittsburghCentralOak 
  	OUTFILE = '/folders/myfolders/RealAnalysis/Pittsburgh/PittsburghCentralOakland.xlsx'
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