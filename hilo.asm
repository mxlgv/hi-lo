        org 0

.include "microsha.inc"

; Точка входа
start:
        lxi     h, help_str
        call    SYSMON_PRINT
        mvi     d, '9'
        call    put_promt
        
_rnd_counter:
        call    SYSMON_KEYCODE  ; Получаем код нажатой клавиши
        dcr     a               ; Используется для рандома
        cpi     0xFF
        jz      _rnd_counter    ; Пока ни одна клавиша не нажата увеличиваем B
        ori     1
        
        call    rand8
        mvi     b, 100
        call    mod
        
        mov     e, a
        jmp     _first

game_loop:
        call    put_promt
_first:
        mvi     a, '0'
        cmp     d
        lxi     h, loss_str
        jz      _print
        
        call    input
        
        cmp     e
        jz      _win
        jm      _lo

_hi:
        lxi     h, hi_str
        jmp     _print
_lo:
        lxi     h, lo_str
        jmp     _print
_win:
        lxi     h, win_str
_print:
        push    psw
        call    SYSMON_PRINT
        dcr     d
        pop     psw
        jnz     game_loop
        jmp     SYSMON_NORESET

put_promt:
        mov     c, d
        call    SYSMON_PUTCHAR
        mvi     c, '>'
        call    SYSMON_PUTCHAR
        ret


input:
        call    nbr_input
        mov     b, a
        REPT    9               ; Повторяем сложение 9 раз
        add     b
        ENDM        
        mov     b, a
        call    nbr_input
        add     b
        ret

nbr_input:
        call    SYSMON_GETCHAR
        call    isdigit
        jnz     nbr_input
        mov     c, a
        call    SYSMON_PUTCHAR
        sbi     '0'
        ret

; isdigit - если символ не пренадлежит промежутку '0'-'9' - возращает false
; IN:    A - код символа
; OUT:   ZF=1 - true
;        ZF=0 - false
isdigit:
        cpi     '0'
        rm
        cpi     '9'+1
        rp
        cmp     a ;set ZF=1
        ret


; Выход:  A - псевдослучайное число
; Портит: B
rand8:
        mov     b, a

        rrc
        rrc
        rrc
        xri     0x1F

        add     b
        sbi     0xFF
        ret

; IN:  A - делимое
;      B - делитель
; OUT: A - остаток
mod:
        cmp     b
        rm
        sbb     b
        jmp     mod

help_str: db 0x1F, 'HI-LO 0-99', 0x0A, 0x0D, 0
hi_str:   db ' HI', 0x0A, 0x0D, 0
lo_str:   db ' LO', 0x0A, 0x0D, 0
win_str:  db ' WIN!', 0x0A, 0x0D, 0 
loss_str: db ' LOSS', 0x0A, 0x0D, 0

#assert  $ <= 200
