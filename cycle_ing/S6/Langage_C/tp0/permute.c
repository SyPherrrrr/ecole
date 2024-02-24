#include <stdio.h>

void main() {
    int A;
    int B;
    int C;
    int var;

    printf("Entrez 1 nombres entier : \n");
    scanf("%d", &A);
    printf("Entrez 1 nombre entier : \n");
    scanf("%d", &B);
    printf("Entrez 1 nombre entier : \n");
    scanf("%d", &C);
    printf("Tu as saisi A=%d B=%d C=%d\n", A, B, C);
    var = A;
    A=B;
    B=C;
    C=var;
    printf("Permuté, tu as A=%d B=%d C=%d\n", A, B, C);
}