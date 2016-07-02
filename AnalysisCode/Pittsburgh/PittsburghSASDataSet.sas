LIBNAME yelp '/folders/myfolders/YelpTables';

PROC IMPORT OUT = yelp.YelpMergedPittsburgh 
             DATAFILE = "/folders/myfolders/RealAnalysis/Pittsburgh/PittsburghPA_merge_dropped_final_EXCEL.xlsx"
             DBMS = xlsx REPLACE; 


PROC CONTENTS DATA = yelp.YelpMergedPittsburgh;

RUN;