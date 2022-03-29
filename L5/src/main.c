#include <stdio.h>

float num, den, res;
float a, b;
int d;

extern void afunc();

int main() {
    puts(
        "Zadacha №11, Krylov Artem Vyacheslavovich, IKPI-14\n"
        "(2 * d - 96 / a) / (34 / b - a + 1)\n"
        "a, b: [1.2E-38; 3.4E+38]\n"
        "d: [-2,147,483,648; 2,147,483,647]");

    puts("Vvedite a, b i d:");
    scanf("%f%f%d", &a, &b, &d);

    puts("S pomoshyu ASM:");
    afunc();
    printf("Num = %.1f, den = %.1f, res = %.1f\n", num, den, res);

    puts("S pomoshyu C:");
    num = 2 * d - 96 / a;
    den = 34 / b - a + 1;
    res = num / den;
    printf("Num = %.1f, den = %.1f, res = %.1f\n", num, den, res);

    return 0;
}
