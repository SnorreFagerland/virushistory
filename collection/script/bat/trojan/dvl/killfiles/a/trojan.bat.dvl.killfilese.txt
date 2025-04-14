@echo off
:menu
echo.
echo.
echo.
echo      ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo      ³ °±²Û Welcome to Junk Remover by DvL v 5.1 for BZ #1 Û²±° ³
echo      ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo              www.geocities.com/ratty_dvl/BATch/main.htm
echo.
echo      ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo      º  Note: This tool will work only on win95, win98 systems  º
echo      ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo.
echo    1  Read the disclaimer
echo.
echo    2  Clean the Recycle Bin (for c:\ & d:\ drives)
echo.
echo    3  Full cleaning
echo.
echo.
echo    Q  eXit
echo.
choice /c:123Q>nul
if errorlevel 4 goto done
if errorlevel 3 goto 3
if errorlevel 2 goto 2
if errorlevel 1 goto 1
echo CHOICE missing
goto done

:1
ctty nul
cls
@start /max c:\windows\notepad.exe readme.txt >nul
ctty con
cls
goto menu

:2
ctty nul
cls
@for %%a in (c:\recycled\, d:\recycled\) do deltree/y >nul %%a
ctty con
cls
goto menu

:3
ctty nul
cls
@deltree/y c:\windows\temp\ >nul
@deltree/y c:\windows\temp >nul
@md c:\windows\Temp >nul
@deltree/y c:\temp\ >nul
@deltree/y c:\temp >nul
@deltree/y c:\tmp\ >nul
@deltree/y c:\tmp >nul
@for %%b in (%windir%\recent\, %windir%\favorites\, %windir%\history\, %windir%\cookies\, %windir%\tempor~1\, c:\progra~1\wincmd\*.url, c:\progra~1\winrar\*.txt, c:\progra~1\xvid\*.url, c:\windows\*.~*) do deltree/y >nul %%b
@for %%c in (c:\progra~1\regcle~1\backups\, %windir%\help\*.gid, %windir%\system\*.gid, %windir%\inf\other\*.now, c:\mypict~1\thumbs.db, c:\progra~1\totalcmd\*.txt, c:\progra~1\totalcmd\*.wri) do deltree/y >nul %%c
@for %%d in (c:\mydocu~1\mypict~1\thumbs.db, %windir%\shelli~1, %windir%\ttfcache, %windir%\locals~1\tempor~1\, %windir%\applic~1\micros~1\office\recent\, c:\progra~1\totalcmd\*.url, c:\*.prv) do deltree/y >nul %%d
@for %%e in (%windir%\pchealth\helpctr\datacoll\, c:\progra~1\window~2\*.log, %windir%\verlauf\, c:\progra~1\belarc\advisor\system\tmp\*.htm, c:\progra~1\cpu-z\*.htm, c:\progra~1\xvid\*.txt) do deltree/y >nul %%e
@for %%f in (c:\progra~1\office~1\*.log, c:\progra~1\iolo\system~1\manua*.txt, c:\progra~1\inocul~2\aup*.exe, c:\progra~1\intern~1\*.txt, c:\progra~1\plus!\*.txt, c:\progra~1\xvid\*.gid) do deltree/y >nul %%f
@for %%g in (c:\program files\mirc\logs\, c:\progra~1\winamp\demo.mp3, c:\progra~1\winamp\*.txt, c:\progra~1\winamp\*.htm, c:\progra~1\wincmd\*.txt, c:\progra~1\wincmd\*.gid, c:\progra~1\totalcmd\*.gid) do deltree/y >nul %%g
@for %%h in (c:\progra~1\xvid\*.htm, %windir%\system\directx\dinput\*.png, %windir%\sysbckup\rbbad.cab, c:\windows\system\sfp\sfplog.txt, c:\windows\system\ff*.txt, c:\windows\system\advert.dll, c:\windows\web\wallpa~1\) do deltree/y >nul %%h
@for %%i in (%windir%\applog\, %windir%\applic~1\tempor~1\, %windir%\index.dat, %windir%\mscreate.dir, c:\windows\msdownld.tmp, c:\windows\backup*.wbk, c:\windows\iq-point, c:\windows\*.---, c:\windows\*.$*) do deltree/y >nul %%i
@for %%j in (c:\windows\*.~mp, c:\windows\~*.*, c:\windows\*.??~, c:\windows\*.dos, c:\windows\*.ftg, c:\windows\*.fts, c:\windows\*.nch, c:\windows\*.now, c:\windows\*.pch, c:\windows\*.prv, c:\windows\*.rws) do deltree/y >nul %%j
@for %%k in (c:\windows\*.?~?, c:\windows\*.00*, c:\windows\*.ilk, c:\windows\*.log, c:\windows\*.mtx, c:\windows\*.ncb, c:\windows\*.old, c:\windows\*.sbr, c:\windows\*.syd, c:\windows\*.tmp, c:\windows\*.txt) do deltree/y >nul %%k
@for %%l in (c:\windows\*.aps, c:\windows\*.wc, c:\windows\*.wri, c:\mscreate.dir, c:\msdownld.tmp, c:\backup*.wbk, c:\*.---, c:\*.$*, c:\*.~*, c:\*.~mp, c:\~*.*, c:\*.??~, c:\*.?~?, c:\*.00*, c:\*.aps) do deltree/y >nul %%l
@for %%m in (c:\windows\*.bad, c:\*.bad, c:\*.bak, c:\*.bk?, c:\*.bmk, c:\*.bsc, c:\*.rws, c:\*.syd, c:\*.tmp, c:\suhdlog.dat, c:\windows\*.htz, c:\windows\*.gid, c:\windows\*.chk, c:\windows\*.dmp) do deltree/y >nul %%m
@for %%n in (c:\windows\*.bak, c:\*.chk, c:\*.db$, c:\*.dmp, c:\*.dos, c:\*.ftg, c:\*.sbr, c:\*.txt, c:\*.pchc:\windows\*.bsc, c:\*.wri, c:\*.mtx, c:\*.ilk, c:\*.htz, c:\*.gid) do deltree/y >nul %%n
@for %%o in (c:\windows\*.bk?, c:\*.fts, c:\*.log, c:\*.ncb, c:\*.nch, c:\*.now, c:\*.wc, c:\iq-point, c:\windows\*.db$, c:\*.old, c:\windows\*.bmk) do deltree/y >nul %%o
ctty con
cls
goto done

:done
cls