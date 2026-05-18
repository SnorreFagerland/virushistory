*********************************************************************
;  a0 source
;  a1 target

		movem.l	d2-d7/a2-a6,-(sp)
		move.l	(a0)+,d0
		bsr	decompress
		movem.l	(sp)+,d2-d7/a2-a6
		rts

;;;
;;;				Remarks
;;;				=======
;;;
;;;   * This code relies on XPK_MARGIN being >= 32 !!!
;;;     If only one Bit in the last ControlWord is used, the remaining 15
;;;     will be filled with 0.  This will result in 15 LiteralItems on
;;;     decompression.  In Addition to this there is NO CHECK, if a match
;;;     matches more than the input.  This can result in a match which is
;;;     17 Bytes to long giving a maximum total of 32 Bytes garbled after
;;;     the outputblock after decompresion.
;;;       (XPK_MARGIN is 256 in xpkmaster.library V2.0)
;;;

;                                ;Register Map
;                                ;============
;  a0    Points to next source      byte.
;  a1    Points to next destination byte.
;  a2    Temporary.
;  a3    Unused.
;  a4    Pointer for the input word stream.
;  a5    Unused.
;  a6    Stackframe linkage register. Don't touch!
;  a7    Stack pointer.

;  d0    Length of the compressed.
;  d1    control Word
;  d2    Counter for halfunrolled decompress_16_items_loop.
;  d3    Temporary used to calculate copy item length.
;  d4    Temporary used to calculate copy item offset.
;  d5    Unused.
;  d6    Unused.
;  d7    Unused.

;;;---------------------------------------------------------------------------

decompress:

	move.l	d0,a4
	add.l	a0,a4		;a4:=behind the end of input block

	moveq.l	#0,d4		;d4:=0

;;;---------------------------------------------------------------------------

DOCOPY MACRO
	move.w	-(a4),d4	;Grab the copy item description
	moveq	#$0F,d3
	and.b	d4,d3		;extract length.
	add.b	d3,d3		;adjust length to length*2
	lsr.w	#4,d4		;extract offset

	move.l	a1,a2		;Subtract the offset yielding the
	suba.l	d4,a2		;address from which we copy.
	jmp	MOVE\@(PC,d3.w)	;jump to the right place
MOVE\@	move.b	(a2)+,(a1)+	;0
	move.b	(a2)+,(a1)+	;1
	move.b	(a2)+,(a1)+	;2
	move.b	(a2)+,(a1)+	;3
	move.b	(a2)+,(a1)+	;4
	move.b	(a2)+,(a1)+	;5
	move.b	(a2)+,(a1)+	;6
	move.b	(a2)+,(a1)+	;7
	move.b	(a2)+,(a1)+	;8
	move.b	(a2)+,(a1)+	;9
	move.b	(a2)+,(a1)+	;10
	move.b	(a2)+,(a1)+	;11
	move.b	(a2)+,(a1)+	;12
	move.b	(a2)+,(a1)+	;13
	move.b	(a2)+,(a1)+	;14
	move.b	(a2)+,(a1)+	;15
	move.b	(a2)+,(a1)+
	move.b	(a2)+,(a1)+
    ENDM

DOLITERAL MACRO
	move.b	(a0)+,(a1)+	;Literal item means copy a byte.
    ENDM

    ;This loop processes one 16-item item group per iteration.
    ;This loop terminates when we definitely have decompressed all
    ;16-item blocks.  It may overwrite 15+17 innocent bytes AFTER the
    ;end of outbuf.

oloop:	move.w	-(a4),d1
	moveq	#7,d2
iloop:
	add.w	d1,d1
	bcs.s	Copy0
Lit0:	DOLITERAL
	add.w	d1,d1
	bcs.s	Copy1
Lit1:	DOLITERAL
	dbra	d2,iloop
	cmp.l	a4,a0
	bcs.s	oloop
	bra.s	finish

Copy0:	DOCOPY
	add.w	d1,d1
	bcc.s	Lit1
Copy1:	DOCOPY
	dbra	d2,iloop
	cmp.l	a4,a0
	bcs	oloop
	
finish:
	rts

