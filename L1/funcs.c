#include "funcs.h"

#include <stdio.h>

// (2 * d - 96 / a) / (34 / b - a + 1)
// numerator, denominator, res

char num_ch, den_ch, res_ch;
unsigned char num_uch, den_uch, res_uch;
short num_shrt, den_shrt, res_shrt;
unsigned short num_ushrt, den_ushrt, res_ushrt;
extern void f_ch_asm(char, char, char);
extern void f_uch_asm(unsigned char, unsigned char, unsigned char);
extern void f_shrt_asm(short, short, short);
extern void f_ushrt_asm(unsigned short, unsigned short, unsigned short);

void f_ch() {
    char a, b, d;
    puts("Vvedite zhacheniya a, b i d: [-128; 127]");
    scanf("%hhd%hhd%hhd", &a, &b, &d);

    puts("S pomoshyu ASM:");
    f_ch_asm(a, b, d);
    printf("Num = %hhd, del = %hhd, res = %hhd\n", num_ch, den_ch, res_ch);

    puts("S pomoshyu C:");
    num_ch = 2 * d - 96 / a;
    den_ch = 34 / b - a + 1;
    res_ch = num_ch / den_ch;
    printf("Num = %hhd, del = %hhd, res = %hhd\n", num_ch, den_ch, res_ch);
};

void f_uch() {
    unsigned char a, b, d;
    puts("Vvedite zhacheniya a, b i d: [0; 255]");
    scanf("%hhu%hhu%hhu", &a, &b, &d);
    puts("S pomoshyu C:");
    puts("S pomoshyu ASM:");
    f_uch_asm(a, b, d);
};

void f_shrt() {
    short a, b, d;
    puts("Vvedite zhacheniya a, b i d: [-32,768; 32,767]");
    scanf("%hi%hi%hi", &a, &b, &d);
    puts("S pomoshyu C:");
    puts("S pomoshyu ASM:");
    f_shrt_asm(a, b, d);
};

void f_ushrt() {
    unsigned short a, b, d;
    puts("Vvedite zhacheniya a, b i d: [0; 65,535]");
    scanf("%hu%hu%hu", &a, &b, &d);
    puts("S pomoshyu C:");
    puts("S pomoshyu ASM:");
    f_ushrt_asm(a, b, d);
};
