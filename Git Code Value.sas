/************************************************************************************************
 USING THE VALUE STATEMENT                                                                                   
     This program creates a format to display data or to use with a put statement or function.                                                                         
     Keywords: PROC FORMAT, format, value statement                                                               
     SAS Versions: SAS 9, SAS Viya                                                    
     Documentation: https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=proc&docsetTarget=p1xidhqypi0fnwn1if8opjpqpbmn.htm
     1. The value statement creates a format that can be used to display data. We start by using PROC FORMAT with two 
        value statements to create the new formats. 
     2. The value statement identifies the name of the new format. For character formats the name must begin with a $.
     3. For numeric formats the name does not include the dollar sign. Here we use the keywords 'low' and 'high' to
        indicate the range includes everythin from the lowest value to the highest.
     4. In the PROC PRINT we will apply the format and see the results.
************************************************************************************************/

proc format;/*1*/
   value $gen 'F' = 'Female'
              'M' = 'Male';/*2*/
   value ht   low-<57 = 'Below Average'
              57-<67  = 'Average'
              67-high  = 'Above Average';/*3*/
run;
title "Listing of SASHELP.CLASS";
proc print data=sashelp.class noobs;   
    format sex $gen. height ht.;   /*4*/
run;
