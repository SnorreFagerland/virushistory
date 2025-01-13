@echo off
echo This file generate 10 mutated batch files (0.bat - 9.bat).
echo Files mutated with Advanced Batch Mutator (ABM) v1.3 by Duke/SMF
if "%1==" goto Empty
for %%a in (0 1 2 3 4 5 6 7 8 9) do ABM_13.EXE %1 %%a.bat ;@>nul
echo Well done !
exit
:Empty
echo Run this file "MAKEGEN.BAT sample.bat", where sample.bat - your batch file
