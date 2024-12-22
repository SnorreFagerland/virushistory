**Name : P.M.S. Virus.**<br>
Type : Reset-proof memory-resident bootsector virus.<br>
Discovery date : May 20th 1989 (Chris Dudley).<br>
Virus can copy to drive(s) : A.<br>
Virus attaches itself to : XBIOS trap vector and reset vector.<br>
Disks can be immunized against it : Yes (1B4.L $2A2A2A20).<br>
Immunizable with UVK : Yes.<br>
What can happen : Text "\*\*\* The Pirate Trap \*\*\*,  \*  Youre being watched \*, \*\*\* (C) P.M.S. 1987 \*\*\*" (sic) appears on the screen.<br>
When does that happen : At each fiftieth copy of itself that is made.<br>
Reset-proof : Yes.<br>
Can copy to hard disk : No.<br>
Remark :  Contains a copyright message for 1987 (!). This  virus  might thus be VERY old and it is a miracle that is had slipped through the attention of ALL virus killers thus far. It is thought to be made by a software vendor to prevent people from copying software in his shop.  Due to obvious reasons, it is also called "Pirate Trap Virus".  This virus patched the XBIOS vector in such an effective way that, once the virus is in memory, it even patches bootsector reads to hide its presence.  It copies itself at each use of Floprd (XBIOS 8)!<br>


Source: https://web.archive.org/web/20140203050640/https://www.atari-forum.com/wiki/index.php?title=Listing_AVK
