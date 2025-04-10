/************************************************************************************************
 OPTIONS FOR THE VALUE STATEMENT                                                                                   
     This program creates a format to display data or to use with a put statement or function.                                                                         
     Keywords: PROC FORMAT, format, value statement                                                               
     SAS Versions: SAS 9, SAS Viya                                                    
     Documentation: https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=proc&docsetTarget=p1xidhqypi0fnwn1if8opjpqpbmn.htm
     1. The value statement creates a format that can be used to display data. We start by using PROC FORMAT with the 
        value statement to create two new formats. 
     2. We'll add the default= option to specify the length of the label. 
     3. For the second PROC FORMAT we'll add the fuzz value to indicate how close values must be to the ranges defined.
        We'll see the results in the PROC PRINT output.
     4. In the next PROC FORMAT we create a height format that has two ranges and add the multilabel option to allow 
        both ranges to be selected.
     5. In the PROC MEANS we use the mlf option with the order=option to generate statistics using both ranges.
************************************************************************************************/

proc format;/*1*/
   value $gen (default=1) 'F' = 'Female'
              'M' = 'Male';/*2*/
   value ht   (fuzz=1) low-57 = 'Below Average'
              57-67  = 'Average'
              67-high  = 'Above Average';/*3*/
run;

title "Listing of SASHELP.CLASS";
proc print data=sashelp.class noobs;   
    format sex $gen. height ht.;   /*4*/
run;

proc format;
   value height (multilabel) /*4*/
              low-57 = '1 Below Average'
              57-<67  = '2 Average'
              67-high  = '3 Above Average'/*3*/ 
              low-65 = 'Shorter'
              65<-high  = 'Taller';/*3*/
run;

title "Listing of SASHELP.CLASS";
proc means data=sashelp.class; 
    var weight; 
	class height / mlf order=formatted;
    format height height.;   /*5*/
run;
