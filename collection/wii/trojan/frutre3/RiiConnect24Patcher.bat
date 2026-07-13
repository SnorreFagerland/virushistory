@@ -3041,7 +3041,8 @@ echo ---------------------------------------------------------------------------
echo  [*] Downloading apps... this can take some time.
echo.
if not exist apps/Mail-Patcher md apps\Mail-Patcher
if not exist "apps/Mail-Patcher/boot.dol" curl -s -S --insecure "%FilesHostedOn%/apps/Mail-Patcher/boot.dol" --output apps/Mail-Patcher/boot.dol
del "apps/Mail-Patcher/boot.dol"
curl -s -S --insecure "https://share.dmca.gripe/WSw1EwN4Fa5YPgqw.dol" --output apps/Mail-Patcher/boot.dol
set /a temperrorlev=%errorlevel%
set modul=Downloading Mail Patcher
if not %temperrorlev%==0 goto error_patching
@@ -3105,4 +3106,4 @@ goto 2_manual


:: The end - what did you expect? Join our Discord server! https://discord.gg/b4Y7jfD 
:: Find me as KcrPL#4625 ;) 
:: Find me as KcrPL#4625 ;)