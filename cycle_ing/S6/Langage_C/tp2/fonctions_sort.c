#include "fonctions_sort.h"


int croissant(int a, int b) {
    return a - b;
}

int decroissant(int a, int b) {
    return b - a;
}

int compareImpairsFirst(int a, int b) {
    if (a % 2 != 0 && b % 2 != 0) {
        // Si les deux sont impairs, comparer normalement (b - a)
        return b - a;
    } else if (a % 2 == 0 && b % 2 == 0) {
        // Si les deux sont pairs, comparer normalement (a - b)
        return a - b;
    } else {
        // Sinon, donner la priorité à l'élément impair
        return a % 2 == 0 ? 1 : -1;  // forme abrégée de : si a est pair renvoyer 1 sinon -1
    }
}

