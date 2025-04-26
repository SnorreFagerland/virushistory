
;                ÚÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ unused
;                ³³ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ reserved
;                 
; BX=readable    00x? xxxx xxxx xxxx B
; CX=writeable   00x? xxxx xxxx xxxx B
; DX=cacheable   00x? xxxx xxxx xxxx B
; SI=reserved    00x? xxxx xxxx xxxx B
;                      
;                  ³  ³³³³ ³³³³ ³³³ÀÄÄ EC00, 16K
;                  ³  ³³³³ ³³³³ ³³ÀÄÄÄ E800, 16K
;                  ³  ³³³³ ³³³³ ³ÀÄÄÄÄ E400, 16K
;                  ³  ³³³³ ³³³³ ÀÄÄÄÄÄ E000, 16K
;                  ³  ³³³³ ³³³³
;                  ³  ³³³³ ³³³ÀÄÄÄÄÄÄÄ DC00, 16K
;                  ³  ³³³³ ³³ÀÄÄÄÄÄÄÄÄ D800, 16K
;                  ³  ³³³³ ³ÀÄÄÄÄÄÄÄÄÄ D400, 16K
;                  ³  ³³³³ ÀÄÄÄÄÄÄÄÄÄÄ D000, 16K
;                  ³  ³³³³
;                  ³  ³³³ÀÄÄÄÄÄÄÄÄÄÄÄÄ CC00, 16K
;                  ³  ³³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄ C800, 16K
;                  ³  ³ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄ C400, 16K
;                  ³  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ C000, 16K
;                  ³
;                  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ F000, 64k


sh_R            equ     bx
sh_W            equ     cx
sh_C            equ     dx
sh_X            equ     si

seg_all         equ     0010111111111111b

seg_F000_64k    equ     0010000000000000b

seg_C000_64k    equ     0000111100000000b
seg_C000_32k    equ     0000110000000000b
seg_C800_32k    equ     0000001100000000b
seg_C000_16k    equ     0000100000000000b
seg_C400_16k    equ     0000010000000000b
seg_C800_16k    equ     0000001000000000b
seg_CC00_16k    equ     0000000100000000b

seg_D000_64k    equ     0000000011110000b
seg_D000_32k    equ     0000000011000000b
seg_D800_32k    equ     0000000000110000b
seg_D000_16k    equ     0000000010000000b
seg_D400_16k    equ     0000000001000000b
seg_D800_16k    equ     0000000000100000b
seg_DC00_16k    equ     0000000000010000b

seg_E000_64k    equ     0000000000001111b
seg_E000_32k    equ     0000000000001100b
seg_E800_32k    equ     0000000000000011b
seg_E000_16k    equ     0000000000001000b
seg_E400_16k    equ     0000000000000100b
seg_E800_16k    equ     0000000000000010b
seg_EC00_16k    equ     0000000000000001b


read_cf8:
cf8_read:       mov     ax, 8000h
                shl     eax, 10h
                mov     ax, cx
                and     al, not 3
                mov     dx, 0CF8h
                out     dx, eax
                add     dl, 4
                mov     al, cl
                and     al, 3
                add     dl, al
                in      al, dx
                ret

write_cf8:
cf8_write:      xchg    ax, cx
                shl     ecx, 10h
                xchg    ax, cx
                mov     ax, 8000h
                shl     eax, 10h
                mov     ax, cx
                and     al, not 3
                mov     dx, 0CF8h
                out     dx, eax
                add     dl, 4
                mov     al, cl
                and     al, 3
                add     dl, al
                shr     ecx, 10h
                mov     ax, cx
                out     dx, al
                ret

get_sh_state:   mov     di, 0059h

@@1:            push    cx dx
                mov     cx, di
                call    cf8_read
                pop     dx cx

                mov     ah, 2

@@2:            shl     al, 1
                rcl     si, 1

                shl     al, 1
                rcl     dx, 1

                shl     al, 1
                rcl     cx, 1

                shl     al, 1
                rcl     bx, 1

                dec     ah
                jnz     @@2

                inc     di
                cmp     di, 005fh
                jbe     @@1

                ret

set_sh_state:   mov     di, 005Fh

@@1:            mov     ah, 2

@@2:            shr     bx, 1
                rcr     al, 1

                shr     cx, 1
                rcr     al, 1

                shr     dx, 1
                rcr     al, 1

                shr     si, 1
                rcr     al, 1

                dec     ah
                jnz     @@2

                push    cx dx
                mov     cx, di
                call    cf8_write
                pop     dx cx

                dec     di
                cmp     di, 0059h
                jae     @@1

                ret
