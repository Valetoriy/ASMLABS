extern A, d, c
global afunc

section .text
afunc:
    push rbp
    mov rbp, rsp

    xor dl, dl

    mov al, [d]
    mov bl, [c]

    mov ecx, 4
    funcloop:
    cmp al, [A + ecx]
    jg loopend
    cmp bl, [A + ecx]
    jl loopend
    inc dl

    loopend:
    dec cl
    cmp cl, 0
    jge funcloop

    mov al, dl
    mov rsp, rbp
    pop rbp
    ret
