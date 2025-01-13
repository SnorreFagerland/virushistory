@echo off %MF%
if "%1=="MF goto $MF
for %%b in (*.bat) do call %0 MF %%b
del $MF
goto MFE
:$MF
find "MF"<%2>nul
if errorlevel 1 goto MFz
goto close %MF%
:MFz
find "MF"<%0>$MF
type %2>>$MF
echo.>>$MF
echo :close>>$MF
type $MF>%2
goto close %MF%
:MFE
echo on %MF%
:close
