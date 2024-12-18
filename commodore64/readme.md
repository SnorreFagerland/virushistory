<h2>Commodore 64 as a target</h2>
<br>
While surely not the most popular platform anymore, there actually are viruses written for the Commodore 64. <br>
Posts on the old C64 mailing list describe a handful, such as Bula, HIV and BHP.<br><br>

**Bula** <br>
These are viruses likely originating in Poland. There's a [virus encyclopedia entry](http://virus.wikidot.com/bula), and the incredible Cesare Pizzi did a proper analysis and presented on DEFCON30.<br><br>
*Analysis*<br>
https://github.com/cecio/BULA-Virus<br>
*Presentation*<br>
https://www.youtube.com/watch?v=Dl7l7gdr34o


<br><br>**BHP** <br>
This is the description from the C64 mailing list:<br><br>

>BHP-Virus
---------

Author:  Dr.Dr.Strobe & Papa Hacker & Garfield
Size:    2030 bytes. (9 Blocks)
Type:    Memory-resident parasitic prepender.
Infects: Commodore 64 Basic files.
Payload: Displays text under certain conditions:

	DR.DR.STROBE&PAPA HACKER WAS HERE!
	COPROGRAMMER: GARFIELD
	
	HALLO DICKERCHEN, DIES IST EIN ECHTER
	VIRUS!
	
	SERIALNO.:2

Removal:

first virus for the C64 ever, often said to be _the_ first virus in computer 
history ever (which is not true, there were others before for cp/m, the apple 2e
etc).

9      "bhp virus.prg"     prg

The following description is a cleaned up and shortened summary of the symantec 
virus bulletin january 2005 (http://pferrie.tripod.com/papers/bhp.pdf)

(note: this is still messy and may contain errors)

As with all Commodore 64 programs, BHP began with
some code written in Basic. This code consisted of a single
line, a SYS call to the assembler code, where the
rest of the virus resided. Unlike many programs, the virus
code built the address to call dynamically. This may have
been written by a very careful coder, but it proved to be
unnecessary because the address did not change in later
versions of the machine.

Once the assembler code gained control, it placed itself in
the block of memory that was normally occupied by the I/O
devices when the ROM was banked-in.

A side-effect of memory-banking was that it was a great
way to hide a program, since the program was not visible if
its memory was not banked in. This is the reason why BHP
placed its code in banked memory.
After copying itself to banked memory, the virus restored
the host program to its original memory location and
restored the program size to its original value. This allowed
the host program to execute as though it were not infected.
However, at this time the virus would verify the checksum
of the virus?s Basic code, and would overwrite the host
memory if the checksum did not match.
An interesting note about the checksum routine is that it
missed the first three bytes of the code, which were the line
number and SYS command. This made the job easier for the
person who produced the later variant of the virus. Although
the later variant differed only in the line number, this was
sufficient to defeat the BHP-Killer program, because
BHP-Killer checked the entire Basic code, including the
line number.

The virus checked whether it was running already by
reading a byte from a specific memory location. If that
value matched the expected value, the virus assumed that
another copy was running. Thus, writing that value to that
memory location would have been an effective inoculation
method.
If no other copy of the virus was running, the virus would
copy some code into a low address in non-banked memory,
and hook several vectors, pointing them to the copied code.

The virus hooked the ILOAD, ISAVE, MAIN, NMI,
CBINV and RESET vectors.
The hooking of MAIN, NMI, CBINV and RESET made the
virus Break-proof, Reset-proof, and Run/Stop-Restore-proof.

Once the hooks were in place, the virus ran the host code.
The main virus code would be called on every request to
load or save a file.

The ILOAD hook was reached when a disk needed to be
searched. This happened whenever a directory listing was
requested, and could happen when a search was made using
a filename with wildcards, or the first time that a file was
accessed. Otherwise, the drive hardware cached up to 2kb of
data and returned it directly.
The virus called the original ILOAD handler, then checked
whether an infected program had been loaded. If an infected
program had been loaded, the virus restored the host
program to its original memory location and restored the
program size to its original value. Otherwise, even if no file
had been loaded, the virus called the infection routine.

The ISAVE hook was reached whenever a file was saved.
The virus called the original ISAVE handler to save the file,
then called the infection routine.
The infection routine began by checking that the requested
device was a disk drive. If so, then the virus opened the first
file in the cache. The first file in the cache would be the
saved file if this code was reached via the ISAVE hook,
otherwise it would be the first file in the directory listing.
If the file was a Basic program, then the virus performed a
quick infection check by reading the first byte of the
program and comparing it against the SYS command.

If the SYS command was present, the virus
verified the infection by reading and comparing up to 27
subsequent bytes. A file was considered infected if all 27
bytes matched.
If the file was not infected, the virus switched to reading
data from the hardware cache. The first check was for a
standard disk layout: the directory had to exist on track 18,
sector 0, and the file to infect had not to have resided on
that track.

If these checks passed, the virus searched the track list for
free sectors. It began with the track containing the file to
infect, then moved outwards in alternating directions.
This reduced the amount of seeking that the drive had to
perform in order to read the file afterwards.

If at least eight free sectors existed on the same track, then
the virus allocated eight sectors for itself and updated the
sector bitmap for that track.
 
The virus wrote itself to disk in the
following manner: the first sector of the host was copied to
the last sector allocated by the virus, then that first sector
was replaced by the first sector of the virus. After that, the
remaining virus code was written to the remaining allocated
sectors.

The directory stealth was present here, and it existed
without any effort on the part of the virus writer(s). It was a
side-effect of the virus not updating the block count in the
directory sector. The block count was not used by DOS to
load files, its purpose was informational only, since it was
displayed by the directory listing.

After any call to ILOAD or ISAVE, the virus checked
whether the payload should activate. The conditions for
the payload activation were the following: that the machine
was operating in ?direct? mode (the command-prompt),
that the seconds field of the jiffy clock was a value from
2?4 seconds, and that the current scan line of the vertical
retrace was at least 128. This made the activation fairly
random. The payload was to display a particular text, one
character at a time, while cycling the colours of the border
The serial number that was displayed was the number of
times the payload check was called. It was incremented
once after each call, and it was carried in replications. It
reset to zero only after 65,536 calls.
