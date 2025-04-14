@echo off
:menu
echo.
echo.
echo                    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo                    º Win9x and Dos Restart Constructor º
echo                    ÈÍÍ»    dvl2003ro@yahoo.co.uk    ÉÍÍ¼
echo                       ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo                       º           RC 6.0            º
echo                       º          CreatorZ           º  
echo                       º        Dvl and Ratty        º        
echo                    ÉÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍ»
echo                    º Viruses don't harm, ignorance do! º
echo                    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo    Make a file(press a number from 1 to 6)
echo    ÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄ
echo.
echo    1 - Restart 1 (min.req. win95 + ie4.01)
echo    2 - Restart 2 (min.req. win95 + ie4.01)
echo    3 - Restart 3 (min.req. win95 + ie4.01)
echo    4 - Restart 4 (min.req. win95 + ie4.01)
echo    5 - Restart 5 (min.req. win95 + ie4.01)
echo    6 - Restart 6 (min.req. win95 + ie4.01)
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
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_1
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_1
@echo e 0120  69 6E 64 6F 77 73 45 78 20 30 20 0D 0A 00>>restart_1
@echo rcx>>restart_1
@echo 2D>>restart_1
@echo n bat>>restart_1
@echo w>>restart_1
@echo q>>restart_1
@debug<restart_1
@ren bat restart_1.bat
@deltree/y bat >nul
@deltree/y restart_1 >nul 
ctty con
goto done

:2
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_2
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_2
@echo e 0120  69 6E 64 6F 77 73 45 78 20 38 20 0D 0A 00>>restart_2
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

:3
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_3
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_3
@echo e 0120  69 6E 64 6F 77 73 45 78 20 32 20 0D 0A 00>>restart_3
@echo rcx>>restart_3
@echo 2D>>restart_3
@echo n bat>>restart_3
@echo w>>restart_3
@echo q>>restart_3
@debug<restart_3
@ren bat restart_3.bat
@deltree/y bat >nul
@deltree/y restart_3 >nul
ctty con
goto done

:4
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_4
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_4
@echo e 0120  69 6E 64 6F 77 73 45 78 20 33 0D 0A 00>>restart_4
@echo rcx>>restart_4
@echo 2C>>restart_4
@echo n bat>>restart_4
@echo w>>restart_4
@echo q>>restart_4
@debug<restart_4
@ren bat restart_4.bat
@deltree/y bat >nul
@deltree/y restart_4 >nul
ctty con
goto done

:5
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_5
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_5
@echo e 0120  69 6E 64 6F 77 73 45 78 20 35 0D 0A 00>>restart_5
@echo rcx>>restart_5
@echo 2C>>restart_5
@echo n bat>>restart_5
@echo w>>restart_5
@echo q>>restart_5
@debug<restart_5
@ren bat restart_5.bat
@deltree/y bat >nul
@deltree/y restart_5 >nul
ctty con
goto done

:6
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_6
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_6
@echo e 0120  69 6E 64 6F 77 73 45 78 20 36 0D 0A 00>>restart_6
@echo rcx>>restart_6
@echo 2C>>restart_6
@echo n bat>>restart_6
@echo w>>restart_6
@echo q>>restart_6
@debug<restart_6
@ren bat restart_6.bat
@deltree/y bat >nul
@deltree/y restart_6 >nul
ctty con
goto done

:done
cls