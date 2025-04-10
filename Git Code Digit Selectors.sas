/************************************************************************************************
 USING DIGIT SELECTORS IN THE PICTURE STATEMENT                                                                                   
     This program uses options to customize formats that display numeric data.                                                                         
     Keywords: PROC FORMAT, format, picture statement                                                               
     SAS Versions: SAS 9, SAS Viya                                                    
     Documentation: https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=proc&docsetTarget=p1xidhqypi0fnwn1if8opjpqpbmn.htm
     1. The picture statement creates an template for a numeric format that can be used to display data. The template 
        is defined using 0s and 9s where the 9 represents a digit that must be displayed while 0 represents a digit 
        that is displayed if it exists.
     2. We use the LOW and HIGH keywords to indicate that any non-missing value should be displayed.
     3. For Nonzero-digit selectors, values are printed with leading zeros. For Zero digit selectors only those positions
        that have values are printed. For example if my number is 123 and my format specifies 0009, the value will be
        printed as 123 but if I use a nonzero selector - 9999 - it will be printed as 0123.
     4. The noedit option specifies that numbers are not digit selectors, but messaging characters. Trailing characters are 
        not part of the template and are displayed as entered. 
     5. In the PROC REPORT we compare the results for using the format vs not using it.
************************************************************************************************/
data delay;
   infile datalines;
   input delay destination $3.;
   datalines;
-2 CPH 
-10 CPH 
-5 CPH 
13 CPH 
11 CPH 
-7 CPH 
15 CPH 
17 CPH 
2 CPH 
0 CPH 
10 CPH 
-9 CPH 
26 CPH 
-1 CPH 
-8 CPH 
-6 CPH 
1 CPH 
-1 CPH 
6 CPH 
21 CPH 
;
run;

proc format;/*1*/                                         
   picture delGrp 
      low-< 0 = 'Early Arrival' /*2*/
            0 = 'No Delay' 
            1 = '1 Minute Delay'
      1 <- 10 = '09 Minutes Delay' /*3*/
      10<-high= ' Delay Greater than 10 Minutes' (noedit);/*4*/
   picture delGx 
      low-< 0 = 'Early Arrival' 
            0 = 'No Delay' 
            1 = '1 Minute Delay'
      1 <- 10 = '99 Minutes Delay'
      10<-high= ' Delay Greater than 10 Minutes' (noedit);
   picture delGy 
      low-< 0 = 'Early Arrival' 
            0 = 'No Delay' 
            1 = '1 Minute Delay'
      1 <- 10 = '09 Minutes Delay'
      10<-high= ' Delay Greater than 10 Minutes';
run;

proc report data=delay nowd; /*5*/
   column delay delay=del delay=dx delay=dely;
   define dely / display format=comma12. 'Comma format';
   define delay / display format=delgrp. 'NOEDIT with 09';
   define del / format=delgx. 'NOEDIT with 99';
   define dx / format=delgy. '09 without NOEDIT';
   title 'Variations of Picture Formats';
run;