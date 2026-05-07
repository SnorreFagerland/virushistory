*********************************************************************
;  a0 source
;  a1 target
;  d0 source size
; d0 success

		movem.l	d2-d7/a2-a6,-(sp)
		move.l	a0,a2
		move.l	a1,a3
		move.l	d0,d2
		move.l	#$10000,d0
		move.l	#0,d1
		move.l	$4.w,a6
		CALLLIB _LVOAllocVec
		tst.l	d0
		beq	.exit
		move.l	d0,-(sp)
		move.l	a2,a0			; source
		lea	4(a3),a1		; target
		move.l	d0,a2			; hash
		move.l	d2,d0			; source size
		moveq.l #90,d1
		move.l	a3,-(sp)
		jsr	compress_fast
		move.l	(sp)+,a3
		move.l	d0,(a3)
		move.l	d0,d2
		move.l	(sp)+,a1
		move.l	$4.w,a6
		CALLLIB	_LVOFreeVec
		move.l	d2,d0
.exit:		movem.l	(sp)+,d2-d7/a2-a6
		rts

;;;				Remarks
;;;				=======
;;;
;;;   * This code relies on XPK_MARGIN being >= 32 !!!
;;;     If only one Bit in the last ControlWord is used, the remaining 15
;;;     will be filled with 0.  This will result in 15 LiteralItems on
;;;     decompression.  Additionaly there is NO CHECK, whether a match
;;;     matches more than the input.  This can result in a match which is
;;;     17 Bytes to long giving a maximum total of 32 Bytes garbled after
;;;     the outputblock after decompresion.
;;;       (XPK_MARGIN is 256 in xpkmaster.library V2.0)

;	XDEF	compress_fast

;On entry:
;	a0 = InBuf
;	a1 = OutBuf
;	a2 = HashTab
;	d0 = InLen

;We only test if we have compressed all the input after we already have
;compressed all the data belonging to a group.  A group is the data encoded
;using one controlword.  Therefor it could happen, that we compress 16*18
;bytes to much, garbling inocent memory on decompression and compressing 
;too much data.  To prevent this (doing too much work is always a bad thing(tm))
;we compress the data with two different abortion strategies:
;1st we only test for completion after compressing all the data belonging
;to one group.  This test fails, if there are fewer than a safetymargin bytes
;to compress.  We then switch to the second safer but slower method
;of testing after each controlbit.

SAFETYMARGIN = 16*18

compress_fast:
	move.l	a1,-(sp)	;push OutBuf for total length calculation
	move.l	d0,d5		;d5:=InLen

				;Fill the Hash with pointers to the end
				;of the input.  So we never ever get a
				;valid Hashentry by chance, but only
				;if we stored it there.

	move.l	a1,d7
	add.l	d0,d7		;d7:=OutBuf+InLen
	and.b	#$fc,d7		;align d7 to long (for wordstreammove at end)
	move.l	d7,a4		;a4:=OutBuf+InLen
	add.l	a0,d5		;d5:=InBuf+InLen

	move.l	a2,a6		;a6:=Hash
	move.w	#2048-1,d0	;Hashsize=2^(11+3+2) = 2^16 Bytes
fillHashLoop:
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	move.l	d5,(a6)+
	dbra	d0,fillHashLoop

	sub.l	#SAFETYMARGIN,d5 ;d5:=InBuf+InLen-SAFETYMARGIN

	lea	NewControlWord(pc),a3
	move.l	#4095,d4	;d4:=Const:4095
	moveq.l	#0,d1		;upper word has to be 0

	bra.s	StartMainLoop

				;REGISTER MAP
				;============

;	a0 Points to the next input  byte.
;	a1 Points to the next literal output byte.
;	a2 Points to the hash table.
;	a3 Pointer to NewControlWord/SafeControl code.
;	a4 Points to the word output stream.
;	a5 Points to place to put control word in output.
;	a6 Temporary.
;	a7 Stack pointer. Don't touch!

;	d0 Temporary
;	d1 Temporary
;	d2 Counter of Controlbits to insert into the control word.
;	d3 Buffers the current control word.
;	d4 Constant 4095 for rangecheck.
;	d5 Points to the byte after the input block.
;	d6 Second level controlbit counter used in the safe loop.
;	d7 Points to the byte after the output block.

;;;---------------------------------------------------------------------------

COPYN	MACRO
	IFGE	\1-10
	addq.w	#18-\1,d0
	ENDC
	IFLT	\1-10
	add.w	#18-\1,d0
	ENDC
	dbra	d2,MatchFinish	;End of loop.
	jmp	MatchExitOfs(a3); control word is full.
    ENDM

;=====================================================================

				;SAFE COMPRESSION LOOP
				;=====================
;This loopcontrol part fools the main compression part into thinking
;The control word is allways full.  The main part thus calls us each
;time it has filled a bit into the control word.  This enables us to
;check for completion and overrun after each compressed item.

;There's no need to check for overruns!
;An overrun occurs if the TOTAL size of the literal bytes and
;the control words and the copyinfo TOGETHER do exceed the size
;of the input.  Even in the worst case the literal byte stream or
;the control words and the copyinfo together do not exceed
;the size of the outbuf.  Therefore the overruncheck can safely be
;postponed to the end.
				
EnterSafeLoop:
	lea	SafeControl(pc),a3	;redirect jumps to NewControlWord.
	add.l	#SAFETYMARGIN,d5	;d5:=InBuf+InLen
	bra.s	StartSafeMainLoop	

;===============================

	subq.l	#1,a0		; = These two instructions have to be identical
	move.w	d0,-(a4)	; = to the two before NewControlWord!!!
SafeControl:			;Jump here every iteration to test for end.

	cmp.l	a0,d5			;Input bytes left=d5-a0
	bls	end_compress_loop	;Loop ends if no more input bytes.

	dbra	d6,NextRound	;control word isn't full, do next.

	move.w	d3,(a5)		;Write control word.
StartSafeMainLoop:
	subq.l	#2,a4
	move.l	a4,a5		;Next output word is control word.

	moveq	#15,d6		;Reinitialize control bits counter
	moveq	#-1,d3		;Fill new control word with $ffff
NextRound:
	moveq	#0,d2		;Clear control bit counter to fool
				;the others into thinking it is full
				;so we get called 
	bra.s	CompressLoop

;===================================================================

				;FAST COMPRESSION LOOP
				;=====================

MatchExit:			;undo the effect on a0 of the last
	subq.l	#1,a0		;failing cmp.b (a6)+,(a0)+
MatchExit_18:			
	move.w	d0,-(a4)	;Write the CopyItemInformation

NewControlWord:    ;Jump here every 16 iterations to set up a new control word.

MatchExitOfs	= MatchExit-NewControlWord
MatchExit18Ofs	= MatchExit_18-NewControlWord

	move.w	d3,(a5)		;Write control word.
StartMainLoop:
	cmp.l	a0,d5		;reached the saftymargin ?
	bls.s	EnterSafeLoop	;Fast Loop ends if to few input bytes.
	subq.l	#2,a4
	move.l	a4,a5		;Next output word is control word.
	moveq	#15,d2		;Reinitialize control bits counter
	moveq	#-1,d3		;Fill new control word with $ffff
	bra.s	CompressLoop

;=====================================================================
;placed here to be within bra.s range, could be anywhere

do_literal_1:
	move.b	-1(a0),(a1)+	;Copy the literal byte to the output.
	add.w	d3,d3		;Inject a 0 (literal) into control buffer.
	dbra	d2,CompressLoop	;End of loop.
	jmp	(a3)		; control word is full.

do_literal_2:
	subq.l	#2,a0
	move.b	(a0)+,(a1)+	;Copy the literal byte to the output.
	add.w	d3,d3		;Inject a 0 (literal) into control buffer.
	dbra	d2,CompressLoop	;End of loop.
	jmp	(a3)		; control word is full.

do_literal_3:
	subq.l	#3,a0
do_literal:
	move.b	(a0)+,(a1)+	;Copy the literal byte to the output.
	add.w	d3,d3		;Inject a 0 (literal) into control buffer.
	dbra	d2,CompressLoop	;End of loop.
	jmp	(a3)		; control word is full.

do_copy_3:  COPYN 3
do_copy_4:  COPYN 4
do_copy_5:  COPYN 5
;=====================================================================

MatchFinish:
	subq.l	#1,a0		;Undo effect of last cmp.b (a6)+,(a0)+
MatchFinish_18:
	move.w	d0,-(a4)	;Write the CopyItemInformation
;-----------------------------------------
;CALCULATE HASH TABLE ENTRY FOR KEY IN ZIV
;-----------------------------------------
CompressLoop:
	move.l	a0,a6		;d1:=hashtable entry for
	move.b	(a6)+,d1	;(a0), 1(a0) and 2(a0)
	lsl.w	#3,d1
	add.b	(a6)+,d1
	lsl.w	#3,d1
	add.b	(a6),d1
	lsl.w	#2,d1

	move.l	0(a2,d1.l),a6	;Place the hash table entry into a6.
	move.l	a0,d0		;Calculate the entry's offset from src pos.
	sub.l	a6,d0		;d0 := a0-entry
	move.l	a0,0(a2,d1.l)	;Replace hash entry by current source address
	cmp.l	d4,d0		;Is the Hashentry more than 4095 Bytes away?
	bhi.s	do_literal

COMPARE_BYTE	MACRO
	cmp.b	(a6)+,(a0)+
	bne.s	\1
    ENDM

	COMPARE_BYTE	do_literal_1	;Look if there is a match of at least
	COMPARE_BYTE	do_literal_2	;length 3.
	COMPARE_BYTE	do_literal_3

	asl.w	#4,d0		;Shift Offset to make room for lengthinfo
	rol.w	#1,d3		;Inject a 1 (copy) into control buffer.
				;since we definitely are doing a copy.

	COMPARE_BYTE	do_copy_3	;determine the length of the match
	COMPARE_BYTE	do_copy_4
	COMPARE_BYTE	do_copy_5
	COMPARE_BYTE	do_copy_6
	COMPARE_BYTE	do_copy_7
	COMPARE_BYTE	do_copy_8
	COMPARE_BYTE	do_copy_9
	COMPARE_BYTE	do_copy_10
	COMPARE_BYTE	do_copy_11
	COMPARE_BYTE	do_copy_12
	COMPARE_BYTE	do_copy_13
	COMPARE_BYTE	do_copy_14
	COMPARE_BYTE	do_copy_15
	COMPARE_BYTE	do_copy_16
	COMPARE_BYTE	do_copy_17

do_copy_18:				;Match length is 18 Bytes.
	dbra	d2,MatchFinish_18	;End of loop.
	jmp	MatchExit18Ofs(a3)	;control word is full.

do_copy_6:  COPYN 6
do_copy_7:  COPYN 7
do_copy_8:  COPYN 8
do_copy_9:  COPYN 9
do_copy_10: COPYN 10
do_copy_11: COPYN 11
do_copy_12: COPYN 12
do_copy_13: COPYN 13
do_copy_14: COPYN 14
do_copy_15: COPYN 15
do_copy_16: COPYN 16
do_copy_17: COPYN 17

;;;The main loop ends here.
;;;---------------------------------------------------------------------------
				;FINALIZATION
				;============

FillControl:			;Fill the rest of the control word with 0
	add.w	d3,d3		;0 means literal items.
end_compress_loop:
	dbra	d6,FillControl

	move.w	d3,(a5)		;Write it to its output position

	;Copy the literals after the word stream pointed to by a1.
	move.l	a4,d0		;d0:=Number of Bytes to increase a1
	sub.l	a1,d0		;till a1 and a4 are equally aligned.
	bcs.s	overrun		;byte- and wordstream together exceede the
				;size of the output buffer.
	moveq	#3,d1
	and.w	d0,d1

	moveq.l	#0,d0		;pad a1 up to make a1 and a4 equally aligned.
	bra.s	EFLoop
FLoop:	move.b	d0,(a1)+
EFLoop:	dbra	d1,FLoop

	sub.l	a4,d7		;d7:=size of wordstream

	lsr.l	#2,d7
	bcc.s	ECLoop		;make sure we do the move.l longword aligned.
	move.w	(a4)+,(a1)+
NoWord:
	bra.s	ECLoop
CLoopH:	swap	d7
CLoop:	move.l	(a4)+,(a1)+
ECLoop:	dbra	d7,CLoop
	swap	d7
	dbra	d7,CLoopH

	move.l	(sp)+,a0		;Pop OutBuf
	move.l	a1,d0
	sub.l	a0,d0			;d0:=Final output length
endcompress:
	rts

				;OVERRUN PROCESSING
				;==================
	;This is the place to jump when an overrun occurs.
	;When an overrun occurs we can drop everything we are doing
overrun:
	moveq.l	#0,d0
	addq.l	#4,sp		;pop OutBuf.
	bra.s	endcompress
;;;---------------------------------------------------------------------------
