#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "horloge.h"
#include "rand.h" // Pour l'initialisation du tableau aléatoire
#include "fonctions_sort.h" // Pour le type de tri
#include "Tableau.h"



void horloge(int (*tab_fonctions[])(int *tab, int premier, int dernier, int (*compare)(int, int)),
                 unsigned int nb_fonctions,  int (*compare)(int, int), int size) {

    int tab[size];
    double tab_time[nb_fonctions];

    //  Définition d'un tableau qui sera une copie de tab. Ce qui permet
    //  de le réinitialiser avec les valeurs de tab pour chaque fonction de tri
    int *tab_to_sort = NULL;
    tab_to_sort = (int *)malloc(size * sizeof(int));


    RandInit();
    InitTabRandom(tab, size, 0, 20);



    for (int i = 0; i<nb_fonctions; i++) {

        // Copie du tableau initiale à trier
        tab_to_sort = memcpy(tab_to_sort, tab, size* sizeof(int));

        // Horloge tac - tic
        double tic = clock();
        tab_fonctions[i](tab_to_sort, 0, size - 1, compare);
        double tac = clock();
        double time = tac - tic;
        tab_time[i] = (time/ CLOCKS_PER_SEC);

    }
    printTab(tab_to_sort, size);
    printTabTimer(tab_time, nb_fonctions);
}