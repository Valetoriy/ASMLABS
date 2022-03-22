#include <stdio.h>

#include "funcs.h"

int main() {
    int n = 0;

    puts(
        "Zadacha №11, Krylov Artem Vyacheslavovich, IKPI-14\n"
        "(b + a) / (a - 1), if a > b\n"
        "23, if a = b\n"
        "b * b / 8, if a < b\n");

    void (*arr[])() = {f_shrt, f_ushrt};

    do {
        puts(
            "Viberite tip dannih:\n"
            "    1) Signed short\n"
            "    2) Unsigned short\n"
            "Dlya zaversheniya raboti vvetide 0");
        scanf("%d", &n);
        if (n) arr[n - 1]();
        puts("");

    } while (n);

    return 0;
}
