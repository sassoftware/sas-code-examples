/************************************************************************************************
 CREATE ANIMATED GIF
    Example program that generates an animated GIF. Adapted from the example
	   in the documentastion below.
    Keywords: Graphics, ODS
    SAS Versions: SAS 9, SAS Viya
    Documentation: https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/grstatug/p1xw4cbegqxrshn184m0n13yjfky.htm
    1. Define macro variables for various options
	2. Generate some data to power the animation
	3. Set SAS options and filename to prepare for animation
	4. Begin animation
	5. Redirect graphics to desired output file
	6. Use PROC GCHART with BY to generate animation frames
	7. End anumation and clean up
************************************************************************************************/

/************************************************************************************************
 1. Define macro variables for various options
	a. Note that the FPS (frames per second) option is the inverse of
	   the frame duration value we need, so we compute &ftime from &fps
	   using %SYSEVALF() for macro floating point calculations.
************************************************************************************************/
%LET nbars=15; 
%LET duration=10; 
%LET fps=10;
%LET outfile=~/anim.gif;

%LET ftime = %SYSEVALF( 1.0 / &fps );

/************************************************************************************************
 2. Generate some data to power the animation
	a. We produce &nbars bars, initially set to 0.5
	b. For every frame, bars grow or shrink by a RAN(NORMAL) amount
	c. Out BY variable is a truncated TIME10.1 to eliminate too many zeroes
	d. The values are constrained to [0,1] by the MIN(MAX()) trick
	e. TO &duration-&ftime makes 1 less frame to make the byline look better
	f. Yes, we compute unused values for one extra frame. Oh well.
************************************************************************************************/
DATA barz; 
	ARRAY a(&nbars) _TEMPORARY_ (&nbars*0.5); 
	do t = 0 to &duration-&ftime BY &ftime; 
		timestamp=SUBSTR(PUT(t,time10.1), 5, 6); 
		do bar=1 to &nbars; 
			val = a(bar); 
			output; 
			a(bar) = min(1, max(0, a(bar) + rand('normal', 0, 0.05))); 
		end; 
	end; 
run; 

/************************************************************************************************
 3. Set SAS options and filename to prepare for animation
	a. This includes turning off the byline. We'll see why below
************************************************************************************************/
FILENAME prtout "&outfile";

OPTIONS PRINTERPATH=GIF     /* We're writing a GIF file       */
  	NONUMBER NODATE         /* Noise reduction                */
  	ANIMDURATION=&ftime     /* Frame duration time again      */
  	ANIMLOOP=YES            /* Play continuously              */
  	NOANIMOVERLAY           /* Display graphs sequentially    */
  	NOBYLINE;               /* See below                      */
TITLE;
FOOTNOTE;

/************************************************************************************************
 4. Begin animation
	a. Note that this comes _before_ the ODS output redirection below
	b. You might think that it could come after the ODS statements. You
	   would be wrong
************************************************************************************************/
OPTIONS ANIMATE=START;

/************************************************************************************************
 5. Redirect graphics to desired output file
************************************************************************************************/
ODS _ALL_ CLOSE;
ODS PRINTER FILE=prtout STYLE=HTMLBLUE;

/************************************************************************************************
 6. Use PROC GCHART with BY to generate animation frames
	a. The AXIS1 statement ensures that all of the frames have a consistent
	   scale, regardless of the data values
	b. The TITLE statement using #BYVAL1 functions as a customizable byline
************************************************************************************************/
AXIS1 ORDER=(0 to 1 by 0.2); 
 
PROC GCHART DATA=barz; 
	VBAR bar / DISCRETE SUMVAR=val AXIS=axis1; 
	BY timestamp; 
	TITLE "Frame #BYVAL1";
RUN; 
QUIT; 


/************************************************************************************************
 7. End anumation and clean up
************************************************************************************************/
OPTIONS ANIMATE=STOP;
ODS PRINTER CLOSE;
* ODS HTML;  /* Not needed nor desirable in SAS/Studio */
