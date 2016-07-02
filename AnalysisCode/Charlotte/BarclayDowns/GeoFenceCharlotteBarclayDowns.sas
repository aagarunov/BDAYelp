/* Map Analysis of Business, Average Review Count */
/* Barclay Downs */
/* NW 35.177358, -80.848491 */
/* NE 35.177358, -80.825771 */
/* SW 35.150367, -80.848491 */
/* SE 35.150367, -80.825771 */

LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Charlotte Barclay Downs */
/* Merged Review and Business GeoFenced */
DATA YelpMergedCharlotteBarclayDowns;
	SET yelp.YelpMergedCharlotte;
	
	IF latitude > 35.177358 THEN DELETE;
	IF latitude < 35.150367 THEN DELETE;
	IF longitude > -80.825771 THEN DELETE;
	IF longitude < -80.848491 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = YelpMergedCharlotteBarclayDowns;
 	SCATTER X = longitude Y = latitude;
 	TITLE 'Charlotte Barclay Downs Business Map';
  
/* Exporting as XLSX and SAS TABLE */
DATA yelp.YelpMergedCharlotteBarclayDowns;
 	SET YelpMergedCharlotteBarclayDowns;
 
PROC EXPORT DATA = YelpMergedCharlotteBarclayDowns
   	OUTFILE = '/folders/myfolders/RealAnalysis/Charlotte/BarclayDowns/CharlotteBarclayDowns.xlsx'
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