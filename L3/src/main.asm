; extern f_shrt, f_ushrt
global main
extern puts

section .data
n dw 0

intro db "Zadacha №11, Krylov Artem Vyacheslavovich, IKPI-14", 10,\
         "(b + a) / (a - 1), if a > b", 10,\
         "23, if a = b", 10,\
         "b * b / 8, if a < b", 10, 0

menu db "Viberite tip dannih:", 10,\
        "    1) Signed short", 10,\
        "    2) Unsigned short", 10,\
        "Dlya zaversheniya raboti vvetide 0", 0

section .text
main:
    push rbp
    mov rbp, rsp

    mov edi, intro
    call puts

    xor eax, eax

    mov rsp, rbp
    pop rbp
    ret
