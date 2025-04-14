@echo off
:menu
echo.
echo.
echo                    ษอออออออออออออออออออออออออออออออออออป
echo                    บ Win9x and Dos Restart Constructor บ
echo                    ศออป    dvl2003ro@yahoo.co.uk    ษออผ
echo                       ฬอออออออออออออออออออออออออออออน
echo                       บ           RC 7.0            บ
echo                       บ          CreatorZ           บ  
echo                       บ        Dvl and Ratty        บ        
echo                    ษออสอออออออออออออออออออออออออออออสออป
echo                    บ Viruses don't harm, ignorance do! บ
echo                    ศอออออออออออออออออออออออออออออออออออผ
echo.
echo    Make a file(press a number from 1 to 6)
echo    ฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤอฤ
echo.
echo    1 - Restart 1   (min.req. msdos 6.0)
echo    2 - Restart 2   (min.req. msdos 6.0)
echo    3 - Restart 3 (min.req. win95 + ie4.01)
echo    4 - Restart 4   (min.req. msdos 6.0)
echo    5 - Restart 5   (min.req. msdos 6.0)
echo    6 - Restart 6   (min.req. msdos 6.0)
echo.
echo    Q - Quit (Are u sure ???)
echo.
choice /c:123456Q>nul
if errorlevel 7 goto done
if errorlevel 6 goto 6
if errorlevel 5 goto 5
if errorlevel 4 goto 4
if errorlevel 3 goto 3
if errorlevel 2 goto 2
if errorlevel 1 goto 1
echo CHOICE missing
goto done

:1
ctty nul
@echo e 0100  66 B8 40 00 8E D8 66 B8 7F 7F 66 67 A3 72 00 EA>>Coldboot
@echo e 0110  00 00 FF FF 28 43 29 6F 70 79 72 69 67 68 74 20>>Coldboot
@echo e 0120  31 39 39 37 20 62 79 20 44 61 6D 61 67 65 2C 20>>Coldboot
@echo e 0130  49 4E 43 2E 20 20 57 72 69 74 74 65 6E 20 62 79>>Coldboot
@echo e 0140  20 42 4C 41 43 4B 45 4E 45 44 20 00>>Coldboot
@echo rcx>>Coldboot
@echo 4B>>Coldboot
@echo n com>>Coldboot
@echo w>>Coldboot
@echo q>>Coldboot
@debug<Coldboot
@ren com Coldboot.com
@deltree/y com >nul
@deltree/y Coldboot >nul 
ctty con
goto done

:2
ctty nul
@echo e 0100  48 50 53 CB 0D 0A 00>>restart_1
@echo rcx>>restart_1
@echo 6>>restart_1
@echo n com>>restart_1
@echo w>>restart_1
@echo q>>restart_1
@debug<restart_1
@ren com restart_1.com
@deltree/y com >nul
@deltree/y restart_1 >nul
ctty con
goto done

:3
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_2
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_2
@echo e 0120  69 6E 64 6F 77 73 45 78 20 31 20 0D 0A 00>>restart_2
@echo rcx>>restart_2
@echo 2D>>restart_2
@echo n bat>>restart_2
@echo w>>restart_2
@echo q>>restart_2
@debug<restart_2
@ren bat restart_2.bat
@deltree/y bat >nul
@deltree/y restart_2 >nul
ctty con
goto done

:4
ctty nul
@echo e 0100  BA 40 00 8E DA BB 72 00 C7 07 34 12 EA 00 00 FF>>Warmboot
@echo e 0110  FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0120  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0130  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0140  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0150  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0160  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0170  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>Warmboot
@echo e 0180  00>>Warmboot
@echo rcx>>Warmboot
@echo 80>>Warmboot
@echo n com>>Warmboot
@echo w>>Warmboot
@echo q>>Warmboot
@debug<Warmboot
@ren com Warmboot.com
@deltree/y com >nul
@deltree/y Warmboot >nul
ctty con
goto done

:5
ctty nul
@echo e 0100  B8 40 00 50 1F C7 06 72 00 34 12 B8 FF FF 50 B8>>restart_3
@echo e 0110  00 00 50 CB 00>>restart_3
@echo rcx>>restart_3
@echo 14>>restart_3
@echo n com>>restart_3
@echo w>>restart_3
@echo q>>restart_3
@debug<restart_3
@ren com restart_3.com
@deltree/y com >nul
@deltree/y restart_3 >nul
ctty con
goto done

:6
ctty nul
@echo e 0100  B4 0D CD 21 B8 40 00 8E D8 3E 80 0E 17 00 0C B8>>restart_4
@echo e 0110  53 4F CD 15 3E C7 06 72 00 34 12 EA F0 FF 00 F0>>restart_4
@echo e 0120  00>>restart_4
@echo rcx>>restart_4
@echo 20>>restart_4
@echo n com>>restart_4
@echo w>>restart_4
@echo q>>restart_4
@debug<restart_4
@ren com restart_4.com
@deltree/y com >nul
@deltree/y restart_4 >nul
ctty con
goto done

:done
cls