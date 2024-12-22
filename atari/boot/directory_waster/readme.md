**Directory Waster Virus.**<br>
Type : Reset-proof memory-resident bootsector virus.<br>
Discovery date : Unknown (Michael Schussler).<br>
Virus can copy to drive(s) : Current floppy drive (A or B). <br>
Virus  attaches  itself  to : Hdv_bpb  vector, resvector; also undocumented reset-resistant.<br>
Disks can be immunized against it : No.<br>
Immunizable with UVK : No.<br>
What  can happen :  First twenty tracks of your disk  get  destroyed (both  side  0  and side 1!) <br>
When does  that  happen :  After  each twentieth copy it made of itself.<br>
Reset-proof : Yes.<br>
Can copy to hard disk : No.<br>
Remark : The name is quite improper, as it destroys about 25% of a disk and not just the  directory. Initially, this virus only installs itself  on the standard reset vector. After the first reset, it bends the hdv_bpb vector and becomes reset-resistant in the undocumented way.


Source: https://web.archive.org/web/20140203050640/https://www.atari-forum.com/wiki/index.php?title=Listing_AVK
