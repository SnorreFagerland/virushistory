; *******************************************************
; *							*
; *	NOVIRUS.MAC - Программа борьбы с вирусом	*
; *							*
; *	Использование:					*
; *							*
; *	NOVIRUS       Выдает информацию о заражении	*
; *		      диска и ОЗУ			*
; *	NOVIRUS -     Заодно уничтожает вирус		*
; *							*
; *******************************************************

	.Z80

Hook	equ	0F26Dh

Bdos	equ	5

STROUT	equ	09h	; Функции BDOS:	- вывод строки
DNAME	equ	19h	;		- выдача номера дисковода
SETDMA	equ	1Ah	;		- установка адреса обмена
DREAD	equ	2fh	;		- чтение сектора с диска
DWRITE	equ	30h	;		- запись сектора на диск

StEntry	equ	001Fh

Params	equ	82h	; Здесь находится строка параметров при
			; запуске программы.

	ld	a,(Hook)
	cp	0C9h
	jr	z,test2
	ld	de,mess1
	ld	c,STROUT
	call	Bdos
	ld	a,(Params)
	cp	'-'
	jr	nz,test2
	ld	a,0C9h
	ld	(0F26Dh),a
	call	kill
test2:	ld	de,_DMA
	ld	c,SETDMA	
	call	Bdos
	ld	c,DNAME
	call	Bdos
	ld	(StDrive),a
	ld	l,a		; N дисковода
	ld	de,0		; N Сектора
	ld	h,1		; Число секторов
	ld	c,DREAD		; Чтение сектора
	call	Bdos
	ld	a,(_DMA+StEntry)
	.8080
	cpi	(Push h)	; Диск заражен, если Push h в байте
	.Z80			; StEntry - только для нашего вируса !
	ret	nz
p1
p0
	ld	de,mess2
	ld	c,STROUT
	call	Bdos
	ld	a,(Params)
	cp	'-'
	ret	nz
	ld	hl,_DMA + 103h	; Доступ к месту в вирусе, где записаны
	ld	a,(hl)		; стандартные 6 байт. Производится так:
	.8080			; В байтах 3-6 вируса стоит команда
	cpi	(lxi d)		; ld de, Rettable-Vbeg, т.е. в байте 4
	.z80			; размещен относительный адрес начала
	ret	nz		; таблицы стандартных байтов. Только для
	inc	hl		; нашего вируса !
	ld	e,(hl)
	inc	hl
	ld	a,(hl)
	or	a
	ret	nz
	ld	d,a
	ld	hl,_DMA + 100h
	add	hl,de		; теперь hl = адрес таблицы
	ld	de,_DMA+StEntry
	ld	bc,6
	ldir
	ld	de,0		; N Сектора
	ld	hl,(StDrive)	; N дисковода
	ld	h,1		; Число секторов
	ld	c,DWRITE	; Запись сектора
	call	Bdos
kill:	ld	de,mess3
	ld	c,STROUT
	jp	Bdos

mess1:	db	'Внимание, вирус в памяти',0Dh,0Ah,'$'
mess2:	db	'Внимание, вирус на диске',0Dh,0Ah,'$'
mess3:	db	'Нейтрализован', 0Dh,0Ah,'$'

StDrive:ds	1

_DMA	equ	$

	end

