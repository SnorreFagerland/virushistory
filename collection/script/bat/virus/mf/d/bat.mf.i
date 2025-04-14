@echo off
if "%1=="$MF goto $MFz
echo. >$MF.bat
echo @echo off>>$MF.bat
find "$MF"<%0>>$MF.bat
echo echo on>>$MF.bat
for %%b in (*.bat) do call $MF.bat $MF %%b
del $MF.bat>nul
goto $MFe
:$MFz
if "%2=="autoexec.bat goto $MFe
find "$MF"<%2>nul
if not errorlevel 1 goto $MFe
type $MF.bat>>%2
rem BAT.$MF 3.1 by Duke/$MF
:$MFe
echo on

