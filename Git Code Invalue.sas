/************************************************************************************************
 USING THE INVALUE STATEMENT                                                                                   
     This program creates an informat to read in or convert data with an input statement or function.                                                                         
     Keywords: PROC FORMAT, informat, invalue statement                                                               
     SAS Versions: SAS 9, SAS Viya                                                    
     Documentation: https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=proc&docsetTarget=p1xidhqypi0fnwn1if8opjpqpbmn.htm
     1. The invalue statement creates an informat that can be used to read in data. In this example we want to read data
        that could be either a number or a character string.  
     2. In the data step we will use the informat to read in all the values as numbers. We will read the values a second time
        as a string. 
     3. In the PROC PRINT and the PROC MEANS we will see the results of using the informat.
************************************************************************************************/

proc format;
   invalue eval 
      'Excellent'=4
           'Good'=3
           'Fair'=2
           'Poor'=1
   ;/*1*/
run;
 
data evals;
   input EmployeeId $ @6 Evaluation eval. @6 String $9.;/*2*/
datalines;
2355 Good     
5889 2        
3878 Excellent
4409 Poor     
0740 Fair     
2398 Excellent
4421 3        
7385 Good     
;
run;
title 'Data Read using a Custom Informat';/*3*/
proc print data=evals;
run;
proc means data=evals;
run;
 