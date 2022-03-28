#include "funcs.h"

#include <stdio.h>

// (b + a) / (a - 1), if a > b
// 23, if a = b
// b * b / 8, if a < b

short a_shrt, b_shrt;
unsigned short a_ushrt, b_ushrt;

extern short f_shrt_asm();
extern unsigned short f_ushrt_asm();

void f_shrt() {
    puts("Vvedite zhacheniya a, b: [-32,768; 32,767]");
    scanf("%hi%hi", &a_shrt, &b_shrt);
    if (a_shrt < b_shrt) {
        if (b_shrt < -181 || b_shrt > 181) {
            puts("Ne podhodyasheye zhacneniye b");
            return;
        }
    } else if (a_shrt > b_shrt)
        if (a_shrt + b_shrt > 32767 || a_shrt + b_shrt < -32768) {
            puts("Ne podhodyashiye zhacneniya a i b");
            return;
        }

    printf("ASM: %hi\n", f_shrt_asm());

    short res;
    if (a_shrt > b_shrt)
        res = (b_shrt + a_shrt) / (a_shrt - 1);
    else if (a_shrt == b_shrt)
        res = 23;
    else if (a_shrt < b_shrt)
        res = b_shrt * b_shrt / 8;
    printf("C: %hi\n", res);
}

void f_ushrt() {
    puts("Vvedite zhacheniya a, b: [0; 65,535]");
    scanf("%hu%hu", &a_ushrt, &b_ushrt);
    if (a_ushrt < b_ushrt) {
        if (b_ushrt > 254) {
            puts("Ne podhodyasheye zhacneniye b");
            return;
        }
    } else if (a_ushrt > b_ushrt)
        if (a_ushrt + b_ushrt > 65535) {
            puts("Ne podhodyashiye zhacneniya a i b");
            return;
        }
    printf("ASM: %hu\n", f_ushrt_asm());

    unsigned short res;
    if (a_ushrt > b_ushrt)
        res = (b_ushrt + a_ushrt) / (a_ushrt - 1);
    else if (a_ushrt == b_ushrt)
        res = 23;
    else if (a_ushrt < b_ushrt)
        res = b_ushrt * b_ushrt / 8;
    printf("C: %hu\n", res);
}
