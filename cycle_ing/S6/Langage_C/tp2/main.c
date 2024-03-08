#include "rand.h"
#include "Tableau.h"
#include "MyQuickSort.h"
#include "TriBulle.h"
#include "fonctions_sort.h"
#include "horloge.h"


/*
//Pour tester les algo de tri un par un
int main() {


    int size = 20;
    int tab[size];

    // Tableau random
    RandInit();
    InitTabRandom(tab, 20, 0, 30);

    // Choisir l'algo de tri :
    MyQuickSort(tab, 0, size - 1, decroissant);
    //TriBulle(tab, 0, size - 1, decroissant);

    // Affichage tableau
    printTab(tab, size);


    return 0;
}
*/


/*
// Pour comprarer les algo de tri et avoir leurs temps d'execution
int main() {

    int size = 10000;

    void (*tab_fonctions[])(int *tab, int premier, int dernier, int (*compare)(int, int))    = {MyQuickSort, TriBulle};

    horloge(tab_fonctions, 2, croissant, size);

}
*/