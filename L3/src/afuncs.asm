section .data

extern a_shrt, b_shrt
extern a_ushrt, b_ushrt

global f_shrt_asm, f_ushrt_asm

; sh/ush + gr/eq/le/fin
section .text
f_shrt_asm:
    mov bx, [a_shrt]
    cmp bx, [b_shrt]
    jg shg
    je she

    ; a < b
    mov ax, [b_shrt]
    mov bx, [b_shrt]
    imul bx ; b * b
    mov bx, 8
    cwd
    idiv bx ; b * b / 8
    jmp shf

    shg: ; a > b
    mov ax, [a_shrt]
    add ax, [b_shrt] ; b + a
    mov bx, [a_shrt]
    dec bx ; a - 1
    cwd
    idiv bx ; (b + a) / (a - 1)
    jmp shf

    she: ; a = b
    mov ax, 23

    shf:
    ret

f_ushrt_asm:
    xor eax, eax
    xor ebx, ebx
    mov ax, [a_ushrt]
    mov bx, [b_ushrt]
    cmp eax, ebx
    jg ushg
    je ushe

    ; a < b
    mov ax, [b_ushrt]
    mul bx ; b * b
    mov bx, 8
    xor dx, dx
    div bx ; b * b / 8
    jmp ushf

    ushg: ; a > b
    add eax, ebx ; b + a
    mov bx, [a_ushrt]
    dec bx ; a - 1
    xor dx, dx
    div bx ; (b + a) / (a - 1)
    jmp ushf

    ushe: ; a = b
    mov ax, 23

    ushf:
    ret
