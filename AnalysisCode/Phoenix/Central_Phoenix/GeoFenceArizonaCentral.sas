/* Map Analysis of Business, Average Review Count */
/* Central City */
/* NW 33.466097, -112.109761 */
/* NE 33.466097, -111.995540 */
/* SW 33.419910, -112.109761 */
/* SE 33.419910, -111.995540 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Arizona Central Phoenix */
/* Merged Review and Business GeoFenced */
DATA ArizonaCentralPhoenix248k;
	SET yelp.yelpreview248k;
	
	IF latitude > 33.466097 THEN DELETE;
	IF latitude < 33.419910 THEN DELETE;
	IF longitude > -111.995540 THEN DELETE;
	IF longitude < -112.109761 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = ArizonaCentralPhoenix248k;
	SCATTER X = longitude Y = latitude;
	TITLE 'Central Phoenix Business Map';


/* Exporting as XLSX and SAS TABLE */
DATA yelp.ArizonaCentralPhonenix248k;
	SET ArizonaCentralPhoenix248k;


/* PROC EXPORT DATA = ArizonaCentralPhoenix248k */
/*  	OUTFILE = '/folders/myfolders/RealAnalysis/ArizonaCentralPhoenix248k.xlsx' */
/*   	DBMS = XLSX REPLACE;  */


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