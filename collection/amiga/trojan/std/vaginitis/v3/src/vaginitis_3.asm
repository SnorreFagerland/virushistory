	movem.l	D0-D7/A0-A6,-(SP)
	movea.l	(4).W,A6
	bsr.w	lbC0000C8
lbL00000C	dc.l	$A1CA9F60
	dc.l	$2D18FB8E
	dc.l	$A3CB9F63
	dc.l	$2CBCFBCE
	dc.l	$B6ACF3CB
	dc.l	$B0CAA5AD
	dc.l	$A1CEF5D1
	dc.l	$A7CA9F63
	dc.l	$2C9AF9CE
	dc.l	$A3CB9F63
	dc.l	$2CA29B8A
	dc.l	$B688B0C8
	dc.l	$9F879DF4
	dc.l	$D1CEF3D1
	dc.l	$F5F2D1CE
	dc.l	$D2209F63
	dc.l	$2E2CFBCE
	dc.l	$B6E0B0D2
	dc.l	$839B9FEE
	dc.l	$EF809882
	dc.l	$EBEEBFAB
	dc.l	$A6BDB9AB
	dc.l	$BDA2F1BA
	dc.l	$B2BEEBFC
	dc.l	$E2FDE2CE
	dc.l	$F3D1A5CE
	dc.l	$F7CB9F63
	dc.l	$2EEC128B
	dc.l	$9F632E12
	dc.l	$1A879F60
	dc.l	$2FACB1F6
lbL000088	dc.l	$829A95EE
	dc.l	$A1BCB4BD
	dc.l	$B4A0A5BD
	dc.l	$F198B0A9
	dc.l	$B8A0B8BA
	dc.l	$B8BDF1ED
	dc.l	$E2EEFCE3
	dc.l	$FCEEB5A7
	dc.l	$B5EEA8A1
	dc.l	$A4EEB7A7
	dc.l	$BFAAF1FF
	dc.l	$F1AFBFAA
	dc.l	$F1FCF1B7
	dc.l	$B4BAEECE
	dc.l	$61064CDF
	dc.l	$7FFF4E75

lbC0000C8	lea	(lbL00000C,PC),A0
	lea	(lbL000088,PC),A1
	move.w	#$D1CE,D0
lbC0000D4	eor.w	D0,(A0)+
	cmpa.l	A0,A1
	bne.b	lbC0000D4
	jsr	(-$27C,A6)
	rts
