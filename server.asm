global _start

section .data
    address dw 2
            db 05h, 39h ;
            db 7fh, 00h, 00h, 01h;
	    db 00h, 00h, 00h, 00h;
	    db 00h, 00h, 00h, 00h;
    addlen  db 16h, 00h, 00h, 00h;
    msg     db "Hello World!", 10h


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
    
    mov rax, 49
    mov rdi, [rbp-8]
    mov rsi, address
    mov rdx, 16
    syscall ;bind 호출

    mov rax, 50
    mov rdi, [rbp-8]
    mov rsi, 5
    syscall ;listen호출

    sub rsp, 0x50
    mov rax, 43
    mov rdi, [rbp-8]
    mov rsi, rsp
    mov rdx, addlen
    syscall ;accept 호출
    
    push rax
    mov rax, 1
    mov rdi, [rsp]
    mov rsi, msg
    mov rdx, 16
    syscall ;write로 쓰기

    mov rax, 60
    mov rdi, 1
    syscall ;exit으로 뒤짐