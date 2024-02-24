#include "comparateur.h"
#include "rand.h" // Pour l'initialisation du tableau aléatoire
#include "fonctions_sort.h" // Pour le type de tri
#include "Tableau.h"



void comparateur(int (*tab_fonctions[3])(int *tab, int premier, int dernier, int (*compare)(int, int))) {

    int size = 10;
    int tab[size];

    nb_fonctions = 3
    int tab_time[nb_fonctions];

    RandInit();
    InitTabRandom(tab, size, 0, 20);

    for (int i = 0; i<nb_fonctions; i++) {
        clock_t tic = clock();
        tab_fonctions[i](tab, 0, size - 1, croissant)
        clock_t tac = clock();
        double time = tac - tic;
        tab_time[i] = time

    printTab(tab_time, nb_fonctions)

    }

}