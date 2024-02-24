#include <stdio.h>
#include <math.h>

void main() {
    int a;
    int b;
    int c;
    int delta;
    float r;
    float r1;
    float r2;

    printf("Entrez 1 nombres entier : ");
    scanf("%d", &a);
    printf("Entrez 1 nombres entier : ");
    scanf("%d", &b);
    printf("Entrez 1 nombres entier : ");
    scanf("%d", &c);

    delta = b*b - 4*a*c;

    if (delta < 0) {
        printf("Il n'y a pas de racines réelles\n");
    } else {
        if ( delta == 0){
            r = (- b) / (2*a);
            printf("La seule racine est %f \n", r);
        }
        else {
            r1 = (-b + sqrt(delta))/ (2*a);
            r2 = (-b - sqrt(delta))/ (2*a);
            printf("Les racines sont %f et %f\n", r1, r2);
        }
    }
}