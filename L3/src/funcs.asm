global f_shrt, f_ushrt
global a_shrt, b_shrt
global a_ushrt, b_ushrt

extern puts, scanf, printf
extern f_shrt_asm, f_ushrt_asm

section .data
   sh_range db "Vvedite zhacheniya a, b: [-32,768; 32,767]", 0
   ush_range db "Vvedite zhacheniya a, b: [0; 65,535]", 0

   sh_form1 db "%hi%hi", 0
   ush_form1 db "%hu%hu", 0

   sh_form2 db "ASM: %hi", 10, 0
   ush_form2 db "ASM: %hu", 10, 0

   err1 db "Ne podhodyasheye zhacneniye b", 0
   err2 db "Ne podhodyashiye zhacneniya a i b", 0

section .bss
a_shrt:
    dw 0
b_shrt:
    dw 0
a_ushrt:
    dw 0
b_ushrt:
    dw 0

section .text
f_shrt:
    push rbp
    mov rbp, rsp

    mov edi, sh_range
    call puts ; puts("Vvedite zhacheniya a, b: [-32,768; 32,767]");

    mov edi, sh_form1
    mov esi, a_shrt
    mov edx, b_shrt
    call scanf ; scanf("%hi%hi", &a_shrt, &b_shrt);

    mov ax, [a_shrt]
    mov bx, [b_shrt]
    cmp ax, bx
    jl sh_branch1 ; if (a_shrt < b_shrt)
    cmp ax, bx
    jg sh_branch2 ; else if (a_shrt > b_shrt)

    sh_res:
    call f_shrt_asm

    mov edi, sh_form2
    mov esi, eax
    call printf ; printf("ASM: %hi\n", f_shrt_asm());

    sh_fin:
    mov rsp, rbp
    pop rbp
    ret

    sh_branch1:
    cmp bx, -181
    jl error1
    cmp bx, 181
    jg error1
    jmp sh_res

    sh_branch2:
    add ax, bx
    jno sh_res
    jmp error2

f_ushrt:
    push rbp
    mov rbp, rsp

    mov edi, ush_range
    call puts ; puts("Vvedite zhacheniya a, b: [0; 65,535]");

    mov edi, ush_form1
    mov esi, a_ushrt
    mov edx, b_ushrt
    call scanf ; scanf("%hu%hu", &a_ushrt, &b_ushrt);

    xor eax, eax
    xor ebx, ebx
    mov ax, [a_ushrt]
    mov bx, [b_ushrt]
    cmp eax, ebx
    jl ush_branch1 ; if (a_ushrt < b_ushrt)
    cmp eax, ebx
    jg ush_branch2 ; else if (a_ushrt > b_ushrt)

    ush_res:
    call f_ushrt_asm

    mov edi, ush_form2
    mov esi, eax
    call printf ; printf("ASM: %hu\n", f_ushrt_asm());

    mov rsp, rbp
    pop rbp
    ret

    ush_branch1:
    cmp bx, 254
    jg error1
    jmp ush_res

    ush_branch2:
    add eax, ebx
    cmp eax, 65535
    jg error2
    jmp ush_res

error1:
    mov edi, err1
    call puts
    jmp sh_fin

error2:
    mov edi, err2
    call puts
    jmp sh_fin
