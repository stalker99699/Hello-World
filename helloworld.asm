section .data
    hello db 'Hello, World!', 0xA  ; Строка с символом перевода строки
    helloLen equ $-hello          ; Вычисление длины строки

section .text
    global _start

_start:
    ; Системный вызов sys_write (вывод на экран)
    mov rax, 1                  ; Номер системного вызова sys_write
    mov rdi, 1                  ; Дескриптор файла (1 - stdout)
    mov rsi, hello              ; Указатель на строку
    mov rdx, helloLen           ; Длина строки
    syscall                     ; Вызов ядра

    ; Системный вызов sys_exit (завершение)
    mov rax, 60                 ; Номер системного вызова sys_exit
    xor rdi, rdi                ; Код завершения 0
    syscall                     ; Вызов ядра
