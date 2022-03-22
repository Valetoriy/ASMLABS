#include "funcs.h"

#include <stdio.h>

// (2 * d - 96 / a) / (34 / b - a + 1)
// numerator, denominator, res

signed char num_ch, den_ch, res_ch, a_ch, b_ch, d_ch;
unsigned char num_uch, den_uch, res_uch, a_uch, b_uch, d_uch;
short num_shrt, den_shrt, res_shrt, a_shrt, b_shrt, d_shrt;
unsigned short num_ushrt, den_ushrt, res_ushrt, a_ushrt, b_ushrt, d_ushrt;
extern void f_ch_asm();
extern void f_uch_asm();
extern void f_shrt_asm();
extern void f_ushrt_asm();

void f_ch() {
    puts("Vvedite zhacheniya a, b i d: [-128; 127]");
    scanf("%hhd%hhd%hhd", &a_ch, &b_ch, &d_ch);

    puts("S pomoshyu ASM:");
    f_ch_asm();
    printf("Num = %hhd, den = %hhd, res = %hhd\n", num_ch, den_ch, res_ch);

    puts("S pomoshyu C:");
    num_ch = 2 * d_ch - 96 / a_ch;
    den_ch = 34 / b_ch - a_ch + 1;
    res_ch = num_ch / den_ch;
    printf("Num = %hhd, den = %hhd, res = %hhd\n", num_ch, den_ch, res_ch);
}

void f_uch() {
    puts("Vvedite zhacheniya a, b i d: [0; 255]");
    scanf("%hhu%hhu%hhu", &a_uch, &b_uch, &d_uch);

    puts("S pomoshyu ASM:");
    f_uch_asm();
    printf("Num = %hhu, den = %hhu, res = %hhd\n", num_uch, den_uch, res_uch);

    puts("S pomoshyu C:");
    num_uch = 2 * d_uch - 96 / a_uch;
    den_uch = 34 / b_uch - a_uch + 1;
    res_uch = num_uch / den_uch;
    printf("Num = %hhu, den = %hhu, res = %hhu\n", num_uch, den_uch, res_uch);
}

void f_shrt() {
    puts("Vvedite zhacheniya a, b i d: [-32,768; 32,767]");
    scanf("%hi%hi%hi", &a_shrt, &b_shrt, &d_shrt);

    puts("S pomoshyu ASM:");
    f_shrt_asm();
    printf("Num = %hi, den = %hi, res = %hi\n", num_shrt, den_shrt, res_shrt);

    puts("S pomoshyu C:");
    num_shrt = 2 * d_shrt - 96 / a_shrt;
    den_shrt = 34 / b_shrt - a_shrt + 1;
    res_shrt = num_shrt / den_shrt;
    printf("Num = %hi, den = %hi, res = %hi\n", num_shrt, den_shrt, res_shrt);
}

void f_ushrt() {
    puts("Vvedite zhacheniya a, b i d: [0; 65,535]");
    scanf("%hu%hu%hu", &a_ushrt, &b_ushrt, &d_ushrt);

    puts("S pomoshyu ASM:");
    f_ushrt_asm();
    printf("Num = %hu, den = %hu, res = %hu\n", num_ushrt, den_ushrt, res_ushrt);

    puts("S pomoshyu C:");
    num_ushrt = 2 * d_ushrt - 96 / a_ushrt;
    den_ushrt = 34 / b_ushrt - a_ushrt + 1;
    res_ushrt = num_ushrt / den_ushrt;
    printf("Num = %hu, den = %hu, res = %hu\n", num_ushrt, den_ushrt, res_ushrt);
}
