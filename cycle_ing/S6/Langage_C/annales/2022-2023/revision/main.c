#include <stdio.h>
#include <stdlib.h>
#include "fonctionStats.h"


void AfficherStats(struct SStat* stats)
{
    if (stats == NULL) return;

    for (unsigned int i = 0; i < 256; ++i)
    {
        printf("%d (%c):\t%d\n", i, i>32 ? i : ' ', stats->Stat[i]);
    }
}

int main() {
    struct SStat statistiques = fonctionStats("./fichier_test.txt"); // mettre le chemin par rapport au fichier
    AfficherStats(&statistiques);                                    // executable


    struct SNoeud* tab[6];

    tab[0]=CreerFeuille('F', 5);
    tab[1]=CreerFeuille('A', 10);
    tab[2]=CreerFeuille('B', 10);
    tab[3]=CreerFeuille('D', 15);
    tab[4]=CreerFeuille('C', 25);
    tab[5]=CreerFeuille('E', 35);

    return (0);
}