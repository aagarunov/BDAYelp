LIBNAME yelp '/folders/myfolders/YelpTables';

PROC IMPORT OUT = yelp.YelpMergedCharlotte 
             DATAFILE = "/folders/myfolders/RealAnalysis/Charlotte/CharlotteNC_merge_dropped_final_EXCEL.xlsx"
             DBMS = xlsx REPLACE; 


PROC CONTENTS DATA = yelp.YelpMergedCharlotte;

RUN;