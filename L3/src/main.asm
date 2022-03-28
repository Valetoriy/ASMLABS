global main
extern puts, scanf
extern f_shrt, f_ushrt

section .data
    intro db "Zadacha №11, Krylov Artem Vyacheslavovich, IKPI-14", 10,\
             "(b + a) / (a - 1), if a > b", 10,\
             "23, if a = b", 10,\
             "b * b / 8, if a < b", 10, 0

    menu db "Viberite tip dannih:", 10,\
            "    1) Signed short", 10,\
            "    2) Unsigned short", 10,\
            "Dlya zaversheniya raboti vvetide 0", 0

    format1 db "%d", 0
    format2 db "", 0

section .bss
    n dd 0

section .text
mainarr:
    dq f_shrt
    dq f_ushrt

main:
    push rbp
    mov rbp, rsp

    mov edi, intro
    call puts

    mainloop:
    mov edi, menu
    call puts
    
    mov edi, format1
    mov esi, n
    call scanf

    mov eax, [n]
    cmp eax, 0
    je fin
    dec eax
    call [mainarr + 8 * eax]

    mov edi, format2
    call puts

    jmp mainloop

    fin:
    xor eax, eax
    mov rsp, rbp
    pop rbp
    ret
