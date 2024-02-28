#include <stdio.h>
#include <stdlib.h>
#include "rand.h"
#include "Tableau.h"
#include "MyQuickSort.h"
#include "TriBulle.h"
#include "fonctions_sort.h"
#include "comparateur.h"


/*  Pour tester les algo de tri
int main() {


    int size = 20;
    int tab[size];

    RandInit();
    InitTabRandom(tab, 20, 0, 30);
    TriBulle(tab, 0, size - 1, decroissant);

    printTab(tab, size);



    return 0;
}
*/


int main() {

    void (*tab_fonctions[])(int *tab, int premier, int dernier, int (*compare)(int, int))    = {MyQuickSort, TriBulle};

    comparateur(tab_fonctions, 2, croissant);



}