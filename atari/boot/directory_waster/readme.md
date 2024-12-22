**Directory Waster Virus.**<br><br>
Type : Reset-proof memory-resident bootsector virus.<br>
Discovery date : Unknown (Michael Schussler).<br>
Virus can copy to drive(s) : Current floppy drive (A or B).

Virus  attaches  itself  to :   Hdv_bpb  vector,   resvector;   also   
 undocumented reset-resistant.

Disks can be immunized against it : No.

Immunizable with UVK : No.

What  can happen :  First twenty tracks of your disk  get  destroyed (both  side  0  and side 1!) <br>
When does  that  happen :  After  each twentieth copy it made of itself.<br>

Reset-proof : Yes.

Can copy to hard disk : No.

Remark : The name is quite improper,  as it destroys about 25% of  a 
 disk  and  not just the  directory.  Initially,  this  virus  only 
 installs  itself  on the standard reset vector.  After  the  first 
 reset,  it bends the hdv_bpb vector and becomes reset-resistant in 
 the undocumented way.
