; ================================ ;
; # ����⠭�� ��� "����� ����" # ;
; ================================ ;

; ���� �㭪権 ��⥬���� ������

SYSMON_RESET        equ 0xF800  ; ������ � ��⥬�� ������ � ��ᮬ
SYSMON_GETCHAR      equ 0xF803  ; ������� ᨬ��� � ����������
SYSMON_TAP_READ     equ 0xF806  ; ����� � �����⭮� �����
SYSMON_TAP_WRITE    equ 0xF80C  ; ������� �� �������� �����
SYSMON_PUTCHAR      equ 0xF809  ; �뢥�� ᨬ��� �� ��࠭ (KOI-7)
SYSMON_KEY_STATE    equ 0xF812  ; ���� ���ﭨ� ������
SYSMON_PUTHEX       equ 0xF815  ; �뢮� �᫠ � HEX �ଠ� �� ��࠭
SYSMON_PRINT        equ 0xF818  ; �뢮� ���-�ନ��஢����� ��ப�
SYSMON_NORESET      equ 0xF89D  ; ������ � ��⥬�� ������ ��� ���
SYSMON_KEYCODE      equ 0xFEEA  ; ������� ��� ����⮩ ������

; ������ O��

STACK_START         equ 0x7600  ; ���� ��砫� �⥪�
STACK_END           equ 0x76CF  ; ���� ���� �⥪�

VIDEO_MEM_START     equ 0x76D0  ; ���� ��砫� ����������
VIDEO_MEM_END       equ 0x7FFF  ; ���� ���� ����������