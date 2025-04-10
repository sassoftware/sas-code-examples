/************************************************************************************************
 USING THE PICTURE STATEMENT                                                                                   
     This program creates an format to display numeric data.                                                                         
     Keywords: PROC FORMAT, format, picture statement                                                               
     SAS Versions: SAS 9, SAS Viya                                                    
     Documentation: https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=proc&docsetTarget=p1xidhqypi0fnwn1if8opjpqpbmn.htm
     1. The picture statement creates an template for a numeric format that can be used to diaplay data. In this 
        example we want to display the data using K to represent thousands. The template is defined using 0s and 9s where
        the 9 represents a digit that must be displayed while 0 represents a digit that is displayed if it exists.
     2. We use the LOW and HIGH keywords to indicate that any non-missing value up to 1,000 should be displayed as is,
        while values above 1,000 should be displayed in thousands with the K.
     3. Trailing characters, not part of the template, like the K are displayed as entered. The mult= option shows how the
        number must be multiplied to display correctly.
     4. In the PROC REPORT we compare the results for using the format vs not using it.
     5. In the next PROC FORMAT we create the thousr format using the round option so that the values will be rounded
        rather than truncated.
     6. We use PROC REPORT to show the results of rounding vs truncating. 
************************************************************************************************/

proc format;
   picture thous /*1*/
      low -<1000=009 /*2*/
	  1000 - high = 009K (mult=.001) /*3*/
   ;
run;
 
title 'Data Displayed using a Custom Format';/*4*/
proc report data=sashelp.cars(obs=25) nowd;
   columns Make Model Type MSRP MSRP=MSRPForm;
   define MSRPForm / format = thous. 'Formatted MSRP';
run;

proc format;
   picture thousr (round) /*5*/
      low -<1000=009 
	  1000 - high = 009K (mult=.001) 
   ;
run;
 
title 'Data Displayed using a Custom Format';/*6*/
proc report data=sashelp.cars(obs=25) nowd;
   columns Make Model Type MSRP MSRP=MSRPForm MSRP=MSRPRound;
   define MSRPForm / format = thous. 'Formatted without rounding';
   define MSRPRound / format = thousr. 'Formatted with rounding';
run;