section .data
    extern num_ch, den_ch, res_ch, a_ch, b_ch, d_ch
    extern num_uch, den_uch, res_uch, a_uch, b_uch, d_uch
    extern num_shrt, den_shrt, res_shrt, a_shrt, b_shrt, d_shrt
    extern num_ushrt, den_ushrt, res_ushrt, a_ushrt, b_ushrt, d_ushrt

    global f_ch_asm
    global f_uch_asm
    global f_shrt_asm
    global f_ushrt_asm

section .text
f_ch_asm:
    mov al, 2
    imul byte [d_ch] ; 2 * d
    mov bl, al
    mov al, 96
    cbw
    idiv byte [a_ch] ; 96 / a
    sub bl, al ; 2 * d - 96 / a
    mov [num_ch], bl

    mov al, 34
    cbw
    idiv byte [b_ch] ; 34 / b
    sub al, [a_ch] ; - a
    inc al
    mov [den_ch], al

    mov al, [num_ch]
    cbw
    idiv byte [den_ch]
    mov [res_ch], al

    ret
        
f_uch_asm:
    mov al, 2
    mul byte [d_uch] ; 2 * d
    mov bl, al
    mov al, 96
    cbw
    div byte [a_uch] ; 96 / a
    sub bl, al ; 2 * d - 96 / a
    mov [num_uch], bl

    mov al, 34
    cbw
    div byte [b_uch] ; 34 / b
    sub al, [a_uch] ; - a
    inc al
    mov [den_uch], al

    mov al, [num_uch]
    xor ah, ah
    div byte [den_uch]
    mov [res_uch], al

    ret

f_shrt_asm:
    mov ax, 2
    imul word [d_shrt] ; 2 * d
    mov bx, ax
    mov ax, 96
    cwd
    idiv word [a_shrt] ; 96 / a
    sub bx, ax ; 2 * d - 96 / a
    mov [num_shrt], bx

    mov ax, 34
    cwd
    idiv word [b_shrt] ; 34 / b
    sub ax, [a_shrt] ; - a
    inc ax
    mov [den_shrt], ax

    mov ax, [num_shrt]
    cwd
    idiv word [den_shrt]
    mov [res_shrt], ax

    ret

f_ushrt_asm:
    mov ax, 2
    mul word [d_ushrt] ; 2 * d
    mov bx, ax
    mov ax, 96
    cwd
    div word [a_ushrt] ; 96 / a
    sub bx, ax ; 2 * d - 96 / a
    mov [num_ushrt], bx

    mov ax, 34
    cwd
    div word [b_ushrt] ; 34 / b
    sub ax, [a_ushrt] ; - a
    inc ax
    mov [den_ushrt], ax

    mov ax, [num_ushrt]
    xor dx, dx
    div word [den_ushrt]
    mov [res_ushrt], ax

    ret
