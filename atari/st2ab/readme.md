**Author: Lord (A0)<br>
Date: June 2009<br>
Characteristics: non-resident, non-stealth, non-encrypted, infects floppies and C:\AUTO<br>
Assembler: Devpac 3.10**<br>

What it does:
A: drive boot:
infects B: if present. Also drops ~.prg in C:\AUTO folder. Anything in there gets automatically run.

AUTO boot:
infects both floppies if present.

BINARY folder: compiled virus in 3 forms
- hard disk (~.prg)
- victim1.st (floppy image)
- IN_FILE.PRG (virus dropper).

SOURCE folder:
- in_file.s
loaded in Devpac under Hatari. Allowed me to edit actual virus using Textpad (outside the emulator).
-----
- a2b_drop.s
virus dropper that INCLUDEs the actual virus. the strange labels make it clash proof with any labels in the actual virus
-----
- A2B.S
actual virus code INCLUDEd by the dropper
-----
- include files
modules needed

The very first new Atari ST virus. Developed and tested under Hatari (emulator). Ironically I got sick with H1N1 flu virus soon after completion LOL.
