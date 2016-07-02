/* Map Analysis of Business, Average Review Count */
/* Bloomfield */
/* NW 40.465728, -79.953775 */
/* NE 40.465728, -79.935858 */
/* SW 40.454267, -79.953775 */
/* SE 40.454267, -79.935858 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Pittsburgh Bloomfield */
/* Merged Review and Business GeoFenced */
DATA YelpMergedPittsburghBloomfield;
	SET yelp.YelpMergedPittsburgh;
	
	IF latitude > 40.465728 THEN DELETE;
	IF latitude < 40.454267 THEN DELETE;
	IF longitude > -79.935858 THEN DELETE;
	IF longitude < -79.953775 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergedPittsburghBloomfield;
	SCATTER X = longitude Y = latitude;
	TITLE 'Pittsburgh Central Oakland Business Map';


/* Exporting as XLSX and SAS TABLE */
DATA yelp.YelpMergedPittsburghBloomfield;
	SET YelpMergedPittsburghBloomfield;


PROC EXPORT DATA = YelpMergedPittsburghBloomfield
  	OUTFILE = '/folders/myfolders/RealAnalysis/Pittsburgh/Bloomfield/PittsburghBloomfield.xlsx'
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