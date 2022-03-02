global f_ch_asm
global f_uch_asm
global f_int_asm
global f_uint_asm

extern num_ch, den_ch, res_ch;
extern num_uch, den_uch, res_uch;
extern num_shrt, den_shrt, res_shrt;
extern num_ushrt, den_ushrt, res_ushrt;

f_ch_asm:
    push rbp
    mov rbp, rsp

    mov rax, 2
    imul rax, rdx
    mov rbx, 96
    idiv rbx, rdi
    sub rax, rbx
    mov [num_ch], rax

    mov rax, 34
    idiv rax, rsi
    mov rbx, 1
    sub rbx, rdi
    add rax, rbx
    mov [den_ch], rax

    mov [res_ch], [num_ch]
    idiv [res_ch], [den_ch]

    mov rsp,rbp
    pop rbp
    ret

f_uch_asm:
    push rbp
    mov rbp, rsp

    mov rsp,rbp
    pop rbp
    ret

f_int_asm:
    push rbp
    mov rbp, rsp

    mov rsp,rbp
    pop rbp
    ret

f_uint_asm:
    push rbp
    mov rbp, rsp

    mov rsp,rbp
    pop rbp
    ret
