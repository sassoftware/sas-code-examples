/************************************************************************************************
 USING OPTIONS FOR THE PICTURE STATEMENT                                                                                   
     This program creates an format to display numeric data.                                                                         
     Keywords: PROC FORMAT, format, picture statement                                                               
     SAS Versions: SAS 9, SAS Viya                                                    
     Documentation: https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=proc&docsetTarget=p1xidhqypi0fnwn1if8opjpqpbmn.htm
     1. The picture statement creates an template for a numeric format that can be used to display data. In this 
        example we want to display the data using fill and prefix= options. The template is defined using 0s and 9s where
        the 9 represents a digit that must be displayed while 0 represents a digit that is displayed if it exists.
     2. We use the LOW and HIGH keywords to indicate that any non-missing value should be displayed with at least one
        digit to the left of the decimal point.
     3. In the first example we use the fill= option to specify a character to fill any 'empty' spaces in the formatted value. 
        You can specify one or more characters, but if you specify more than one it will use 0 as the fill character.
     4. In the second example we use the prefix= option to specify one or more characters to place before the template, 
        in this case a dollar sign.
     5. In the PROC REPORT we compare the results for using the two format options.
************************************************************************************************/

proc format;
   picture fill /*1*/
      low - high = '000,000,009' /*2*/ (fill='0') /*3*/
   ;
run;
 
proc format;
   picture pref /*1*/
      low - high = '000,000,009' (prefix='$') /*4*/
   ;
run;

title 'Data Displayed using a Custom Format';
proc report data=sashelp.cars nowd; /*5*/
   columns Make Model Type MSRP MSRP=MSRPForm;
   define MSRP / format=pref. 'Using Prefix';
   define MSRPForm / format = fill. 'Using Fill';
run;
