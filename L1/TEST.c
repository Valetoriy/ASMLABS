#include <stdio.h>

char num_ch, den_ch, res_ch;
extern void f_ch_asm(char, char, char);
// (2 * d - 96 / a) / (34 / b - a + 1)

int main() {
    char a = 3, b = 3, d = -3;
    printf("a = %hhd, b = %hhd, d = %hhd\n", a, b, d);

    f_ch_asm(a, b, d);
    printf("A Num = %hhd, del = %hhd, res = %hhd\n", num_ch, den_ch, res_ch);

    num_ch = 2 * d - 96 / a;
    den_ch = 34 / b - a + 1;
    res_ch = num_ch / den_ch;
    printf("C Num = %hhd, del = %hhd, res = %hhd\n", num_ch, den_ch, res_ch);

    return 0;
}
