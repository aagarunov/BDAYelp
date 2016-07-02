/* Map Analysis of Business, Average Review Count */
/* Encanto */
/* NW 33.500343, -112.112487 */
/* NE 33.500343, -112.043499 */
/* SW 33.466271, -112.112487 */
/* SE 33.466271, -112.043499 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Arizona Central Phoenix */
/* Merged Review and Business GeoFenced */
DATA ArizonaEncantoPhoenix248k;
	SET yelp.yelpreview248k;
	
	IF latitude > 33.500343 THEN DELETE;
	IF latitude < 33.466271 THEN DELETE;
	IF longitude > -112.043499 THEN DELETE;
	IF longitude < -112.112487 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = ArizonaEncantoPhoenix248k;
	SCATTER X = longitude Y = latitude;
	TITLE 'Encanto Phoenix Business Map';


/* Exporting as XLSX and SAS TABLE */
DATA yelp.ArizonaEncantoPhoenix248k;
	SET ArizonaEncantoPhoenix248k;


 PROC EXPORT DATA = ArizonaEncantoPhoenix248k
  	OUTFILE = '/folders/myfolders/RealAnalysis/ArizonaEncantoPhoenix248k.xlsx'
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