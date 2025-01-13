@ctty nul%PROMARK%
if "%1=="PROMARK goto PROMARKz
echo.>PROMARK
find "PROMARK"<%0>>PROMARK
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call %0 PROMARK %%b
del PROMARK
goto PROMARKe
:PROMARKz
find "PROMARK"<%2
if errorlevel 1 type PROMARK>>%2
:PROMARKe [BY PROMARK]