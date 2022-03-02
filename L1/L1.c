#include <stdio.h>

#include "funcs.h"

int main() {
    int n = 0;

    puts(
        "Zadacha №11, Krylov Artem Vyacheslavovich, IKPI-14\n"
        "(2 * d - 96 * a) / (34 / b - a + 1)");

    void (*arr[])() = {f_ch, f_uch, f_shrt, f_ushrt};

    do {
        puts(
            "Viberite tip dannih:\n"
            "    1) Signed char\n"
            "    2) Unsigned char\n"
            "    3) Int\n"
            "    4) Unsigned int\n"
            "Dlya zaversheniya raboti vvetide 0");
        scanf("%d", &n);
        if (n) arr[n - 1]();
        puts("");

    } while (n);

    return 0;
}
