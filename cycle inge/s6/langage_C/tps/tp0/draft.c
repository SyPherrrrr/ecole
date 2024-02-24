#include <stdio.h>

int main() {
    int arr[] = {1, 2, 3, 4, 5};
    int *ptr = arr;  // Initialisation du pointeur avec l'adresse du premier élément du tableau

    printf("Avant l'incrémentation : %d\n", *ptr);

    // Incrémentation du pointeur
    ptr++;

    printf("Après l'incrémentation : %d\n", *ptr);

    return 0;
}
