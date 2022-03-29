#include <stdio.h>

#define N 5

signed char A[N];
signed char d, c;

extern signed char afunc();

int main() {
    puts(
        "Zadacha №11, Krylov Artem Vyacheslavovich, IKPI-14\n"
        "Nayti skolko elem massiva A udovletroryayut usloviyu:\n"
        "d <= A[i] <= c, [-128; 127]\n");

    puts("Vvedite d i c:");
    scanf("%hhi%hhi", &d, &c);
    puts("Vvedite 5 elem A:");
    for (int i = 0; i < N; ++i) scanf("%hhi", &A[i]);

    printf("ASM: %hhi\n", afunc());

    signed char count = 0;
    for (int i = 0; i < N; ++i)
        if (d <= A[i] && A[i] <= c) ++count;
    printf("C: %hhi\n", count);

    return 0;
}
