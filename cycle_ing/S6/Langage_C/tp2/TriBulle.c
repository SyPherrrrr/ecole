#include <stdio.h>
#include "TriBulle.h"
#include "util.h"


void TriBulle(int *tab, int premier, int dernier, int (*compare)(int, int)) {

    for (int i = dernier; i > premier; i--) {
        for (int j = premier; j < dernier; j++) {
            if (compare(tab[j], tab[j + 1]) > 0) {
                swap(&tab[j], &tab[j+1]);
            }
        }
    }
}