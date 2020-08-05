global _start
section .data
    address dw 2
            db 05h, 39h ;
            db 7fh, 00h, 00h, 01h;
	    db 00h, 00h, 00h, 00h;
	    db 00h, 00h, 00h, 00h;
    addlen  db 16h, 00h, 00h, 00h;

section .text

_start:
    push rbp
    mov rbp, rsp

    mov rax, 41
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    syscall ;socket호출

    push rax

    mov rax, 42
    mov rdi, [rbp-8]
    mov rsi, address
    mov rdx, 16
    syscall

    sub rsp, 0x100

    mov rax, 0
    mov rdi, [rbp-8]
    mov rsi, rsp
    mov rdx, 0xff
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 0x10
    syscall

    mov rax, 60
    mov rdi, 1
    syscall ;exit으로 뒤짐
