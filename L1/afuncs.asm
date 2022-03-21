; section .text
    extern num_ch, den_ch, res_ch
    ; extern num_uch, den_uch, res_uch
    ; extern num_shrt, den_shrt, res_shrt
    ; extern num_ushrt, den_ushrt, res_ushrt

    global f_ch_asm
    ; global f_uch_asm
    ; global f_shrt_asm
    ; global f_ushrt_asm

f_ch_asm:
    push rbp
    mov rbp, rsp

    mov al, 2
    cbw
    imul edx ; 2 * d
    mov bx, ax
    mov al, 96
    cbw
    idiv edi ; 96 / a
    sub bx, ax ; 2 * d - 96 / a
    mov [num_ch], bx

    mov al, 34
    cbw
    idiv esi ; 34 / b
    mov ebx, edi
    sub al, bl
    inc al
    mov [den_ch], al

    mov al, [num_ch]
    mov bl, [den_ch]
    cbw
    idiv bl
    mov [res_ch], al

    mov rsp,rbp
    pop rbp
    ret
        
; f_uch_asm:
;     push rbp
;     mov rbp, rsp
; 
;     mov rsp,rbp
;     pop rbp
;     ret
; 
; f_shrt_asm:
;     push rbp
;     mov rbp, rsp
; 
;     mov rsp,rbp
;     pop rbp
;     ret
; 
; f_ushrt_asm:
;     push rbp
;     mov rbp, rsp
; 
;     mov rsp,rbp
;     pop rbp
;     ret
