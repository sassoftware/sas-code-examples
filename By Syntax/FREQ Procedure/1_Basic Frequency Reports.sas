/************************************************************************************************
 BASIC FREQUENCY REPORTS                                                                      
     This program generates frequency counts for each unique values in columns in the         
         SASHELP.CARS table.                                                                 
     Keywords: PROC FREQ, frequency, aggregate                                               
     SAS Versions: SAS 9, SAS Viya                                                            
     Documentation:  https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=procstat&docsetTarget=procstat_freq_toc.htm                                                            */
     1. The default PROC FREQ step generates a frequency report for each column in the table. 
     2. The TABLE or TABLES statement with one or more columns listed with spaces inbetween   
        generates a separate frequency table for each column.                               
     3. If an asterisk is used between columns, the report shows frequency counts for the     
        combination of unique values between the columns.                                     
************************************************************************************************/

title "Frequency Counts for All Columns";
proc freq data=sashelp.cars;    /*1*/
run;
title;

title "Frequency Counts for TYPE or ORIGIN";
proc freq data=sashelp.cars;    
    tables type origin;         /*2*/
run;
title;

title "Frequency Counts for Combination of TYPE and ORIGIN";
proc freq data=sashelp.cars;    
    tables type*origin;         /*3*/
run;
title;

/* END */
