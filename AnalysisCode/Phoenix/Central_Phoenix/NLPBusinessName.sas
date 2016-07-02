
LIBNAME yelp '/folders/myfolders/YelpTables';

/* Deletes based on date and currently looking business_id and upcases text */
/* Replace business_id and Keyword */
DATA business;
	SET yelp.yelpmergedcharlottewilmore;
	/* Jan 1st, 2011 - Julian Date	 */
	IF date < DATEJUL(2011001) THEN DELETE;
	IF business_id = 'u6ZeJSqTxoQeQF013RtkNw' THEN DELETE;
	upcase_text = UPCASE(text);
	
/* Index finds the text location, if not found returns 0 */
DATA businessText;
	SET business;
	keyword = INDEX(upcase_text, "TREMONT");
	IF keyword = 0 THEN DELETE;
	

/* Identify unique businesses	 */
/* PROC SORT DATA = businessText nodupkey out=uniqueBusiness; */
/* 	by business_id; */
	
/* Exporting CSV file */
PROC EXPORT DATA = businessText
 	OUTFILE = '/folders/myfolders/RealAnalysis/Charlotte/Wilmore/NLP/TREMONT.xlsx'
  	DBMS = XLSX REPLACE;
RUN; 
