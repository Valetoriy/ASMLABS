extern num, den, res
extern a, b, d
global afunc

section .text
afunc:
    mov eax, [d]
    add eax, eax ; 2 * d
    cvtsi2ss xmm0, eax

    mov eax, 96
    cvtsi2ss xmm1, eax
    movss xmm2, [a]
    divss xmm1, xmm2 ; 96 / a

    subss xmm0, xmm1 ; 2 * d - 96 / a
    movss [num], xmm0

    mov eax, 34
    cvtsi2ss xmm0, eax
    movss xmm1, [b]
    divss xmm0, xmm1 ; 34 / b
    movss xmm1, [a]
    subss xmm0, xmm1 ; 34 / b - a
    mov eax, 1
    cvtsi2ss xmm1, eax
    addss xmm0, xmm1 ; 34 / b - a + 1
    movss [den], xmm0

    movss xmm1, [num]
    divss xmm1, xmm0
    movss [res], xmm1

    ret
