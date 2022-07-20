; ================================ ;
; # Константы для "Микроша ПЭВМ" # ;
; ================================ ;

; Адреса функций системного монитора

SYSMON_RESET        equ 0xF800  ; Возврат в системный монитор со сбросом
SYSMON_GETCHAR      equ 0xF803  ; Получить символ с клавиатуры
SYSMON_TAP_READ     equ 0xF806  ; Читать с магнитной ленты
SYSMON_TAP_WRITE    equ 0xF80C  ; Записать на магнитную ленту
SYSMON_PUTCHAR      equ 0xF809  ; Вывести символ на экран (KOI-7)
SYSMON_KEY_STATE    equ 0xF812  ; Опрос состояния клавиши
SYSMON_PUTHEX       equ 0xF815  ; Вывод числа в HEX формате на экран
SYSMON_PRINT        equ 0xF818  ; Вывод нуль-терминированной строки
SYSMON_NORESET      equ 0xF89D  ; Возврат в системный монитор без сброса
SYSMON_KEYCODE      equ 0xFEEA  ; Получить код нажатой клавиши

; Области OЗУ

STACK_START         equ 0x7600  ; Адрес начала стека
STACK_END           equ 0x76CF  ; Адрес конца стека

VIDEO_MEM_START     equ 0x76D0  ; Адрес начала видеопамяти
VIDEO_MEM_END       equ 0x7FFF  ; Адрес конца видеопамяти
