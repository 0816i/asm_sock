global _start

section .data
    address dw 2
            db 05h, 39h ;
            db 7bh, 00h, 00h, 01h;
    addlen  db 16
    msb     db "            RESULT: "

