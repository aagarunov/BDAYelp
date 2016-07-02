/* Map Analysis of Business, Average Review Count */
/* North Mountain */
/* NW 33.633322, -112.168610 */
/* NE 33.633322, -112.045506 */
/* SW 33.553203, -112.168610 */
/* SE 33.553203, -112.045506 */


LIBNAME yelp '/folders/myfolders/YelpTables';


/* GeoFence Arizona Central Phoenix */
/* Merged Review and Business GeoFenced */
DATA ArizonaNorthMountPhoenix248k;
	SET yelp.yelpreview248k;
	
	IF latitude > 33.633322 THEN DELETE;
	IF latitude < 33.553203 THEN DELETE;
	IF longitude > -112.045506 THEN DELETE;
	IF longitude < -112.168610 THEN DELETE;
	
/* Graph resturants on scatter plot */
PROC SGPLOT DATA = ArizonaNorthMountPhoenix248k;
	SCATTER X = longitude Y = latitude;
	TITLE 'North Mountain Phoenix Business Map';


/* Exporting as XLSX and SAS TABLE */
DATA yelp.ArizonaNorthMountPhoenix248k;
	SET ArizonaNorthMountPhoenix248k;


 PROC EXPORT DATA = ArizonaNorthMountPhoenix248k
  	OUTFILE = '/folders/myfolders/RealAnalysis/ArizonaNorthMountPhoenix248k.xlsx'
   	DBMS = XLSX REPLACE;




RUN;
RUN;