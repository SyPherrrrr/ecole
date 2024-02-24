#include <stdio.h>


void main() {
    int a;
    int b;
    int q;
    int r;

    printf("Entrez 1 nombres entier : ");
    scanf("%d", &a);
    printf("Entrez 1 nombre entier : ");
    scanf("%d", &b);

    q = a/b;
    r = a%b;
    printf("le quotient est %d et le reste est %d\n", q, r);
    printf("le quotient rationnel est : %d = %d x %d + %d", a, q, b ,r);


}