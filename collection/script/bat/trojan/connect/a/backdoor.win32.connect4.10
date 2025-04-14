@echo off
echo This batch file will compress BOTH the client and 
echo server, and place the newly  compressed executables
echo into the "Packed" directory.
echo.
pause
mkdir Packed
del Packed\Client.exe
del Packed\Server.exe
echo.
echo Compressing client...
upx --best -o Packed\Client.exe Client.exe
echo.
echo Compressing server...
upx --best -o Packed\Server.exe Server.exe
echo.
echo Compression complete.
pause