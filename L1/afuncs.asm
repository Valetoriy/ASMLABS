global funct

extern gaa, gbb

funct:
    push ebp
    mov ebp, esp

    mov eax, [gaa]
    add eax, [gbb]

    mov esp,ebp
    pop ebp
    ret
